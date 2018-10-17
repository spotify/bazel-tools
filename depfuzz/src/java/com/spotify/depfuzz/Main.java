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
package com.spotify.depfuzz;

import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Lists;
import com.google.common.graph.ImmutableGraph;
import com.spotify.bazeltools.cliutils.Cli;
import com.spotify.depfuzz.bazel.Bazel;
import com.spotify.depfuzz.bazel.Rule;
import com.spotify.depfuzz.cli.Options;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {
  private static final Logger LOG = LoggerFactory.getLogger(Main.class);

  private Main() {
    throw new IllegalAccessError("This class must not be instantiated.");
  }

  public static void main(String[] args) throws Exception {
    final Options options = Options.parse(args);
    final Path workspace = options.workspaceDirectory();

    Cli.configureLogging("depfuzz", options.verbose());

    try {
      run(options, workspace);
    } catch (final Exception e) {
      LOG.error("A fatal error occurred", e);
      System.exit(1);
    }
  }

  private static void run(final Options options, final Path workspace) throws IOException {
    if (options.targets().isEmpty()) {
      LOG.error("No targets specified; maybe try @|bold '//... except //3rdparty/...'|@?");
      System.exit(1);
      return;
    }

    final String query =
        String.format(
            "kind('(java|android|scala)_*', %s)", Joiner.on(" + ").join(options.targets()));
    final ImmutableSet<Rule> rules = Bazel.queryRules(workspace, query);

    for (final Rule rule : rules) {
      LOG.info("Processing rule @|bold {}|@", rule);
      final ImmutableGraph<String> graph = Bazel.dependencyGraph(workspace, rule);

      if (!graph.nodes().contains(rule.canonical())) {
        LOG.warn("Skipping dangling dependency node @|bold {}|@", rule);
        continue;
      }

      for (final String dependency : graph.successors(rule.canonical())) {
        LOG.info("Will try to remove @|bold,red {}|@ from @|bold {}|@", dependency, rule);
        try {
          if (runBuildozer(options, "remove deps " + dependency, rule.raw())) {
            try {
              LOG.info("Running tests...");
              if (Bazel.allTestsPass(workspace)) {
                LOG.info("@|green Success!|@ Keeping change.");
              } else {
                LOG.info(
                    "@|red Failure!|@ Adding back @|bold,green {}|@ to @|bold {}|@",
                    dependency,
                    rule);
                runBuildozer(options, "add deps " + dependency, rule.raw());
              }
            } catch (Exception e) {
              LOG.info("An error occurred; adding back dependency.");
              runBuildozer(options, "add deps " + dependency, rule.raw());
              throw e;
            }
          } else {
            LOG.info(
                "@|yellow That made no sense!|@ Left dependency @|bold,yellow {}|@ for @|bold {}|@",
                dependency,
                rule);
          }
        } catch (final Exception e) {
          LOG.info(
              "@|red Unexpected error.|@ Left dependency @|bold,yellow {}|@ for @|bold {}|@",
              dependency,
              rule);
        }
      }
    }
  }

  private static boolean runBuildozer(final Options options, final String... cmd)
      throws IOException, InterruptedException {
    final List<String> cmdList = Lists.newArrayList();
    cmdList.add(options.buildozer().toAbsolutePath().toString());
    cmdList.addAll(Arrays.asList(cmd));

    final Process process =
        new ProcessBuilder(cmdList)
            .inheritIO()
            .directory(options.workspaceDirectory().toFile())
            .start();

    try {
      final int exitCode = process.waitFor();

      if (exitCode == 0) {
        return true;
      } else if (exitCode == 3) {
        return false;
      } else {
        LOG.error("buildozer failed; exit code " + exitCode);
        throw new IOException("buildozer failed; exit code " + exitCode);
      }
    } finally {
      process.destroyForcibly();
    }
  }
}
