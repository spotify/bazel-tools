package com.spotify.syncrepos.config;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.datatype.guava.GuavaModule;
import com.google.auto.value.AutoValue;
import com.google.common.collect.ImmutableMap;
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

    public Builder git(final String dir, final Git git) {
      gitBuilder().put(dir, git);
      return this;
    }

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
