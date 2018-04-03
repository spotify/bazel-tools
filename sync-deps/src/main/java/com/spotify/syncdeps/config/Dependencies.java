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
package com.spotify.syncdeps.config;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.datatype.guava.GuavaModule;
import com.google.auto.value.AutoValue;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.ImmutableTable;
import com.google.common.collect.Table;
import com.spotify.syncdeps.model.MavenCoords;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Optional;

@AutoValue
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class Dependencies {

  Dependencies() {}

  @JsonProperty("options")
  public abstract Options options();

  @JsonProperty("maven")
  public abstract ImmutableTable<String, String, Maven> maven();

  public static Dependencies parseYaml(final Path path) throws IOException {
    final ObjectMapper mapper =
        new ObjectMapper(new YAMLFactory()).registerModule(new GuavaModule());
    return mapper.readValue(path.toFile(), Dependencies.class);
  }

  @JsonCreator
  public static Dependencies create(
      @JsonProperty("options") final Options options,
      @JsonDeserialize(using = TableDeserializer.class) @JsonProperty("maven")
          final ImmutableTable<String, String, Maven> maven) {
    return builder().options(options).maven(maven == null ? ImmutableTable.of() : maven).build();
  }

  public static Builder builder() {
    return new AutoValue_Dependencies.Builder();
  }

  @AutoValue.Builder
  public abstract static class Builder {

    Builder() {}

    public abstract Builder options(final Options options);

    public abstract ImmutableTable.Builder<String, String, Maven> mavenBuilder();

    public Builder maven(final Table<String, String, Maven> maven) {
      mavenBuilder().putAll(maven);
      return this;
    }

    public abstract Dependencies build();
  }

  @AutoValue
  @JsonIgnoreProperties(ignoreUnknown = true)
  public abstract static class Options {

    Options() {}

    @JsonProperty("mavenResolvers")
    public abstract ImmutableSet<MavenResolver> mavenResolvers();

    @JsonProperty("excludedDependencies")
    public abstract ImmutableSet<MavenCoords> excludedDependencies();

    @JsonCreator
    public static Options create(
        @JsonProperty("mavenResolvers") final ImmutableSet<MavenResolver> mavenResolvers,
        @JsonProperty("excludedDependencies")
            final ImmutableSet<MavenCoords> excludedDependencies) {
      return builder()
          .mavenResolvers(mavenResolvers == null ? ImmutableSet.of() : mavenResolvers)
          .excludedDependencies(
              excludedDependencies == null ? ImmutableSet.of() : excludedDependencies)
          .build();
    }

    public static Builder builder() {
      return new AutoValue_Dependencies_Options.Builder();
    }

    @AutoValue.Builder
    public abstract static class Builder {

      public abstract ImmutableSet.Builder<MavenResolver> mavenResolversBuilder();

      public abstract ImmutableSet.Builder<MavenCoords> excludedDependenciesBuilder();

      public Builder mavenResolver(final MavenResolver mavenResolver) {
        mavenResolversBuilder().add(mavenResolver);
        return this;
      }

      public Builder mavenResolvers(final Iterable<MavenResolver> mavenResolvers) {
        mavenResolversBuilder().addAll(mavenResolvers);
        return this;
      }

      public Builder excludedDependency(final MavenCoords excludedDependency) {
        excludedDependenciesBuilder().add(excludedDependency);
        return this;
      }

      public Builder excludedDependencies(final Iterable<MavenCoords> excludedDependencies) {
        excludedDependenciesBuilder().addAll(excludedDependencies);
        return this;
      }

      public abstract Options build();
    }
  }

  @AutoValue
  @JsonIgnoreProperties(ignoreUnknown = true)
  public abstract static class MavenResolver {

    @JsonProperty("id")
    public abstract String id();

    @JsonProperty("url")
    public abstract String url();

    @JsonCreator
    public static MavenResolver create(
        @JsonProperty("id") final String id, @JsonProperty("url") final String url) {
      return new AutoValue_Dependencies_MavenResolver(id, url);
    }
  }

  @AutoValue
  @JsonIgnoreProperties(ignoreUnknown = true)
  public abstract static class Maven {

    Maven() {}

    @JsonProperty("version")
    public abstract Optional<String> version();

    @JsonProperty("modules")
    public abstract ImmutableSet<String> modules();

    @JsonProperty("never-link")
    public abstract boolean neverLink();

    @JsonProperty("file")
    public abstract boolean asFile();

    @JsonCreator
    public static Maven create(
        @JsonProperty("version") final String version,
        @JsonProperty("modules") final ImmutableSet<String> modules,
        @JsonProperty(value = "never-link", defaultValue = "false") final boolean neverLink,
        @JsonProperty(value = "as-file", defaultValue = "false") final boolean asFile) {
      final Builder builder = builder();

      if (version != null) {
        builder.version(version);
      }

      if (modules != null) {
        builder.modules(modules);
      }

      builder.neverLink(neverLink);
      builder.asFile(asFile);

      return builder.build();
    }

    public static Builder builder() {
      return new AutoValue_Dependencies_Maven.Builder();
    }

    @AutoValue.Builder
    public abstract static class Builder {

      Builder() {}

      public abstract Builder version(final String version);

      public abstract ImmutableSet.Builder<String> modulesBuilder();

      public Builder module(final String module) {
        modulesBuilder().add(module);
        return this;
      }

      public Builder modules(final Iterable<String> modules) {
        modulesBuilder().addAll(modules);
        return this;
      }

      public abstract Builder neverLink(final boolean neverLink);

      public abstract Builder asFile(final boolean asFile);

      public abstract Maven build();
    }
  }
}
