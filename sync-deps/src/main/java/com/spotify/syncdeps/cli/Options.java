package com.spotify.syncdeps.cli;

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

  public abstract Path buildifier();

  public abstract boolean verify();

  public Path inputFile() {
    return thirdPartyDirectory().resolve("dependencies.yaml");
  }

  public Path lockFile() {
    return thirdPartyDirectory().resolve("dependencies.lock");
  }

  public Path outputFile() {
    return thirdPartyDirectory().resolve("workspace.bzl");
  }

  public Path thirdPartyDirectory() {
    return workspaceDirectory().resolve("3rdparty");
  }

  public Path jvmDirectory() {
    return thirdPartyDirectory().resolve("jvm");
  }

  public static Options parse(final String... args) throws IOException {
    final OptionParser parser = new OptionParser();

    final OptionSpec<Void> helpOption = parser.accepts("help").forHelp();
    final OptionSpec<File> workspaceDirectoryArgument =
        parser.accepts("workspace-directory").withRequiredArg().ofType(File.class);
    final OptionSpec<File> buildifierArgument =
        parser.accepts("buildifier").withRequiredArg().ofType(File.class);
    final OptionSpec<Void> verifyFlag = parser.accepts("verify");

    final OptionSet optionSet = parser.parse(args);

    if (optionSet.has(helpOption)) {
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

    return create(workspaceDirectory, buildifier, verify);
  }

  public static Options create(
      final Path workspaceDirectory, final Path buildifier, final boolean verify) {
    return builder()
        .workspaceDirectory(workspaceDirectory)
        .buildifier(buildifier)
        .verify(verify)
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

    public abstract Options build();
  }
}
