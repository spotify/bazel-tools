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
public abstract class MavenDependency implements Comparable<MavenDependency> {

  public abstract MavenCoords coords();

  public abstract String version();

  public abstract Optional<HashCode> sha1();

  // artifact → whether it is public
  // TODO(dflemstr): refactor this into some data structure
  public abstract ImmutableMap<MavenCoords, Boolean> dependencies();

  public abstract boolean isPublic();

  public abstract boolean neverLink();

  public abstract MavenDependencyKind kind();

  @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
  public static MavenDependency create(
      final MavenCoords coords,
      final String version,
      final Optional<HashCode> sha1,
      final ImmutableMap<MavenCoords, Boolean> dependencies,
      final boolean isPublic,
      final boolean neverLink,
      final MavenDependencyKind kind) {
    return new AutoValue_MavenDependency(
        coords, version, sha1, dependencies, isPublic, neverLink, kind);
  }

  @Override
  public int compareTo(final MavenDependency that) {
    return ComparisonChain.start()
        .compare(this.coords(), that.coords())
        .compare(this.version(), that.version())
        .result();
  }
}
