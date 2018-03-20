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
package com.spotify.syncrepos.config;

import com.google.auto.value.AutoValue;
import com.google.common.collect.ImmutableMap;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.datatype.guava.GuavaModule;

import java.io.IOException;
import java.nio.file.Path;
import java.util.Map;

@AutoValue
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class Repositories {

  Repositories() {}

  @JsonProperty("git")
  public abstract ImmutableMap<String, Git> git();

  public static Repositories parseYaml(final Path path) throws IOException {
    final ObjectMapper mapper =
        new ObjectMapper(new YAMLFactory()).registerModule(new GuavaModule());
    return mapper.readValue(path.toFile(), Repositories.class);
  }

  @JsonCreator
  public static Repositories create(@JsonProperty("git") final ImmutableMap<String, Git> git) {
    return builder().git(git == null ? ImmutableMap.of() : git).build();
  }

  public static Builder builder() {
    return new AutoValue_Repositories.Builder();
  }

  @AutoValue.Builder
  public abstract static class Builder {

    Builder() {}

    public abstract ImmutableMap.Builder<String, Git> gitBuilder();

    public Builder git(final Map<String, Git> git) {
      gitBuilder().putAll(git);
      return this;
    }

    public abstract Repositories build();
  }

  @AutoValue
  @JsonIgnoreProperties(ignoreUnknown = true)
  public abstract static class Git {

    Git() {}

    @JsonProperty("remote")
    public abstract String remote();

    @JsonProperty("branch")
    public abstract String branch();

    @JsonCreator
    public static Git create(
        @JsonProperty("remote") final String remote, @JsonProperty("branch") final String branch) {
      return builder().remote(remote).branch(branch).build();
    }

    public static Builder builder() {
      return new AutoValue_Repositories_Git.Builder();
    }

    @AutoValue.Builder
    public abstract static class Builder {

      Builder() {}

      public abstract Builder remote(final String remote);

      public abstract Builder branch(final String branch);

      public abstract Git build();
    }
  }
}
