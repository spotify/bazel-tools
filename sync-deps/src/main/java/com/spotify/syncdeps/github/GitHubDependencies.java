package com.spotify.syncdeps.github;

import static java.util.Locale.ROOT;

import com.google.common.collect.ImmutableSet;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;
import com.google.common.hash.HashingInputStream;
import com.google.common.io.ByteStreams;
import com.spotify.syncdeps.config.Dependencies;
import com.spotify.syncdeps.model.GitHubDependency;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UncheckedIOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import java.util.stream.Stream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class GitHubDependencies {
  private static final Logger LOG = LoggerFactory.getLogger(GitHubDependencies.class);

  private GitHubDependencies() {}

  public static ImmutableSet<GitHubDependency> resolveDependencies(
      final Dependencies dependencyDescriptor) throws IOException, InterruptedException {
    final ImmutableSet.Builder<GitHubDependency> result = ImmutableSet.builder();
    for (Map.Entry<String, Dependencies.GitHub> gitHubEntry :
        dependencyDescriptor.github().entrySet()) {
      final String name = gitHubEntry.getKey();
      final Dependencies.GitHub spec = gitHubEntry.getValue();
      final String repo = spec.repo();
      final String ref = spec.ref();

      LOG.info("Checking for updates to @|bold {}|@ ref @|bold {}|@", repo, ref);
      final String cloneUrl = "git@github.com:" + repo;
      final Path tempDirectory = Files.createTempDirectory("sync-deps");

      final Process cloneProcess =
          new ProcessBuilder("git", "clone", cloneUrl, tempDirectory.toString())
              .redirectErrorStream(true)
              .start();

      awaitProcess(cloneProcess);

      final Process process =
          new ProcessBuilder("git", "rev-parse", ref)
              .redirectOutput(ProcessBuilder.Redirect.PIPE)
              .directory(tempDirectory.toFile())
              .start();

      final String commit =
          new String(ByteStreams.toByteArray(process.getInputStream()), StandardCharsets.UTF_8)
              .trim();

      final int checkoutExitCode = process.waitFor();

      if (checkoutExitCode != 0) {
        throw new IllegalStateException("git rev-parse failed (see log for details)");
      }

      final String url = String.format(ROOT, "https://github.com/%s/archive/%s.zip", repo, commit);

      // TODO: should we use some fancier HTTP library?
      final HashCode sha256;
      try (final InputStream input = URI.create(url).toURL().openStream()) {
        final HashingInputStream hashingInputStream =
            new HashingInputStream(Hashing.sha256(), input);
        ByteStreams.exhaust(hashingInputStream);
        sha256 = hashingInputStream.hash();
      }

      result.add(GitHubDependency.create(name, repo, commit, sha256));
    }

    return result.build();
  }

  private static void awaitProcess(final Process cloneProcess) throws InterruptedException {
    new Thread(() -> logProcessOutput(cloneProcess), "syncdeps-process-output-watcher").start();

    final int cloneExitCode = cloneProcess.waitFor();

    if (cloneExitCode != 0) {
      throw new IllegalStateException("process failed (see log for details)");
    }
  }

  private static void logProcessOutput(final Process cloneProcess) {
    try (final InputStream is = cloneProcess.getInputStream();
        final Reader reader = new InputStreamReader(is, StandardCharsets.UTF_8);
        final BufferedReader bufferedReader = new BufferedReader(reader);
        final Stream<String> lines = bufferedReader.lines()) {
      lines.forEach(line -> LOG.info("{}", line));
    } catch (final IOException e) {
      throw new UncheckedIOException("Failed to follow process output", e);
    }
  }
}
