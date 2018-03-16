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
package com.spotify.depfuzz.bazel;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.graph.GraphBuilder;
import com.google.common.graph.ImmutableGraph;
import com.google.common.graph.MutableGraph;
import com.google.devtools.build.lib.query2.proto.proto2api.Build;
import com.google.devtools.build.lib.view.proto.Deps;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Stream;

public class Bazel {

  private Bazel() {
    throw new IllegalAccessError("This class must not be instantiated.");
  }

  public static ImmutableSet<Rule> queryRules(final Path workspace, final String query)
      throws IOException {
    final Process process =
        new ProcessBuilder("bazel", "query", "--output=label", query)
            .redirectError(ProcessBuilder.Redirect.INHERIT)
            .redirectOutput(ProcessBuilder.Redirect.PIPE)
            .directory(workspace.toFile())
            .start();

    try (BufferedReader reader =
        new BufferedReader(new InputStreamReader(process.getInputStream()))) {
      return reader.lines().map(Rule::parse).collect(ImmutableSet.toImmutableSet());
    } finally {
      process.destroyForcibly();
    }
  }

  public static boolean allTestsPass(final Path workspace)
      throws IOException, InterruptedException {
    final Process process =
        new ProcessBuilder("bazel", "test", "//...")
            .inheritIO()
            .directory(workspace.toFile())
            .start();

    return 0 == process.waitFor();
  }

  public static ImmutableGraph<String> dependencyGraph(final Path workspace, final Rule rule)
      throws IOException {
    final Process process =
        new ProcessBuilder("bazel", "query", "--output=proto", "deps(" + rule + ") + " + rule)
            .redirectError(ProcessBuilder.Redirect.INHERIT)
            .redirectOutput(ProcessBuilder.Redirect.PIPE)
            .directory(workspace.toFile())
            .start();

    try {
      final Build.QueryResult queryResult = Build.QueryResult.parseFrom(process.getInputStream());

      final MutableGraph<String> graph =
          GraphBuilder.directed().expectedNodeCount(queryResult.getTargetCount()).build();

      for (final Build.Target protoTarget : queryResult.getTargetList()) {
        final String name = protoTarget.getRule().getName();
        graph.addNode(name);

        for (final String dependency : protoTarget.getRule().getRuleInputList()) {
          graph.putEdge(name, dependency);
        }
      }

      return ImmutableGraph.copyOf(graph);
    } finally {
      process.destroyForcibly();
    }
  }

  enum State {
    START,
    JAR,
    TARGET
  }

  public static ImmutableMap<String, Rule> directDeps(final Path workspace, final Rule rule)
      throws IOException {
    final Path bazelBin = workspace.resolve("bazel-bin");
    final Path jarParamsFile = inputFile(bazelBin, rule.pkg(), rule.name(), "jar-2.params");

    if (Files.exists(jarParamsFile)) {
      final ImmutableMap.Builder<String, Rule> resultBuilder = ImmutableMap.builder();
      try (final Stream<String> lines = Files.lines(jarParamsFile, StandardCharsets.UTF_8)) {
        final AtomicReference<State> state = new AtomicReference<>(State.START);
        final AtomicReference<String> lastJar = new AtomicReference<>();

        lines.forEach(
            line -> {
              switch (state.get()) {
                case START:
                  if (line.equals("--direct_dependency")) {
                    state.set(State.JAR);
                  }
                  break;
                case JAR:
                  lastJar.set(line);
                  state.set(State.TARGET);
                  break;
                case TARGET:
                  resultBuilder.put(lastJar.get(), Rule.parse(line));
                  state.set(State.START);
                  break;
              }
            });
      }

      return resultBuilder.build();
    } else {
      return ImmutableMap.of();
    }
  }

  public static ImmutableSet<String> potentiallyUnusedDependencyJars(
      final Path workspace, final Rule rule) throws IOException {
    final Path bazelBin = workspace.resolve("bazel-bin");
    final Path jdepsFile = inputFile(bazelBin, rule.pkg(), rule.name(), "jdeps");

    if (Files.exists(jdepsFile)) {
      final ImmutableSet.Builder<String> resultBuilder = ImmutableSet.builder();
      final Deps.Dependencies dependencies =
          Deps.Dependencies.parseFrom(Files.readAllBytes(jdepsFile));

      for (final Deps.Dependency dependency : dependencies.getDependencyList()) {
        if (dependency.getKind() != Deps.Dependency.Kind.EXPLICIT) {
          resultBuilder.add(dependency.getPath());
        }
      }

      return resultBuilder.build();
    } else {
      return ImmutableSet.of();
    }
  }

  public static Path inputFile(
      final Path bazelBin, final String pkg, final String ruleName, final String extension) {
    final Path libCandidate = bazelBin.resolve(pkg).resolve("lib" + ruleName + "." + extension);
    if (Files.exists(libCandidate)) {
      return libCandidate;
    } else {
      return bazelBin.resolve(pkg).resolve(ruleName + "." + extension);
    }
  }
}
