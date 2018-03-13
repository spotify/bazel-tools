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
package com.spotify.depfuzz.cli;

import com.google.auto.value.AutoValue;
import com.google.common.collect.ImmutableSet;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Arrays;
import joptsimple.NonOptionArgumentSpec;
import joptsimple.OptionParser;
import joptsimple.OptionSet;
import joptsimple.OptionSpec;

@AutoValue
public abstract class Options {
  Options() {}

  public abstract Path workspaceDirectory();

  public abstract Path unusedDeps();

  public abstract Path buildozer();

  public abstract ImmutableSet<String> targets();

  public abstract boolean verbose();

  public static Options parse(final String... args) throws IOException {
    final OptionParser parser = new OptionParser();

    final OptionSpec<Void> helpFlag = parser.accepts("help").forHelp();
    final OptionSpec<Void> verboseFlag = parser.acceptsAll(Arrays.asList("v", "verbose"));
    final OptionSpec<File> workspaceDirectoryArgument =
        parser
            .acceptsAll(Arrays.asList("workspace-directory", "w"))
            .withRequiredArg()
            .ofType(File.class);
    final OptionSpec<File> unusedDepsArgument =
        parser.accepts("unused-deps").withRequiredArg().ofType(File.class);
    final OptionSpec<File> buildozerArgument =
        parser.accepts("buildozer").withRequiredArg().ofType(File.class);
    final NonOptionArgumentSpec<String> targetsArgument = parser.nonOptions().ofType(String.class);

    final OptionSet optionSet = parser.parse(args);

    if (optionSet.has(helpFlag)) {
      parser.printHelpOn(System.err);
      throw new IllegalStateException("Help requested"); // TODO(dflemstr): hack
    }

    // TODO(dflemstr): better error handling for missing args
    return create(
        workspaceDirectoryArgument.value(optionSet).toPath(),
        unusedDepsArgument.value(optionSet).toPath(),
        buildozerArgument.value(optionSet).toPath(),
        ImmutableSet.copyOf(targetsArgument.values(optionSet)),
        optionSet.has(verboseFlag));
  }

  public static Options create(
      final Path workspaceDirectory,
      final Path unusedDeps,
      final Path buildozer,
      final ImmutableSet<String> targets,
      final boolean verbose) {
    return new AutoValue_Options(workspaceDirectory, unusedDeps, buildozer, targets, verbose);
  }
}
