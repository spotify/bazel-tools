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
import com.google.common.collect.Maps;
import com.google.common.graph.EndpointPair;
import com.google.common.graph.ImmutableGraph;
import com.spotify.bazeltools.cliutils.Cli;
import com.spotify.depfuzz.bazel.Bazel;
import com.spotify.depfuzz.bazel.Rule;
import com.spotify.depfuzz.cli.Options;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
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

    if (options.targets().isEmpty()) {
      LOG.error("No targets specified; maybe try @|bold '//...'|@?");
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
      
    }
  }

  private static void showGraph(final ImmutableGraph<String> graph)
      throws IOException, InterruptedException {
    final Path tempFile = Files.createTempFile("dependencies-", ".png");

    final Process dotProcess =
        new ProcessBuilder()
            .command("dot", "-Tpng")
            .redirectInput(ProcessBuilder.Redirect.PIPE)
            .redirectOutput(tempFile.toFile())
            .start();

    try (final Writer rawOut =
            new OutputStreamWriter(dotProcess.getOutputStream(), StandardCharsets.UTF_8);
        final PrintWriter out = new PrintWriter(rawOut)) {
      out.printf("digraph dependencies {\n");

      int i = 0;
      final Map<String, Integer> ids = Maps.newHashMap();
      for (final String node : graph.nodes()) {
        if (isLocalNode(node)) {
          out.printf("    %d [label=\"%s\"];\n", i, node);
          ids.put(node, i);
          i++;
        }
      }

      for (final EndpointPair<String> edge : graph.edges()) {
        if (isLocalNode(edge.source()) && isLocalNode(edge.target())) {
          out.printf("    %d -> %d;\n", ids.get(edge.source()), ids.get(edge.target()));
        }
      }

      out.printf("}\n");
    }

    final int exitCode = dotProcess.waitFor();

    if (exitCode == 0) {
      new ProcessBuilder("eog", tempFile.toAbsolutePath().toString()).start().waitFor();
    } else {
      throw new IOException("Could not generate graph; exit code " + exitCode);
    }
  }

  private static boolean isLocalNode(final String node) {
    return !node.startsWith("@")
        && !node.startsWith("//external:")
        && !node.startsWith("//tools:")
        && !node.startsWith("//tools/");
  }
}
