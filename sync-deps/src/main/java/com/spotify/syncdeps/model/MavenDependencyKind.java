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
  JAVA("java", true, false, false),
  SCALA("scala", false, true, false),
  SCALA_MACRO("scala-macro", false, true, false);

  private final String id;
  private final boolean isJava;
  private final boolean isScala;
  private final boolean isMacro;

  MavenDependencyKind(
      final String id, final boolean isJava, final boolean isScala, final boolean isMacro) {
    this.id = id;
    this.isJava = isJava;
    this.isScala = isScala;
    this.isMacro = isMacro;
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

  public boolean isJava() {
    return isJava;
  }

  public boolean isScala() {
    return isScala;
  }

  public boolean isMacro() {
    return isMacro;
  }
}
