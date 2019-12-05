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

@AutoValue
public abstract class MavenDependency implements Comparable<MavenDependency> {
  MavenDependency() {}

  public abstract MavenCoords coords();

  public abstract String version();

  public abstract boolean neverLink();

  public abstract MavenDependencyKind kind();

  public static MavenDependency create(
      final MavenCoords coords,
      final String version,
      final boolean neverLink,
      final MavenDependencyKind kind) {
    return new AutoValue_MavenDependency(coords, version, neverLink, kind);
  }

  @Override
  public int compareTo(final MavenDependency that) {
    return ComparisonChain.start()
        .compare(this.coords(), that.coords())
        .compare(this.version(), that.version())
        .result();
  }

  @Override
  public final String toString() {
    return this.coords() + ":" + this.version();
  }
}
