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
package com.spotify.syncrepos;

import com.google.common.base.Joiner;

import com.spotify.bazeltools.cliutils.Cli;
import com.spotify.syncrepos.cli.Options;
import com.spotify.syncrepos.config.Repositories;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

public final class Main {

  private Main() {}

  private static final Logger LOG = LoggerFactory.getLogger(Main.class);

  public static void main(String[] args) throws IOException {
    final Options options = Options.parse(args);

    Cli.configureLogging("sync-repos", options.verbose());

    try {
      run(options);
    } catch (final Exception e) {
      LOG.error("Fatal: {}", e);
    }
  }

  private static void run(final Options options) throws IOException, InterruptedException {
    final Repositories repositories = Repositories.parseYaml(options.inputFile());
    final Path workspace = options.workspaceDirectory();

    for (Map.Entry<String, Repositories.Git> gitEntry : repositories.git().entrySet()) {
      final Path relativeDirectory = workspace.getFileSystem().getPath(gitEntry.getKey());
      final Path directory = workspace.resolve(relativeDirectory);
      final Repositories.Git git = gitEntry.getValue();

      if (Files.exists(directory)) {
        LOG.info("Pulling changes into @|bold {}|@...", relativeDirectory);
        exec(
            workspace,
            "git",
            "subtree",
            "pull",
            "--prefix=" + relativeDirectory,
            git.remote(),
            git.branch());
      } else {
        LOG.info("Creating @|bold {}|@...", relativeDirectory);
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
