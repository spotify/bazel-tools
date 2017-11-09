# bazel-tools

This repository contains a collection of tools for working with Bazel workspaces; mostly tailored
towards writing JVM backend services.

  - [depfuzz](depfuzz) - A tool for removing unused dependencies with a fuzzing strategy.
  - [expand-macros](expand-macros) - A tool for expanding Bazel macros into the rules that they
    generate.
  - [format](format) - A tool for formatting all files in the repository according to common style
    guides.
  - [list-unused-files](list-unused-files) - A tool for showing source files that are not used in
    the build.
  - [sync-deps](sync-deps) - A tool for synchronizing third-party dependencies.
  - [sync-repos](sync-repos) - A tool for synchronizing third-party repositories.

Here are guides for the most useful tools:

## Dependency management

There are a few tools that are useful for managing dependencies of a large repository.  The
dependency management assumes that you are using the same versions of all external dependencies
across the repository.

All dependencies should be listed in `3rdparty/dependencies.yaml`.  For now only maven-managed
dependencies are supported.

The structure of that file is as follows:

```yaml
# Options concerning the entire dependency graph
options:
  # Resolvers used during dependency resolution (usually Maven servers). Does not need to match your
  # WORKSPACE maven_servers!
  mavenResolvers:
    - id: "default"
      url: https://repo.maven.apache.org/maven2/
  # Dependencies to completely remove from the dependency graph, because they are not needed.
  excludedDependencies:
    - com.google.guava:guava-jdk5
    - org.slf4j:slf4j-log4j12

# Dependencies to be fetched from Maven repositories
maven:
  # The groupId prefix of dependencies to download
  com.fasterxml.jackson:
    # The artifactId prefix of dependencies to download
    jackson:
      # For Maven artifacts, it's quite common to have a lot of related artifacts with the same
      # version. We chose not to support the Bill Of Manifests (BOM) pattern, and instead use a more
      # concise way to list modules.
      #
      # The modules block is optional and by default this block simply includes the artifact
      # groupId:artifactId.
      modules:
        # <foo>:<bar> will append ".<foo>" to the groupId and "-<bar>" to the artifactId of this
        # block.  In the end, this becomes "com.fasterxml.jackson.core:jackson-annotations"
        - core:annotations
        # Only writing <bar> will append "-<bar>" to the artifactId.  In the end, this becomes
        # "com.fasterxml.jackson:jackson-core" (which doesn't actually exist).
        - core
        # The empty string will not append anything, so the resulting artifact would become
        # "com.fasterxml.jackson:jackson" in this case (which doesn't actually exist).
        - ""

      # The version for all of the artifacts/modules in this group.
      version: "2.9.1"
```

To add dependencies, modify the YAML file and then run the `sync-deps` tool.  This will download all
of the dependencies, and output a few files:

  - `3rdparty/workspace.bzl` - This file exports a Skylark function for each type of dependency that
    is being managed.

    For now only Maven dependencies are supported, so there is a function called
    `maven_dependencies` that is exported.  This function takes a callback argument that will be
    called for every resolved dependency.  The callback will be called with the following `kwargs`:

      - `artifact` - specifies the Maven coordinates of the artifact as
        `<groupId>:<artifactId>:<version>` etc.
      - `name` - specifies a name suitable for use in the `WORKSPACE` e.g. for a `maven_jar` rule.
      - `bind` - specifies a name that the tool expects you to use as the name of a `bind` rule.
        This gives the external dependency a slightly nicer external name.
      - `actual` - specifies the target for the above `bind` rule.
      - `sha1` - (optional) specifies the SHA1 of the JAR if it is known.

    You are expected to call this function with a callback similar to the following:

    ```python
    def declare_maven(name, artifact, bind, actual, sha1=None):
      if sha1 == None:
        print("%s does not have a sha1 checksum; integrity cannot be verified" % (artifact,))
        native.maven_jar(name=name, artifact=artifact)
      else:
        native.maven_jar(name=name, artifact=artifact, sha1=sha1)

      native.bind(name=bind, actual=actual)
    ```
  - `3rdparty/jvm` - This directory contains `BUILD` files that group together artifacts with their
    transitive dependencies in an user-friendly manner.  This lets you refer to dependencies as e.g.
    `//3rdparty/jvm/com/google/guava` in your actual `java_library` dependencies etc.  The directory
    structure is derived from the Maven `groupId` and the rule names from the Maven `artifactId` in
    the case of Maven artifacts.
  - `3rdparty/dependencies.lock` - Contains checksums for verifying the integrity of the dependency
    tree.  Use `sync-deps --verify` to check that everything is in sync with the
    `dependencies.yaml`, for example that a developer has added a dependency while forgetting to run
    `sync-deps`.
