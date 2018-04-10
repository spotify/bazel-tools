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

import static java.util.stream.Collectors.joining;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.auto.value.AutoValue;
import com.google.common.base.Splitter;
import com.google.common.collect.ComparisonChain;
import com.spotify.syncdeps.util.BazelUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Optional;

@AutoValue
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class MavenCoords implements Comparable<MavenCoords> {

  public static final Splitter DOT_SPLITTER = Splitter.on('.');
  public static final Splitter COLON_SPLITTER = Splitter.on(':');

  MavenCoords() {}

  @JsonProperty("groupId")
  public abstract String groupId();

  @JsonProperty("artifactId")
  public abstract String artifactId();

  @JsonProperty("classifier")
  public abstract Optional<String> classifier();

  public String artifactLabel() {
    return BazelUtils.label(artifactId());
  }

  public String artifactPackagePathSegment() {
    return BazelUtils.packagePathSegment(artifactId());
  }

  public String workspaceName() {
    return BazelUtils.workspaceName(groupId() + "_" + artifactId());
  }

  public String groupRelativePackageName() {
    return groupRelativePackageName(groupId());
  }

  public static String groupRelativePackageName(final String groupId) {
    return DOT_SPLITTER
        .splitToList(groupId)
        .stream()
        .map(BazelUtils::packagePathSegment)
        .collect(joining("/"));
  }

  public static MavenCoords create(final String groupId, final String artifactId) {
    return create(groupId, artifactId, Optional.empty());
  }

  @JsonCreator
  public static MavenCoords create(
      @JsonProperty("groupId") final String groupId,
      @JsonProperty("artifactId") final String artifactId,
      @JsonProperty("classifier") final Optional<String> classifier) {
    return new AutoValue_MavenCoords(groupId, artifactId, classifier);
  }

  public static MavenCoords valueOf(final String string) {
    final Iterator<String> parts = COLON_SPLITTER.limit(3).split(string).iterator();
    final String groupId = parts.next();
    final String artifactId = parts.next();
    Optional<String> classifier;
    try {
      classifier = Optional.of(parts.next());
    } catch (NoSuchElementException exception) {
      classifier = Optional.empty();
    }
    return create(groupId, artifactId, classifier);
  }

  @Override
  public String toString() {
    if (classifier().isPresent()) {
      return groupId() + ":" + artifactId() + ":" + classifier().get();
    } else {
      return groupId() + ":" + artifactId();
    }
  }

  @Override
  public int compareTo(final MavenCoords that) {
    return ComparisonChain.start()
        .compare(this.groupId(), that.groupId())
        .compare(this.artifactId(), that.artifactId())
        .result();
  }
}
