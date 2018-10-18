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
package com.spotify.syncdeps.cli;

import com.google.auto.value.AutoValue;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import joptsimple.OptionSpec;

@AutoValue
public abstract class Options {

  Options() {}

  public abstract Path workspaceDirectory();

  public abstract Path buildifier();

  public abstract boolean verify();

  public abstract boolean verbose();

  public Path inputFile() {
    return thirdPartyDirectory().resolve("dependencies.yaml");
  }

  public Path lockFile() {
    return thirdPartyDirectory().resolve("dependencies.lock");
  }

  public Path workspaceFile() {
    return thirdPartyDirectory().resolve("workspace.bzl");
  }

  public Path repositoryFile() {
    return thirdPartyDirectory().resolve("repositories.bzl");
  }

  public Path thirdPartyDirectory() {
    return workspaceDirectory().resolve("3rdparty");
  }

  public Path jvmDirectory() {
    return thirdPartyDirectory().resolve("jvm");
  }

  public static Options parse(final String... args) throws IOException {
    final OptionParser parser = new OptionParser();

    final OptionSpec<Void> helpFlag = parser.accepts("help").forHelp();
    final OptionSpec<Void> verboseFlag = parser.acceptsAll(Arrays.asList("verbose", "v"));
    final OptionSpec<File> workspaceDirectoryArgument =
        parser
            .acceptsAll(Arrays.asList("workspace-directory", "w"))
            .withRequiredArg()
            .ofType(File.class);
    final OptionSpec<File> buildifierArgument =
        parser.accepts("buildifier").withRequiredArg().ofType(File.class);
    final OptionSpec<Void> verifyFlag = parser.accepts("verify");

    final OptionSet optionSet = parser.parse(args);

    if (optionSet.has(helpFlag)) {
      parser.printHelpOn(System.err);
      throw new IllegalStateException("Help requested"); // TODO(dflemstr): hack
    }

    final Path workspaceDirectory;
    final Path buildifier;

    if (optionSet.has(workspaceDirectoryArgument)) {
      workspaceDirectory = optionSet.valueOf(workspaceDirectoryArgument).toPath().normalize();
    } else {
      workspaceDirectory = Paths.get(".");
    }

    if (optionSet.has(buildifierArgument)) {
      buildifier = optionSet.valueOf(buildifierArgument).toPath();
    } else {
      throw new IllegalStateException("Missing mandatory flag --buildifier");
    }

    final boolean verify = optionSet.has(verifyFlag);
    final boolean verbose = optionSet.has(verboseFlag);

    return create(workspaceDirectory, buildifier, verify, verbose);
  }

  public static Options create(
      final Path workspaceDirectory,
      final Path buildifier,
      final boolean verify,
      final boolean verbose) {
    return builder()
        .workspaceDirectory(workspaceDirectory)
        .buildifier(buildifier)
        .verify(verify)
        .verbose(verbose)
        .build();
  }

  public static Builder builder() {
    return new AutoValue_Options.Builder();
  }

  @AutoValue.Builder
  public abstract static class Builder {

    Builder() {}

    public abstract Builder workspaceDirectory(final Path workspaceDirectory);

    public abstract Builder buildifier(final Path buildifier);

    public abstract Builder verify(final boolean verify);

    public abstract Builder verbose(final boolean verbose);

    public abstract Options build();
  }
}
