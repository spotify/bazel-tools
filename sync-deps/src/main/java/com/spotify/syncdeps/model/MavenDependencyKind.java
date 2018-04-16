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
package com.spotify.syncdeps.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

public enum MavenDependencyKind {
  JAVA("java", false),
  SCALA("scala", true),
  SCALA_MACRO("scala-macro", true);

  private final String id;
  private final boolean isScala;

  MavenDependencyKind(final String id, final boolean isScala) {
    this.id = id;
    this.isScala = isScala;
  }

  public static MavenDependencyKind defaultValue() {
    return JAVA;
  }

  // TODO(dflemstr): mixing concerns here with JSON annotations
  @JsonCreator
  public static MavenDependencyKind forId(final String id) {
    for (final MavenDependencyKind value : values()) {
      if (value.id.equals(id)) {
        return value;
      }
    }
    throw new IllegalArgumentException("No such dependency kind: " + id);
  }

  // TODO(dflemstr): mixing concerns here with JSON annotations
  @JsonValue
  public String value() {
    return id;
  }

  public boolean isScala() {
    return isScala;
  }
}
