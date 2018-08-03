/*
 * Copyright 2016-2017 Spotify AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.spotify.syncdeps;

import static com.google.common.collect.ImmutableMap.toImmutableMap;
import static java.nio.charset.StandardCharsets.UTF_8;
import static java.nio.file.attribute.PosixFilePermissions.asFileAttribute;
import static java.nio.file.attribute.PosixFilePermissions.fromString;
import static java.util.stream.Collectors.joining;

import com.google.common.base.Strings;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.hash.HashCode;
import com.google.common.io.Resources;
import com.spotify.bazeltools.cliutils.Cli;
import com.spotify.syncdeps.cli.Options;
import com.spotify.syncdeps.config.Dependencies;
import com.spotify.syncdeps.maven.MavenDependencies;
import com.spotify.syncdeps.model.MavenCoords;
import com.spotify.syncdeps.model.MavenDependency;
import com.spotify.syncdeps.model.PypiDependency;
import com.spotify.syncdeps.pypi.PypiDependencies;
import com.spotify.syncdeps.util.PathUtils;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UncheckedIOException;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.FileAttribute;
import java.nio.file.attribute.PosixFilePermission;
import java.text.ParseException;
import java.util.List;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class Main {

  private static final Logger LOG = LoggerFactory.getLogger(Main.class);

  private static final FileAttribute<Set<PosixFilePermission>> FILE_PERMISSIONS =
      asFileAttribute(fromString("rw-r--r--"));
  private static final FileAttribute<Set<PosixFilePermission>> DIR_PERMISSIONS =
      asFileAttribute(fromString("rwxr-xr-x"));

  private Main() {}

  public static void main(String[] args) throws IOException {
    final Options options = Options.parse(args);

    Cli.configureLogging("sync-deps", options.verbose());

    try {
      run(options);
    } catch (final Exception e) {
      LOG.error("A fatal error occurred", e);
      System.exit(1);
    }
  }

  private static void run(final Options options)
      throws IOException, ParseException, InterruptedException {
    final Path relativeLockFile = options.workspaceDirectory().relativize(options.lockFile());
    if (options.verify()) {
      LOG.info("Verifying integrity of @|bold {}|@", relativeLockFile);

      final String lockContents = createLockContents(options);
      final boolean lockFileUpToDate =
          Files.exists(options.lockFile())
              && new String(Files.readAllBytes(options.lockFile()), UTF_8).equals(lockContents);
      if (!lockFileUpToDate) {
        LOG.error(
            "Integrity violation in @|bold {}|@; please run @|bold sync-deps/run|@",
            relativeLockFile);
        System.exit(1);
      }
    } else {
      LOG.info("Reading dependency graph");
      final Dependencies dependencies = Dependencies.parseYaml(options.inputFile());

      LOG.info("Resolving pypi dependencies");
      // TODO(dflemstr): use bootstrapped pip
      final ImmutableSet<PypiDependency> pypiDependencies =
          PypiDependencies.resolveDependencies(options.pip(), dependencies);
      LOG.info("Resolved {} pypi dependencies", pypiDependencies.size());

      LOG.info("Resolving maven dependencies");
      final ImmutableSet<MavenDependency> mavenDependencies =
          MavenDependencies.resolveDependencies(dependencies);
      LOG.info("Resolved {} maven dependencies", mavenDependencies.size());

      final Path outputFile = options.outputFile();
      final Path jvmDirectory = options.jvmDirectory();
      final Path pypiDirectory = options.pypiDirectory();
      final Path relativeOutputFile = options.workspaceDirectory().relativize(outputFile);
      final Path relativeJvmDirectory = options.workspaceDirectory().relativize(jvmDirectory);
      final Path relativePypiDirectory = options.workspaceDirectory().relativize(pypiDirectory);

      final Path newOutputFile =
          writeNewOutputFile(options, dependencies.options(), mavenDependencies, pypiDependencies);
      final Path newJvmDirectory = writeNewJvmDirectory(options, mavenDependencies);
      final Path newPypiDirectory = writeNewPypiDirectory(options, pypiDependencies);

      LOG.info("Updating @|bold {}|@", relativeJvmDirectory);
      PathUtils.syncRecursive(newJvmDirectory, jvmDirectory);
      PathUtils.removeRecursive(newJvmDirectory);

      LOG.info("Updating @|bold {}|@", relativePypiDirectory);
      PathUtils.syncRecursive(newPypiDirectory, pypiDirectory);
      PathUtils.removeRecursive(newPypiDirectory);

      LOG.info("Updating @|bold {}|@", relativeOutputFile);
      Files.deleteIfExists(outputFile);
      Files.move(newOutputFile, outputFile);

      LOG.info("Updating @|bold {}|@", relativeLockFile);
      Files.write(options.lockFile(), createLockContents(options).getBytes(UTF_8));

      LOG.info("Done");
    }
  }

  private static String createLockContents(final Options options) throws IOException {
    final StringWriter stringWriter = new StringWriter();
    try (final Stream<Path> jvmFiles = Files.walk(options.jvmDirectory());
        final Stream<Path> pypiFiles = Files.walk(options.pypiDirectory());
        final PrintWriter out = new PrintWriter(stringWriter)) {
      out.println("version\t1");
      Stream.concat(
              Stream.concat(Stream.of(options.inputFile(), options.outputFile()), jvmFiles),
              pypiFiles)
          .sorted()
          .forEachOrdered(file -> describeFile(options.workspaceDirectory(), file, out));
    }
    return stringWriter.toString();
  }

  private static void describeFile(
      final Path workspaceDirectory, final Path path, final PrintWriter out) {
    final Path relativeFileName = workspaceDirectory.relativize(path);
    if (Files.isDirectory(path)) {
      // Do nothing
    } else if (Files.isSymbolicLink(path)) {
      out.printf("link\t%s\t%s\t%s\n", Strings.repeat("-", 32), relativeFileName, readLink(path));
    } else if (Files.isRegularFile(path)) {
      final HashCode sha256;

      try {
        sha256 = PathUtils.sha256(path);
      } catch (IOException e) {
        throw new UncheckedIOException("Could not compute sha256 of " + path, e);
      }

      out.printf("file\t%s\t%s\n", sha256, relativeFileName);
    } else {
      throw new IllegalStateException("Path " + path + " is an unsupported type");
    }
  }

  private static Path writeNewOutputFile(
      final Options options,
      final Dependencies.Options dependencyOptions,
      final ImmutableSet<MavenDependency> mavenDependencies,
      final ImmutableSet<PypiDependency> pypiDependencies)
      throws IOException {
    final Path newOutputFile =
        Files.createTempFile(
            options.outputFile().getParent(), "workspace-", ".bzl", FILE_PERMISSIONS);

    try (BufferedWriter writer = Files.newBufferedWriter(newOutputFile, UTF_8);
        final PrintWriter out = new PrintWriter(writer)) {
      final String header =
          Resources.toString(Resources.getResource(Main.class, "workspace-header.bzl"), UTF_8);

      final String mavenResolversList =
          dependencyOptions
              .mavenResolvers()
              .stream()
              .map(Dependencies.MavenResolver::url)
              .map(url -> "\"" + url + "\"")
              .collect(joining(", ", "[", "]"));
      out.write(header.replace("[\"%MAVEN_RESOLVERS%\"]", mavenResolversList));

      out.write("\n");
      out.write("def maven_dependencies(callback=None):\n");
      out.write("  if callback == None:\n");
      out.write("    callback = default_maven_callback\n");

      for (final MavenDependency mavenDependency : mavenDependencies) {
        // TODO: fix licenses
        final String name = "\"" + mavenDependency.coords().workspaceName() + "\"";
        final String jarPath = "\"" + mavenDependency.path(null) + "\"";
        final String jarSha256 = mavenDependency.sha256().map(s -> "\"" + s + "\"").orElse("None");
        final String srcjarPath;
        if (mavenDependency.sourcesSha256().isPresent()) {
          srcjarPath = "\"" + mavenDependency.path("sources") + "\"";
        } else {
          srcjarPath = "None";
        }
        final String srcjarSha256 =
            mavenDependency.sourcesSha256().map(s -> "\"" + s + "\"").orElse("None");
        final String deps =
            mavenDependency
                .dependencies()
                .keySet()
                .stream()
                .map(MavenCoords::workspaceName)
                .map(n -> "\"" + n + "\"")
                .collect(joining(", ", "[", "]"));
        final String neverlink = mavenDependency.neverLink() ? "True" : "False";
        final String isScala = mavenDependency.kind().isScala() ? "True" : "False";

        out.printf(
            "  callback(name=%1$s, licenses=[\"notice\"], jar_path=%2$s, jar_sha256=%3$s,"
                + " srcjar_path=%4$s, srcjar_sha256=%5$s, deps=%6$s, neverlink=%7$s, is_scala=%8$s)\n",
            name, jarPath, jarSha256, srcjarPath, srcjarSha256, deps, neverlink, isScala);
      }

      out.write("\n");
      out.write("def pypi_dependencies(callback=None):\n");
      out.write("  if callback == None:\n");
      out.write("    callback = default_pypi_callback\n");

      for (final PypiDependency pypiDependency : pypiDependencies) {
        final String name = "\"" + pypiDependency.name() + "\"";
        final String url = "\"" + pypiDependency.url() + "\"";
        final String sha256 = pypiDependency.sha256().map(s -> "\"" + s + "\"").orElse("None");
        final String isBinary = pypiDependency.isBinary() ? "True" : "False";
        final String main = pypiDependency.main().map(s -> "\"" + s + "\"").orElse("None");

        final String deps =
            pypiDependency
                .dependencies()
                .keySet()
                .stream()
                .map(n -> "\"" + n + "\"")
                .collect(joining(", ", "[", "]"));

        out.printf(
            "  callback(name=%1s, url=%2s, sha256=%3s, is_binary=%4s, main=%5s, deps=%6s)\n",
            name, url, sha256, isBinary, main, deps);
      }
    }

    return newOutputFile;
  }

  private static Path writeNewPypiDirectory(
      final Options options, final ImmutableSet<PypiDependency> pypiDependencies)
      throws IOException {
    final Path buildifier = options.buildifier();
    final Path newPypiDirectory =
        Files.createTempDirectory(options.thirdPartyDirectory(), "pypi-", DIR_PERMISSIONS);
    final Path buildFile = newPypiDirectory.resolve("BUILD");

    try (final Writer writer = Files.newBufferedWriter(buildFile, UTF_8);
        final PrintWriter out = new PrintWriter(writer)) {
      boolean needsSeparator = false;

      for (final PypiDependency dependency : pypiDependencies) {
        if (needsSeparator) {
          out.print('\n');
        }
        needsSeparator = true;
        out.printf("alias(\n");
        out.printf("    name = \"%s\",\n", dependency.name());
        out.printf("    actual = \"@%s\",\n", dependency.name());

        if (dependency.isPublic()) {
          out.printf("    visibility=[\"//visibility:public\"],\n");
        } else {
          out.printf("    visibility=[\"//3rdparty:__subpackages__\"],\n");
        }

        out.printf(")\n");
      }
    }

    runBuildifier(buildifier, buildFile);

    return newPypiDirectory;
  }

  private static Path writeNewJvmDirectory(
      final Options options, final ImmutableSet<MavenDependency> mavenDependencies)
      throws IOException {
    final Path buildifier = options.buildifier();
    final Path newJvmDirectory =
        Files.createTempDirectory(options.thirdPartyDirectory(), "jvm-", DIR_PERMISSIONS);

    final ImmutableMap<MavenCoords, MavenDependency> dependenciesByCoords =
        mavenDependencies
            .stream()
            .collect(toImmutableMap(MavenDependency::coords, Function.identity()));

    mavenDependencies
        .stream()
        // Only write BUILD files for public dependencies; private ones are inlined
        .filter(MavenDependency::isPublic)
        .collect(Collectors.groupingBy(d -> d.coords().groupId()))
        .forEach(
            (groupId, groupDependencies) ->
                writeJvmGroup(
                    newJvmDirectory, buildifier, groupId, groupDependencies, dependenciesByCoords));
    return newJvmDirectory;
  }

  private static void writeJvmGroup(
      final Path newJvmDirectory,
      final Path buildifier,
      final String groupId,
      final List<MavenDependency> groupDependencies,
      final ImmutableMap<MavenCoords, MavenDependency> dependenciesByCoords) {
    final Path groupIdDir = newJvmDirectory.resolve(MavenCoords.groupRelativePackageName(groupId));

    if (!Files.exists(groupIdDir)) {
      try {
        Files.createDirectories(groupIdDir);
      } catch (final IOException e) {
        throw new UncheckedIOException("Could not create dir " + groupIdDir, e);
      }
    }

    final Path buildFile = groupIdDir.resolve("BUILD");
    try (final Writer writer = Files.newBufferedWriter(buildFile, UTF_8);
        final PrintWriter out = new PrintWriter(writer)) {
      boolean needsSeparator = false;

      for (final MavenDependency dependency : groupDependencies) {

        if (needsSeparator) {
          out.print('\n');
        }
        needsSeparator = true;
        out.printf("alias(\n");
        out.printf(
            "    name = \"%s\",\n", dependency.coords().artifactLabel(dependency.kind().isScala()));
        out.printf("    actual = \"@%s\",\n", dependency.coords().workspaceName());

        if (dependency.isPublic()) {
          out.printf("    visibility=[\"//visibility:public\"],\n");
        } else {
          out.printf("    visibility=[\"//3rdparty:__subpackages__\"],\n");
        }

        out.printf(")\n");
      }
    } catch (IOException e) {
      throw new UncheckedIOException("Could not write file " + buildFile, e);
    }

    runBuildifier(buildifier, buildFile);
  }

  private static void runBuildifier(final Path buildifier, final Path buildFile) {
    final Process process;
    try {
      process =
          new ProcessBuilder()
              .command(buildifier.toString(), buildFile.toString())
              .inheritIO()
              .start();
    } catch (IOException e) {
      throw new UncheckedIOException("Could not run buildifier on " + buildFile, e);
    }

    final int exitCode;
    try {
      exitCode = process.waitFor();
    } catch (InterruptedException e) {
      throw new IllegalStateException("Interrupted while running buildifier on " + buildFile, e);
    }

    if (exitCode != 0) {
      throw new IllegalStateException("Could not run buildifier on " + buildFile);
    }
  }

  private static void writeDependencies(
      final PrintWriter out,
      final ImmutableMap<MavenCoords, Boolean> transitiveDependencies,
      final ImmutableMap<MavenCoords, MavenDependency> dependenciesByCoords) {
    // Add all non-public dependencies as JAR references
    transitiveDependencies.forEach(
        (mavenCoords, isPublic) -> {
          if (!isPublic) {
            printWorkspaceJarReference(out, mavenCoords);

            // ... but we need to also add the transitive dependencies of that dependency
            writeDependencies(
                out, dependenciesByCoords.get(mavenCoords).dependencies(), dependenciesByCoords);
          }
        });

    // Add all public dependencies as references to their public //3rdparty/jvm paths
    transitiveDependencies.forEach(
        (mavenCoords, isPublic) -> {
          if (isPublic) {
            final MavenDependency mavenDependency = dependenciesByCoords.get(mavenCoords);
            out.printf(
                "        \"//3rdparty/jvm/%s:%s\",\n",
                mavenCoords.groupRelativePackageName(),
                mavenCoords.artifactLabel(mavenDependency.kind().isScala()));
          }
        });
  }

  private static void printWorkspaceJarReference(
      final PrintWriter out, final MavenCoords mavenCoords) {
    out.printf(
        "         \"//external:jar/%s/%s\",\n",
        mavenCoords.groupRelativePackageName(), mavenCoords.artifactPackagePathSegment());
  }

  private static Path readLink(final Path path) {
    try {
      return Files.readSymbolicLink(path);
    } catch (IOException e) {
      throw new UncheckedIOException("Could not read link " + path, e);
    }
  }
}
