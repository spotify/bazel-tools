package com.spotify.syncrepos.cli;

import com.google.auto.value.AutoValue;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
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
        parser.accepts("workspace-directory").withRequiredArg().ofType(File.class);

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
