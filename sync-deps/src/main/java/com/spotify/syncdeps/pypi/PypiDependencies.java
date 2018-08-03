/*
 * Copyright 2016-2018 Spotify AB
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
package com.spotify.syncdeps.pypi;

import static com.google.common.collect.ImmutableMap.toImmutableMap;
import static com.google.common.collect.ImmutableSet.toImmutableSet;
import static java.util.Locale.ROOT;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.auto.value.AutoValue;
import com.google.common.base.CharMatcher;
import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Iterables;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;
import com.google.common.util.concurrent.Futures;
import com.spotify.syncdeps.config.Dependencies;
import com.spotify.syncdeps.model.PypiDependency;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.stream.Stream;
import javax.annotation.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PypiDependencies {
  private static final Logger LOG = LoggerFactory.getLogger(PypiDependencies.class);

  private PypiDependencies() {}

  public static ImmutableSet<PypiDependency> resolveDependencies(
      final Path pip, final Dependencies dependencyDescriptor)
      throws IOException, InterruptedException {
    final Path requirementsFile = Files.createTempFile("requirements-", ".txt");

    writeRequirementsTxt(dependencyDescriptor, requirementsFile);

    final Path downloadDir = Files.createTempDirectory("pip-download-");

    final String log =
        pipDownload(pip, requirementsFile, dependencyDescriptor.options(), downloadDir);

    final ImmutableMap<String, String> urls = findUrls(log);
    final ImmutableMap<String, Metadata> metadata = findMetadata(downloadDir);

    final ImmutableSet.Builder<PypiDependency> resultBuilder = ImmutableSet.builder();

    for (final Map.Entry<String, String> dependency : urls.entrySet()) {
      final String name = dependency.getKey();
      final String url = dependency.getValue();
      final ImmutableMap.Builder<String, Boolean> dependenciesBuilder = ImmutableMap.builder();

      final Metadata metadatum = metadata.get(name);
      for (final String interdependency : metadatum.dependencies()) {
        if (urls.containsKey(interdependency)) {
          dependenciesBuilder.put(
              interdependency, dependencyDescriptor.pypi().containsKey(interdependency));
        }
      }

      final Dependencies.Pypi declaredDependency = dependencyDescriptor.pypi().get(name);
      resultBuilder.add(
          PypiDependency.create(
              name,
              url,
              Optional.of(metadatum.sha256()),
              declaredDependency == null ? Optional.<String>empty() : declaredDependency.main(),
              dependenciesBuilder.build(),
              declaredDependency != null,
              declaredDependency != null && declaredDependency.binary()));
    }

    return resultBuilder.build();
  }

  private static ImmutableMap<String, Metadata> findMetadata(final Path downloadDir)
      throws IOException {
    try (final Stream<Path> whlFiles =
        Files.list(downloadDir).filter(p -> p.toString().endsWith(".whl"))) {
      return whlFiles.collect(
          toImmutableMap(
              p -> whlPackageName(p.getFileName().toString()), PypiDependencies::whlMetadata));
    }
  }

  private static Metadata whlMetadata(final Path whlFile) {
    final ImmutableSet<String> dependencies;

    try (final FileSystem zipFileSystem = FileSystems.newFileSystem(whlFile, null)) {
      final String fileName = whlFile.getFileName().toString();
      final String distInfoDirName =
          Joiner.on('-').join(Iterables.limit(Splitter.on('-').split(fileName), 2)) + ".dist-info";

      final Path metadataJsonFile = zipFileSystem.getPath("/", distInfoDirName, "metadata.json");
      final Path metadataPlainFile = zipFileSystem.getPath("/", distInfoDirName, "METADATA");

      if (Files.exists(metadataJsonFile)) {
        dependencies = getJsonRunRequires(metadataJsonFile);
      } else if (Files.exists(metadataPlainFile)) {
        dependencies = getPlainRunRequires(metadataPlainFile);
      } else {
        LOG.warn("Package had no metadata: {}", whlPackageName(fileName));
        dependencies = ImmutableSet.of();
      }
    } catch (IOException e) {
      throw new UncheckedIOException("Could not extract .whl file metadata in " + whlFile, e);
    }

    final HashCode sha256;
    try {
      sha256 = com.google.common.io.Files.asByteSource(whlFile.toFile()).hash(Hashing.sha256());
    } catch (IOException e) {
      throw new UncheckedIOException("Could not hash file " + whlFile, e);
    }

    return Metadata.create(sha256, dependencies);
  }

  private static ImmutableSet<String> getPlainRunRequires(final Path metadataPlainFile)
      throws IOException {
    return Files.readAllLines(metadataPlainFile, StandardCharsets.UTF_8)
        .stream()
        .filter(line -> line.startsWith("Requires:") || line.startsWith("Requires-Dist:"))
        .map(r -> Iterables.getLast(Splitter.on(':').split(r)).trim())
        // TODO(dflemstr): hack; these should probably be evaluated
        .filter(r -> !r.contains("extra =="))
        .map(r -> Iterables.getFirst(Splitter.on(CharMatcher.anyOf(" ><=();")).split(r), ""))
        .filter(r -> !r.isEmpty())
        .collect(toImmutableSet());
  }

  private static ImmutableSet<String> getJsonRunRequires(final Path metadataJsonFile)
      throws IOException {
    final JsonNode tree;
    try (final InputStream inputStream = Files.newInputStream(metadataJsonFile)) {
      tree = new ObjectMapper().readTree(inputStream);
    }

    return ImmutableSet.copyOf(tree.path("run_requires"))
        .stream()
        // TODO(dflemstr): hack; these should probably be evaluated
        .filter(n -> n.path("extra").isMissingNode())
        .flatMap(n -> ImmutableSet.copyOf(n.path("requires")).stream())
        .map(JsonNode::asText)
        .map(r -> Iterables.getFirst(Splitter.on(CharMatcher.anyOf(" ><=()")).split(r), ""))
        .filter(r -> !r.isEmpty())
        .collect(toImmutableSet());
  }

  private static ImmutableMap<String, String> findUrls(final String log) {
    final ImmutableMap.Builder<String, String> urlsBuilder = ImmutableMap.builder();

    for (final String logLine : Splitter.on('\n').split(log)) {
      if (logLine.endsWith(".whl")) {
        final String url = Iterables.getLast(Splitter.on(' ').split(logLine));

        if (!url.startsWith("http")) {
          continue;
        }

        final String whlFileName = Iterables.getLast(Splitter.on('/').split(url));
        final String packageName = whlPackageName(whlFileName);

        if (packageName == null) {
          LOG.warn("Unable to determine package name of {}", whlFileName);
        } else {
          urlsBuilder.put(packageName, url);
        }
      }
    }

    return urlsBuilder.build();
  }

  @Nullable
  private static String whlPackageName(final String whlFileName) {
    return Iterables.getFirst(Splitter.on('-').split(whlFileName), null);
  }

  private static String pipDownload(
      final Path pip,
      final Path requirementsFile,
      final Dependencies.Options options,
      final Path downloadDir)
      throws IOException, InterruptedException {
    final Path cacheDirectory =
        Paths.get(System.getProperty("user.home"), ".cache", "bazel", "pip-cache");

    final Process pipDownload =
        new ProcessBuilder(
                pip.toAbsolutePath().toString(),
                "download",
                "--only-binary=:all:",
                "--python-version=" + options.pythonVersion(),
                "--platform=" + options.pythonPlatform(),
                "--implementation=" + options.pythonImplementation(),
                "--abi=" + options.pythonAbi(),
                "--cache-dir=" + cacheDirectory.toAbsolutePath().toString(),
                "--dest=" + downloadDir.toAbsolutePath().toString(),
                "--requirement=" + requirementsFile.toAbsolutePath().toString(),
                "--disable-pip-version-check")
            .redirectErrorStream(true)
            .redirectOutput(ProcessBuilder.Redirect.PIPE)
            .start();

    final ExecutorService logExecutor = Executors.newSingleThreadExecutor();
    final Future<String> logFuture = logExecutor.submit(() -> captureOutput(pipDownload));
    logExecutor.shutdown();

    final int exitCode = pipDownload.waitFor();
    final String log = Futures.getUnchecked(logFuture);

    if (exitCode != 0) {
      LOG.error("pip download failed with exit code {}", exitCode);
      throw new IllegalStateException("pypi dependency resolution failed");
    }

    return log;
  }

  private static String captureOutput(final Process pipDownload) {
    final StringBuilder output = new StringBuilder();

    try (final BufferedReader reader =
            new BufferedReader(
                new InputStreamReader(pipDownload.getInputStream(), StandardCharsets.UTF_8));
        final Stream<String> lines = reader.lines()) {
      lines.forEach(
          line -> {
            LOG.info("{}", line);
            output.append(line).append("\n");
          });
    } catch (IOException e) {
      throw new UncheckedIOException("Could not read process output", e);
    }

    return output.toString();
  }

  private static void writeRequirementsTxt(
      final Dependencies dependencyDescriptor, final Path requirementsFile) throws IOException {
    try (final BufferedWriter writer =
            Files.newBufferedWriter(requirementsFile, StandardCharsets.UTF_8);
        final PrintWriter out = new PrintWriter(writer)) {

      for (final Dependencies.PypiResolver pypiResolver :
          dependencyDescriptor.options().pypiResolvers()) {
        out.printf(ROOT, "-i %s%n", pypiResolver.url());
      }

      for (final Map.Entry<String, Dependencies.Pypi> entry :
          dependencyDescriptor.pypi().entrySet()) {
        out.printf(ROOT, "%s==%s%n", entry.getKey(), entry.getValue().version());
      }
    }
  }

  @AutoValue
  abstract static class Metadata {
    abstract HashCode sha256();

    abstract ImmutableSet<String> dependencies();

    static Metadata create(final HashCode sha256, final ImmutableSet<String> dependencies) {
      return new AutoValue_PypiDependencies_Metadata(sha256, dependencies);
    }
  }
}
