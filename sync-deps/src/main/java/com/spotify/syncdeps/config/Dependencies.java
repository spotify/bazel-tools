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
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.ImmutableTable;
import com.google.common.collect.Table;
import com.spotify.syncdeps.model.MavenCoords;
import com.spotify.syncdeps.model.MavenDependencyKind;
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

  @JsonProperty("pypi")
  public abstract ImmutableMap<String, Pypi> pypi();

  public static Dependencies parseYaml(final Path path) throws IOException {
    final ObjectMapper mapper =
        new ObjectMapper(new YAMLFactory()).registerModule(new GuavaModule());
    return mapper.readValue(path.toFile(), Dependencies.class);
  }

  @JsonCreator
  public static Dependencies create(
      @JsonProperty("options") final Options options,
      @JsonDeserialize(using = TableDeserializer.class) @JsonProperty("maven")
          final ImmutableTable<String, String, Maven> maven,
      @JsonProperty("pypi") final ImmutableMap<String, Pypi> pypi) {
    return builder()
        .options(options)
        .maven(maven == null ? ImmutableTable.of() : maven)
        .pypi(pypi)
        .build();
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

    public abstract ImmutableMap.Builder<String, Pypi> pypiBuilder();

    public Builder pypi(final ImmutableMap<String, Pypi> pypi) {
      pypiBuilder().putAll(pypi);
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

    @JsonProperty("pypiResolvers")
    public abstract ImmutableSet<PypiResolver> pypiResolvers();

    @JsonProperty("excludedDependencies")
    public abstract ImmutableSet<MavenCoords> excludedDependencies();

    @JsonProperty("scalaAbi")
    public abstract String scalaAbi();

    @JsonProperty("pythonVersion")
    public abstract String pythonVersion();

    @JsonProperty("pythonPlatform")
    public abstract String pythonPlatform();

    @JsonProperty("pythonImplementation")
    public abstract String pythonImplementation();

    @JsonProperty("pythonAbi")
    public abstract String pythonAbi();

    @JsonCreator
    public static Options create(
        @JsonProperty("mavenResolvers") final ImmutableSet<MavenResolver> mavenResolvers,
        @JsonProperty("pypiResolvers") final ImmutableSet<PypiResolver> pypiResolvers,
        @JsonProperty("excludedDependencies") final ImmutableSet<MavenCoords> excludedDependencies,
        @JsonProperty("scalaAbi") final String scalaAbi,
        @JsonProperty("pythonVersion") final String pythonVersion,
        @JsonProperty("pythonPlatform") final String pythonPlatform,
        @JsonProperty("pythonImplementation") final String pythonImplementation,
        @JsonProperty("pythonAbi") final String pythonAbi) {
      final Builder resultBuilder = builder();

      resultBuilder.mavenResolvers(mavenResolvers == null ? ImmutableSet.of() : mavenResolvers);

      resultBuilder.pypiResolvers(pypiResolvers == null ? ImmutableSet.of() : pypiResolvers);

      resultBuilder.excludedDependencies(
          excludedDependencies == null ? ImmutableSet.of() : excludedDependencies);

      resultBuilder.scalaAbi(scalaAbi == null ? "2.11" : scalaAbi);
      resultBuilder.pythonVersion(pythonVersion == null ? "3" : pythonVersion);
      resultBuilder.pythonPlatform(pythonPlatform == null ? "any" : pythonPlatform);
      resultBuilder.pythonImplementation(
          pythonImplementation == null ? "py" : pythonImplementation);
      resultBuilder.pythonAbi(pythonAbi == null ? "none" : pythonAbi);

      return resultBuilder.build();
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

      public abstract ImmutableSet.Builder<PypiResolver> pypiResolversBuilder();

      public Builder pypiResolvers(final Iterable<PypiResolver> pypiResolvers) {
        pypiResolversBuilder().addAll(pypiResolvers);
        return this;
      }

      public Builder pypiResolver(final PypiResolver pypiResolver) {
        pypiResolversBuilder().add(pypiResolver);
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

      public abstract Builder scalaAbi(final String scalaAbi);

      public abstract Builder pythonVersion(final String pythonVersion);

      public abstract Builder pythonPlatform(final String pythonPlatform);

      public abstract Builder pythonImplementation(final String pythonImplementation);

      public abstract Builder pythonAbi(final String pythonAbi);

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

    @JsonProperty("kind")
    public abstract MavenDependencyKind kind();

    @JsonCreator
    public static Maven create(
        @JsonProperty("version") final String version,
        @JsonProperty("modules") final ImmutableSet<String> modules,
        @JsonProperty(value = "never-link", defaultValue = "false") final boolean neverLink,
        @JsonProperty(value = "kind") final MavenDependencyKind kind) {
      final Builder builder = builder();

      if (version != null) {
        builder.version(version);
      }

      if (modules != null) {
        builder.modules(modules);
      }

      builder.neverLink(neverLink);

      if (kind != null) {
        builder.kind(kind);
      }

      return builder.build();
    }

    public static Builder builder() {
      return new AutoValue_Dependencies_Maven.Builder().kind(MavenDependencyKind.defaultValue());
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

      public abstract Builder kind(final MavenDependencyKind kind);

      public abstract Maven build();
    }
  }

  @AutoValue
  public abstract static class PypiResolver {
    @JsonProperty("id")
    public abstract String id();

    @JsonProperty("url")
    public abstract String url();

    @JsonCreator
    public static PypiResolver create(
        @JsonProperty("id") final String id, @JsonProperty("url") final String url) {
      return new AutoValue_Dependencies_PypiResolver(id, url);
    }
  }

  @AutoValue
  public abstract static class Pypi {
    Pypi() {}

    @JsonProperty("version")
    public abstract String version();

    @JsonProperty("main")
    public abstract Optional<String> main();

    @JsonProperty("binary")
    public abstract boolean binary();

    @JsonCreator
    public static Pypi create(
        @JsonProperty("version") final String version,
        @JsonProperty("main") final String main,
        @JsonProperty("binary") final Boolean binary) {
      final Builder builder = Pypi.builder();
      builder.version(version);
      if (main != null) {
        builder.main(main);
      }
      builder.binary(binary == null ? false : binary);
      return builder.build();
    }

    public static Builder builder() {
      return new AutoValue_Dependencies_Pypi.Builder();
    }

    @AutoValue.Builder
    public abstract static class Builder {
      Builder() {}

      public abstract Builder version(final String version);

      public abstract Builder main(final String main);

      public abstract Builder binary(final boolean binary);

      public abstract Pypi build();
    }
  }
}
