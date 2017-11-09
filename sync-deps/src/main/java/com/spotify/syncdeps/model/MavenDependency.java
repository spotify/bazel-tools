package com.spotify.syncdeps.model;

import com.google.auto.value.AutoValue;
import com.google.common.collect.ComparisonChain;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.hash.HashCode;
import java.util.Optional;
import javax.annotation.Nonnull;

@AutoValue
public abstract class MavenDependency implements Comparable<MavenDependency> {

  public abstract MavenCoords coords();

  public abstract String version();

  public abstract Optional<HashCode> sha1();

  // artifact → whether it is public
  // TODO(dflemstr): refactor this into some data structure
  public abstract ImmutableMap<MavenCoords, Boolean> dependencies();

  public abstract boolean isPublic();

  @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
  public static MavenDependency create(
      final MavenCoords coords,
      final String version,
      final Optional<HashCode> sha1,
      final boolean isPublic) {
    return create(coords, version, sha1, ImmutableMap.of(), isPublic);
  }

  @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
  public static MavenDependency create(
      final MavenCoords coords,
      final String version,
      final Optional<HashCode> sha1,
      final ImmutableMap<MavenCoords, Boolean> dependencies,
      final boolean isPublic) {
    return new AutoValue_MavenDependency(coords, version, sha1, dependencies, isPublic);
  }

  @Override
  public int compareTo(@Nonnull final MavenDependency that) {
    return ComparisonChain.start()
        .compare(this.coords(), that.coords())
        .compare(this.version(), that.version())
        .result();
  }
}
