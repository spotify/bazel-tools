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
package com.spotify.format;

import static java.nio.charset.StandardCharsets.UTF_8;

import com.google.auto.value.AutoValue;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;
import com.google.common.io.CharStreams;
import com.google.common.io.MoreFiles;
import com.google.errorprone.annotations.MustBeClosed;
import com.google.googlejavaformat.java.Formatter;
import com.google.googlejavaformat.java.FormatterException;
import com.google.googlejavaformat.java.JavaFormatterOptions;
import com.spotify.bazeltools.cliutils.Cli;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.PathMatcher;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.stream.Stream;
import joptsimple.AbstractOptionSpec;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import joptsimple.OptionSpec;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class Main {
  private static final Logger LOG = LoggerFactory.getLogger(Main.class);

  private Main() {}

  public static void main(String[] args) throws IOException {
    final OptionParser optionParser = new OptionParser();

    final OptionSpec<File> workspaceArgument =
        optionParser.accepts("workspace-directory").withRequiredArg().ofType(File.class);
    final OptionSpec<File> buildifierArgument =
        optionParser.accepts("buildifier").withRequiredArg().ofType(File.class);
    final OptionSpec<Void> verifyFlag = optionParser.accepts("verify");

    final AbstractOptionSpec<Void> helpFlag = optionParser.accepts("help").forHelp();
    final AbstractOptionSpec<Void> verboseFlag =
        optionParser.acceptsAll(Arrays.asList("verbose", "v"));

    final OptionSet optionSet = optionParser.parse(args);

    Cli.configureLogging("format", optionSet.has(verboseFlag));

    if (optionSet.has(helpFlag)) {
      optionParser.printHelpOn(System.err);
      System.exit(0);
      return;
    }

    final Path workspaceDirectory;
    if (optionSet.has(workspaceArgument)) {
      workspaceDirectory = optionSet.valueOf(workspaceArgument).toPath();
    } else {
      LOG.error("Mandatory flag --workspace-directory missing (see --help)");
      System.exit(1);
      return;
    }

    final Path buildifier;
    if (optionSet.has(buildifierArgument)) {
      buildifier = optionSet.valueOf(buildifierArgument).toPath();
    } else {
      LOG.error("Mandatory flag --buildifier missing (see --help)");
      System.exit(1);
      return;
    }

    try {
      run(workspaceDirectory, buildifier, optionSet.has(verifyFlag));
    } catch (final Exception e) {
      LOG.error("A fatal error occurred", e);
      System.exit(1);
    }
  }

  private static void run(
      final Path workspaceDirectory, final Path buildifier, final boolean verify)
      throws IOException {

    final JavaFormatterOptions options =
        JavaFormatterOptions.builder().style(JavaFormatterOptions.Style.GOOGLE).build();

    final Formatter formatter = new Formatter(options);
    final Set<Path> malformattedPaths = new ConcurrentSkipListSet<>();

    LOG.info("Processing Java files...");
    try (final Stream<Path> javaFiles = findFilesMatching(workspaceDirectory, "glob:**/*.java")) {
      javaFiles
          .parallel()
          .forEach(
              javaFile ->
                  handleResult(formatJavaFile(formatter, javaFile), verify, malformattedPaths));
    }

    LOG.info("Processing Scala files...");
    try (final Stream<Path> scalaFiles = findFilesMatching(workspaceDirectory, "glob:**/*.scala")) {
      scalaFiles
          .parallel()
          .forEach(
              scalaFile -> handleResult(formatScalaFile(scalaFile), verify, malformattedPaths));
    }

    LOG.info("Processing Bazel BUILD files...");
    try (final Stream<Path> buildFiles = findFilesMatching(workspaceDirectory, "glob:**/BUILD")) {
      buildFiles
          .parallel()
          .forEach(
              buildFile ->
                  handleResult(formatBuildFile(buildifier, buildFile), verify, malformattedPaths));
    }

    LOG.info("Processing Bazel WORKSPACE files...");
    try (final Stream<Path> workspaceFiles =
        findFilesMatching(workspaceDirectory, "glob:**/WORKSPACE")) {
      workspaceFiles
          .parallel()
          .forEach(
              workspaceFile ->
                  handleResult(
                      formatBuildFile(buildifier, workspaceFile), verify, malformattedPaths));
    }

    if (!malformattedPaths.isEmpty()) {
      LOG.error("There are malformatted files, please run 'tools/format/run'!");
      LOG.error("Malformatted file paths are:");
      for (final Path malformattedPath : malformattedPaths) {
        LOG.error("  - {}", workspaceDirectory.relativize(malformattedPath));
      }
      System.exit(1);
    }
  }

  private static void handleResult(
      final FormattingResult formattingResult,
      final boolean verify,
      final Set<Path> malformedPaths) {
    // Use hashing to avoid loading the file into memory... We should probably also do this for
    // FormattingResult to be fair.
    final HashCode oldHash;
    try {
      oldHash = MoreFiles.asByteSource(formattingResult.path()).hash(Hashing.sha256());
    } catch (final IOException e) {
      throw new UncheckedIOException("Could not hash contents of " + formattingResult.path(), e);
    }
    final HashCode newHash =
        Hashing.sha256().hashBytes(formattingResult.contents().getBytes(StandardCharsets.UTF_8));
    if (!oldHash.equals(newHash)) {
      if (verify) {
        malformedPaths.add(formattingResult.path());
      } else {
        try {
          Files.write(formattingResult.path(), formattingResult.contents().getBytes(UTF_8));
        } catch (final IOException e) {
          throw new UncheckedIOException("Could not write file " + formattingResult.path(), e);
        }
      }
    }
  }

  private static FormattingResult formatBuildFile(final Path buildifier, final Path buildFile) {
    final Process process;
    try {
      process =
          new ProcessBuilder()
              .command(buildifier.toString())
              .redirectInput(buildFile.toFile())
              .redirectOutput(ProcessBuilder.Redirect.PIPE)
              .redirectError(ProcessBuilder.Redirect.INHERIT)
              .start();
    } catch (IOException e) {
      throw new UncheckedIOException("Unable to run buildifier on " + buildFile, e);
    }

    final StringWriter writer = new StringWriter();
    try (final InputStreamReader reader = new InputStreamReader(process.getInputStream(), UTF_8)) {
      CharStreams.copy(reader, writer);
    } catch (IOException e) {
      throw new UncheckedIOException("Unable to read buildifier output for " + buildFile, e);
    }

    final int exitCode;
    try {
      exitCode = process.waitFor();
    } catch (final InterruptedException e) {
      throw new IllegalStateException("Interrupted while formatting file " + buildFile, e);
    }

    if (exitCode != 0) {
      throw new IllegalStateException("Unable to format file " + buildFile);
    }

    return FormattingResult.create(buildFile, writer.toString());
  }

  private static FormattingResult formatJavaFile(final Formatter formatter, final Path javaFile) {
    return FormattingResult.create(
        javaFile, formatJavaSource(formatter, javaFile, readFile(javaFile)));
  }

  private static FormattingResult formatScalaFile(final Path scalaFile) {
    return FormattingResult.create(scalaFile, formatScalaSource(scalaFile, readFile(scalaFile)));
  }

  private static String formatJavaSource(
      final Formatter formatter, final Path javaFile, final String source) {
    final String formattedSource;
    try {
      formattedSource = formatter.formatSource(source);
    } catch (final FormatterException e) {
      throw new IllegalStateException("Could not format source in file " + javaFile, e);
    }
    return formattedSource;
  }

  private static String formatScalaSource(final Path scalaFile, final String source) {
    final String formattedSource;
    try {
      formattedSource = ScalaFmt.format(source);
    } catch (final Exception e) {
      throw new IllegalStateException("Could not format source in file " + scalaFile, e);
    }
    return formattedSource;
  }

  private static String readFile(final Path javaFile) {
    final String source;
    try {
      source = new String(Files.readAllBytes(javaFile), UTF_8);
    } catch (final IOException e) {
      throw new UncheckedIOException("Could not read file " + javaFile, e);
    }
    return source;
  }

  @MustBeClosed
  private static Stream<Path> findFilesMatching(final Path directory, final String syntaxAndPattern)
      throws IOException {
    final PathMatcher matcher = directory.getFileSystem().getPathMatcher(syntaxAndPattern);
    return Files.find(
        directory, Integer.MAX_VALUE, (p, a) -> matcher.matches(p) && !a.isDirectory());
  }

  @AutoValue
  abstract static class FormattingResult {

    abstract Path path();

    abstract String contents();

    static FormattingResult create(final Path path, final String contents) {
      return new AutoValue_Main_FormattingResult(path, contents);
    }
  }
}
