package com.spotify.syncrepos;

import com.google.common.base.Joiner;
import com.spotify.syncrepos.cli.Options;
import com.spotify.syncrepos.config.Repositories;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.ParseException;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class Main {

  private static final Logger LOG = LoggerFactory.getLogger(Main.class);

  public static void main(String[] args) throws IOException, ParseException, InterruptedException {
    final Options options = Options.parse(args);
    final Repositories repositories = Repositories.parseYaml(options.inputFile());
    final Path workspace = options.workspaceDirectory();

    for (Map.Entry<String, Repositories.Git> gitEntry : repositories.git().entrySet()) {
      final Path relativeDirectory = workspace.getFileSystem().getPath(gitEntry.getKey());
      final Path directory = workspace.resolve(relativeDirectory);
      final Repositories.Git git = gitEntry.getValue();

      if (Files.exists(directory)) {
        LOG.info("Pulling changes into {}...", relativeDirectory);
        exec(
            workspace,
            "git",
            "subtree",
            "pull",
            "--prefix=" + relativeDirectory,
            git.remote(),
            git.branch());
      } else {
        LOG.info("Creating {}...", relativeDirectory);
        exec(
            workspace,
            "git",
            "subtree",
            "add",
            "--prefix=" + relativeDirectory,
            git.remote(),
            git.branch());
      }
    }

    LOG.info("Done.");
  }

  private static void exec(final Path workDir, final String... command)
      throws IOException, InterruptedException {
    final Process process =
        new ProcessBuilder().directory(workDir.toFile()).command(command).inheritIO().start();

    final int exitCode = process.waitFor();

    if (exitCode != 0) {
      final String commandStr = Joiner.on(' ').join(command);
      final String message = "Command failed with exit code " + exitCode + " " + commandStr;
      throw new IOException(message);
    }
  }
}
