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
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;

import com.spotify.depfuzz.bazel.Bazel;
import com.spotify.depfuzz.bazel.Rule;
import com.spotify.depfuzz.cli.Options;

import java.io.IOException;
import java.nio.file.Path;

public class Main {
  private Main() {
    throw new IllegalAccessError("This class must not be instantiated.");
  }

  public static void main(String[] args) throws IOException {
    final Options options = Options.parse(args);
    final Path workspace = options.workspaceDirectory();

    final String query =
        String.format(
            "kind('(java|android|scala)_*', %s)", Joiner.on(" + ").join(options.targets()));
    final ImmutableSet<Rule> rules = Bazel.queryRules(workspace, query);

    for (final Rule rule : rules) {
      System.out.println("rule = " + rule);
      final ImmutableMap<String, Rule> directDeps = Bazel.directDeps(workspace, rule);
      final ImmutableSet<String> potentiallyUnusedDependencyJars =
          Bazel.potentiallyUnusedDependencyJars(workspace, rule);

      for (final String jar : potentiallyUnusedDependencyJars) {
        final Rule unusedRule = directDeps.get(jar);
        System.out.println("unusedRule = " + unusedRule);
      }
    }
  }
}
