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

import com.google.auto.value.AutoValue;
import java.util.Optional;

@AutoValue
public abstract class Rule {
  Rule() {}

  public abstract Optional<String> workspace();

  public abstract String pkg();

  public abstract String name();

  public String raw() {
    final String prefix = workspace().map(w -> "@" + w).orElse("") + "//";
    if (pkg().endsWith(name())) {
      return prefix + pkg();
    } else {
      return prefix + pkg() + ":" + name();
    }
  }

  public String canonical() {
    final String prefix = workspace().map(w -> "@" + w).orElse("") + "//";
    return prefix + pkg() + ":" + name();
  }

  @Override
  public final String toString() {
    return raw();
  }

  public static Rule parse(final String raw) {
    final int startIndex = raw.indexOf("//");

    final Optional<String> workspace;
    if (raw.startsWith("@")) {
      int workspaceStart = 0;
      while (workspaceStart < raw.length() && raw.charAt(workspaceStart) == '@') {
        workspaceStart++;
      }
      workspace = Optional.of(raw.substring(workspaceStart, startIndex));
    } else {
      workspace = Optional.empty();
    }

    final int colonIndex = raw.indexOf(':');

    if (colonIndex >= 0) {
      final String pkg = raw.substring(startIndex + 2, colonIndex);
      final String name = raw.substring(colonIndex + 1);
      return Rule.create(workspace, pkg, name);
    } else {
      final String pkg = raw.substring(startIndex + 2);
      final String name = raw.substring(raw.lastIndexOf('/') + 1, raw.length());
      return Rule.create(workspace, pkg, name);
    }
  }

  @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
  public static Rule create(final Optional<String> workspace, final String pkg, final String name) {
    return new AutoValue_Rule(workspace, pkg, name);
  }
}
