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

import com.google.auto.value.AutoValue;
import com.google.common.collect.ComparisonChain;
import com.google.common.collect.ImmutableMap;
import com.google.common.hash.HashCode;
import java.util.Optional;

@AutoValue
public abstract class PypiDependency implements Comparable<PypiDependency> {

  public abstract String name();

  public abstract String url();

  public abstract Optional<HashCode> sha256();

  public abstract Optional<String> main();

  // artifact → whether it is public
  // TODO(dflemstr): refactor this into some data structure
  public abstract ImmutableMap<String, Boolean> dependencies();

  public abstract boolean isPublic();

  public abstract boolean isBinary();

  @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
  public static PypiDependency create(
      final String name,
      final String url,
      final Optional<HashCode> sha256,
      final Optional<String> main,
      final ImmutableMap<String, Boolean> dependencies,
      final boolean isPublic,
      final boolean isBinary) {
    return new AutoValue_PypiDependency(name, url, sha256, main, dependencies, isPublic, isBinary);
  }

  @Override
  public int compareTo(final PypiDependency that) {
    return ComparisonChain.start().compare(this.name(), that.name()).result();
  }
}
