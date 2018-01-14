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
package com.spotify.syncrepos.cli;

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

  public Path inputFile() {
    return thirdPartyDirectory().resolve("repositories.yaml");
  }

  public Path thirdPartyDirectory() {
    return workspaceDirectory().resolve("3rdparty");
  }

  public static Options parse(final String... args) throws IOException {
    final OptionParser parser = new OptionParser();

    final OptionSpec<Void> helpOption = parser.accepts("help").forHelp();
    final OptionSpec<File> workspaceDirectoryArgument =
        parser
            .acceptsAll(Arrays.asList("workspace-directory", "w"))
            .withRequiredArg()
            .ofType(File.class);

    final OptionSet optionSet = parser.parse(args);

    if (optionSet.has(helpOption)) {
      parser.printHelpOn(System.err);
      throw new IllegalStateException("Help requested"); // TODO(dflemstr): hack
    }

    final Path workspaceDirectory;

    if (optionSet.has(workspaceDirectoryArgument)) {
      workspaceDirectory = optionSet.valueOf(workspaceDirectoryArgument).toPath().normalize();
    } else {
      workspaceDirectory = Paths.get(".");
    }

    return create(workspaceDirectory);
  }

  public static Options create(final Path workspaceDirectory) {
    return builder().workspaceDirectory(workspaceDirectory).build();
  }

  public static Builder builder() {
    return new AutoValue_Options.Builder();
  }

  @AutoValue.Builder
  public abstract static class Builder {

    Builder() {}

    public abstract Builder workspaceDirectory(final Path workspaceDirectory);

    public abstract Options build();
  }
}
