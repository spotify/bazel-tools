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

import static java.nio.charset.StandardCharsets.UTF_8;
import static java.nio.file.attribute.PosixFilePermissions.asFileAttribute;
import static java.nio.file.attribute.PosixFilePermissions.fromString;
import static java.util.stream.Collectors.joining;

import com.google.common.base.Strings;
import com.google.common.collect.ImmutableSet;
import com.google.common.hash.HashCode;
import com.google.common.io.Resources;
import com.spotify.bazeltools.cliutils.Cli;
import com.spotify.syncdeps.cli.Options;
import com.spotify.syncdeps.config.Dependencies;
import com.spotify.syncdeps.model.GitHubDependency;
import com.spotify.syncdeps.model.MavenCoords;
import com.spotify.syncdeps.model.MavenDependency;
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

      LOG.info("Resolving dependencies");
      final ImmutableSet<MavenDependency> mavenDependencies =
          dependencies.toMavenLeafDependencies();
      final ImmutableSet<MavenCoords> mavenExcludedDependencies =
          dependencies.options().excludedDependencies();

      final ImmutableSet<GitHubDependency> gitHubDependencies =
          dependencies
              .github()
              .entrySet()
              .stream()
              .map(
                  e ->
                      GitHubDependency.create(
                          e.getKey(),
                          e.getValue().repo(),
                          e.getValue().commit(),
                          e.getValue().branch(),
                          e.getValue().tag()))
              .collect(ImmutableSet.toImmutableSet());

      final Path workspaceFile = options.workspaceFile();
      final Path repositoryFile = options.repositoryFile();
      final Path jvmDirectory = options.thirdPartyDirectory().resolve("jvm");
      final Path relativeWorkspaceFile = options.workspaceDirectory().relativize(workspaceFile);
      final Path relativeRepositoryFile = options.workspaceDirectory().relativize(repositoryFile);
      final Path relativeJvmDirectory = options.workspaceDirectory().relativize(jvmDirectory);

      final Path newWorkspaceFile =
          writeNewWorkspaceFile(
              options, dependencies.options(), mavenDependencies, mavenExcludedDependencies);

      final Path newRepositoryFile = writeNewRepositoryFile(options, gitHubDependencies);

      final Path newJvmDirectory = writeNewJvmDirectory(options, mavenDependencies);

      LOG.info("Updating @|bold {}|@", relativeJvmDirectory);
      PathUtils.syncRecursive(newJvmDirectory, jvmDirectory);
      PathUtils.removeRecursive(newJvmDirectory);

      LOG.info("Updating @|bold {}|@", relativeWorkspaceFile);
      Files.deleteIfExists(workspaceFile);
      Files.move(newWorkspaceFile, workspaceFile);

      LOG.info("Pinning maven dependencies...");
      if (0
          != new ProcessBuilder("bazel", "run", "@unpinned_maven//:pin")
              .directory(options.workspaceDirectory().toFile())
              .inheritIO()
              .start()
              .waitFor()) {
        LOG.error("Failed to pin maven dependencies (see console output for more info)");
        System.exit(1);
      }

      LOG.info("Running bazel sync...");
      Files.write(options.resolvedFile(), "resolved = []\n".getBytes(UTF_8));
      if (0
          != new ProcessBuilder(
                  "bazel",
                  "sync",
                  "--experimental_repository_resolved_file=" + options.resolvedFile())
              .directory(options.workspaceDirectory().toFile())
              .inheritIO()
              .start()
              .waitFor()) {
        LOG.error("Failed to run bazel sync (see console output for more info)");
        System.exit(1);
      }

      LOG.info("Updating @|bold {}|@", relativeRepositoryFile);
      Files.deleteIfExists(repositoryFile);
      Files.move(newRepositoryFile, repositoryFile);

      LOG.info("Updating @|bold {}|@", relativeLockFile);
      Files.write(options.lockFile(), createLockContents(options).getBytes(UTF_8));

      LOG.info("Done");
    }
  }

  private static String createLockContents(final Options options) throws IOException {
    final StringWriter stringWriter = new StringWriter();
    try (final Stream<Path> jvmFiles = Files.walk(options.jvmDirectory());
        final PrintWriter out = new PrintWriter(stringWriter)) {
      out.println("version\t1");
      Stream.concat(
              Stream.of(
                  options.inputFile(),
                  options.workspaceFile(),
                  options.repositoryFile(),
                  options.resolvedFile(),
                  options.mavenInstallFile()),
              jvmFiles)
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

  private static Path writeNewWorkspaceFile(
      final Options options,
      final Dependencies.Options dependencyOptions,
      final ImmutableSet<MavenDependency> mavenDependencies,
      final ImmutableSet<MavenCoords> mavenExcludedDependencies)
      throws IOException {
    final Path newOutputFile =
        Files.createTempFile(
            options.workspaceFile().getParent(), "workspace-", ".bzl", FILE_PERMISSIONS);

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
              .collect(joining(",\n            ", "[\n            ", "\n        ]"));

      final String artifactsList =
          mavenDependencies
              .stream()
              .map(
                  d ->
                      String.format(
                          "maven.artifact(group = \"%s\", artifact = \"%s\", version = \"%s\", neverlink = %s)",
                          d.coords().groupId(),
                          d.coords().artifactId(),
                          d.version(),
                          d.neverLink() ? "True" : "False"))
              .collect(joining(",\n            ", "[\n            ", "\n        ]"));

      final String excludedArtifactsList =
          mavenExcludedDependencies
              .stream()
              .map(
                  coords ->
                      String.format(
                          "maven.exclusion(group = \"%s\", artifact = \"%s\")",
                          coords.groupId(), coords.artifactId()))
              .collect(joining(",\n            ", "[\n            ", "\n        ]"));

      out.write(header);
      out.println();
      out.println("def maven_dependencies(install=None):");
      out.println("    if install == None:");
      out.println("        install = default_install");
      out.printf(
          "    install(%n"
              + "        artifacts=%s,%n"
              + "        repositories=%s,%n"
              + "        excluded_artifacts=%s,%n",
          artifactsList, mavenResolversList, excludedArtifactsList);

      if (dependencyOptions.versionConflictPolicy().isPresent()) {
        out.printf(
            "        version_conflict_policy=\"%s\",%n",
            dependencyOptions.versionConflictPolicy().get());
      }
      out.printf("    )%n");
    }

    return newOutputFile;
  }

  private static Path writeNewRepositoryFile(
      final Options options, final ImmutableSet<GitHubDependency> gitHubDependencies)
      throws IOException {
    final Path newOutputFile =
        Files.createTempFile(
            options.repositoryFile().getParent(), "repository-", ".bzl", FILE_PERMISSIONS);

    try (BufferedWriter writer = Files.newBufferedWriter(newOutputFile, UTF_8);
        final PrintWriter out = new PrintWriter(writer)) {
      final String header =
          Resources.toString(Resources.getResource(Main.class, "repository-header.bzl"), UTF_8);

      out.write(header);

      out.println();
      out.println();
      out.println("def repositories(github_callback=None):");
      out.println("    _frozen_repos()");
      out.println("    if github_callback == None:");
      out.println("        github_callback = default_github_callback");

      for (final GitHubDependency dependency : gitHubDependencies) {
        final String name = dependency.name();
        final String repository = dependency.repository();
        if (dependency.commit().isPresent()) {
          out.printf(
              "    github_callback(name=\"%1$s\", repository=\"%2$s\", commit=\"%3$s\")\n",
              name, repository, dependency.commit().get());
        } else if (dependency.tag().isPresent()) {
          out.printf(
              "    github_callback(name=\"%1$s\", repository=\"%2$s\", tag=\"%3$s\")\n",
              name, repository, dependency.tag().get());
        } else if (dependency.branch().isPresent()) {
          out.printf(
              "    github_callback(name=\"%1$s\", repository=\"%2$s\", branch=\"%3$s\")\n",
              name, repository, dependency.branch().get());
        } else {
          out.printf(
              "    github_callback(name=\"%1$s\", repository=\"%2$s\", branch=\"master\")\n",
              name, repository);
        }
      }
    }

    return newOutputFile;
  }

  private static Path writeNewJvmDirectory(
      final Options options, final ImmutableSet<MavenDependency> mavenDependencies)
      throws IOException {
    final Path buildifier = options.buildifier();
    final Path newJvmDirectory =
        Files.createTempDirectory(options.thirdPartyDirectory(), "jvm-", DIR_PERMISSIONS);

    mavenDependencies
        .stream()
        .collect(Collectors.groupingBy(d -> d.coords().groupId()))
        .forEach(
            (groupId, groupDependencies) ->
                writeJvmGroup(newJvmDirectory, buildifier, groupId, groupDependencies));
    return newJvmDirectory;
  }

  private static void writeJvmGroup(
      final Path newJvmDirectory,
      final Path buildifier,
      final String groupId,
      final List<MavenDependency> groupDependencies) {
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
      out.println("load(\"@rules_jvm_external//:defs.bzl\", \"artifact\")");

      for (final MavenDependency dependency : groupDependencies) {
        out.print('\n');
        out.printf("alias(\n");
        out.printf(
            "    name = \"%s\",\n", dependency.coords().artifactLabel(dependency.kind().isScala()));
        out.printf("    actual = artifact(\"%s\"),\n", dependency);
        out.printf("    visibility=[\"//visibility:public\"],\n");
        out.printf(")\n");
      }
    } catch (IOException e) {
      throw new UncheckedIOException("Could not write file " + buildFile, e);
    }

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

  private static Path readLink(final Path path) {
    try {
      return Files.readSymbolicLink(path);
    } catch (IOException e) {
      throw new UncheckedIOException("Could not read link " + path, e);
    }
  }
}
