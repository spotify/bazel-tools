package com.spotify.syncdeps.model;

import static java.util.stream.Collectors.joining;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.auto.value.AutoValue;
import com.google.common.base.Splitter;
import com.google.common.collect.ComparisonChain;
import com.spotify.syncdeps.util.BazelUtils;
import java.util.Iterator;

@AutoValue
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class MavenCoords implements Comparable<MavenCoords> {

  public static final Splitter DOT_SPLITTER = Splitter.on('.');

  MavenCoords() {}

  @JsonProperty("groupId")
  public abstract String groupId();

  @JsonProperty("artifactId")
  public abstract String artifactId();

  public String artifactLabel() {
    return BazelUtils.label(artifactId());
  }

  public String artifactPackagePathSegment() {
    return BazelUtils.packagePathSegment(artifactId());
  }

  public String groupRelativePackageName() {
    return groupRelativePackageName(groupId());
  }

  public String workspaceName() {
    return BazelUtils.workspaceName(groupId() + "_" + artifactId());
  }

  public static String groupRelativePackageName(final String groupId) {
    return DOT_SPLITTER
        .splitToList(groupId)
        .stream()
        .map(BazelUtils::packagePathSegment)
        .collect(joining("/"));
  }

  @JsonCreator
  public static MavenCoords create(
      @JsonProperty("groupId") final String groupId,
      @JsonProperty("artifactId") final String artifactId) {
    return new AutoValue_MavenCoords(groupId, artifactId);
  }

  public static MavenCoords valueOf(final String string) {
    final Iterator<String> parts = Splitter.on(':').limit(2).split(string).iterator();
    return create(parts.next(), parts.next());
  }

  @Override
  public String toString() {
    return groupId() + ":" + artifactId();
  }

  @Override
  public int compareTo(final MavenCoords that) {
    return ComparisonChain.start()
        .compare(this.groupId(), that.groupId())
        .compare(this.artifactId(), that.artifactId())
        .result();
  }
}
