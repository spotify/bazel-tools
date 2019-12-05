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
import java.util.Optional;

@AutoValue
public abstract class GitHubDependency implements Comparable<GitHubDependency> {
  GitHubDependency() {}

  public abstract String name();

  public abstract String repository();

  public abstract Optional<String> commit();

  public abstract Optional<String> branch();

  public abstract Optional<String> tag();

  public abstract Optional<String> release();

  public abstract Optional<String> stripPrefix();

  @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
  public static GitHubDependency create(
      final String name,
      final String repository,
      final Optional<String> commit,
      final Optional<String> branch,
      final Optional<String> tag,
      final Optional<String> release,
      final Optional<String> stripPrefix) {
    return new AutoValue_GitHubDependency(
        name, repository, commit, branch, tag, release, stripPrefix);
  }

  @Override
  public int compareTo(final GitHubDependency that) {
    return ComparisonChain.start().compare(this.name(), that.name()).result();
  }
}
