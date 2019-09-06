# bazel-tools [![Build Status](https://travis-ci.org/spotify/bazel-tools.svg?branch=master)](https://travis-ci.org/spotify/bazel-tools)

This repository contains a collection of tools for working with Bazel workspaces; mostly tailored
towards writing JVM backend services.

  - [depfuzz](depfuzz) - A tool for removing unused dependencies with a fuzzing strategy.
  - [expand-macros](expand-macros) - A tool for expanding Bazel macros into the rules that they
    generate.
  - [format](format) - A tool for formatting all files in the repository according to common style
    guides.
  - [unused](unused) - A tool for showing source files that are not used in the build.
  - [sync-deps](sync-deps) - A tool for synchronizing third-party dependencies.
  - [sync-repos](sync-repos) - A tool for synchronizing third-party repositories.

These tools are being used in production at Spotify but have been built for very specific use-cases.
They will continue to evolve and cover more use-cases as they mature.

# Usage

Using these tools has some setup cost, but is hopefully worth it in the long run since it only has
to be done once for a large/mono-repository.

Add a `WORKSPACE` dependency on this repository by including the following Skylark rule:

```python
# current SHA1 of branch master
spotify_bazel_tools_version="<fill in SHA1>"
http_archive(
    name = "spotify_bazel_tools",
    sha256 = "<fill in SHA256>",
    strip_prefix = "bazel-tools-%s" % (spotify_bazel_tools_version,),
    urls = ["https://github.com/spotify/bazel-tools/archive/%s.zip" % (spotify_bazel_tools_version,)],
)
```

You additionally need to add Go and Scala support by adding the official plugins for that, e.g.:

```python
# current SHA1 of branch master
rules_go_version="<fill in SHA1>"
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "<fill in SHA256>",
    strip_prefix = "rules_go-%s" % (rules_go_version,),
    urls = ["https://github.com/bazelbuild/rules_go/archive/%s.zip" % (rules_go_version,)],
)

# current SHA1 of branch master
rules_scala_version="<fill in SHA1>"
http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "<fill in SHA256>",
    strip_prefix = "rules_scala-%s" % (rules_scala_version,),
    urls = ["https://github.com/bazelbuild/rules_scala/archive/%s.zip" % (rules_scala_version,)],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()
```

Now you need to declare various tool dependencies.  If you want to use the pre-packaged ones, use
the bundled repository declaration:

```python
load("@spotify_bazel_tools//:tools.bzl", "bazel_tools_repositories")

bazel_tools_repositories()
```

If you want to customize the dependencies, you can instead bind your own versions:

```python
bind(
    name = "spotify_bazel_tools/dependency/buildtools/buildifier",
    actual = "@com_github_bazelbuild_buildtools//buildifier",
)

bind(
    name = "spotify_bazel_tools/dependency/buildtools/buildozer",
    actual = "@com_github_bazelbuild_buildtools//buildozer",
)

bind(
    name = "spotify_bazel_tools/dependency/buildtools/unused_deps",
    actual = "@com_github_bazelbuild_buildtools//unused_deps",
)

# ...and declare your own maven dependencies for Java dependencies, maybe by copy-pasting the
# 3rdparty/dependencies.yaml file from this repository.
```

Now you can start leveraging the tools in this repository by creating a wrapper script, e.g.:

```bash
#!/bin/sh
exec bazel run @spotify_bazel_tools//sync-deps -- -w "$PWD" "$@"
```

...or if you don't want to hold the Bazel lock, but instead want to create a temporary standalone
tool:

```bash
#!/bin/sh
script=$(mktemp)
bazel run --script_path="$script" @spotify_bazel_tools//sync-deps
exec "$script" -w "$PWD" "$@"
```

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
  # The Scala ABI to be used for dependencies with `kind: scala*`
  scalaAbi: "2.11"
  # Dependencies to completely remove from the dependency graph, because they are not needed.
  excludedDependencies:
    - com.google.guava:guava-jdk5
    - org.slf4j:slf4j-log4j12
  # Treat the specific versions in this file as "pinned" (do not use later versions)
  # See this for more info: https://github.com/bazelbuild/rules_jvm_external#resolving-user-specified-and-transitive-dependency-version-conflicts
  versionConflictPolicy: "pinned"

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
      # The dependency kind; can be java, scala, or scala-macro
      kind: java
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
      - `jar` - specifies the path to the resolved ijar.
      - `file` - specifies the path to the resolved JAR file.
      - `bind_jar` - the system expects this to be re-bound to `jar`.
      - `bind_file` - the system expects this to be re-bound to `file`.
      - `sha1` - (optional) specifies the SHA1 of the JAR if it is known.

    You are expected to call this function with a callback similar to the following:

    ```python
    def declare_maven(name, artifact, jar, file, bind_jar, bind_file, sha1=None):
      if sha1 == None:
        # You can also fail here, if preferred
        print("%s does not have a sha1 checksum; integrity cannot be verified" % (artifact,))
        native.maven_jar(name=name, artifact=artifact)
      else:
        native.maven_jar(name=name, artifact=artifact, sha1=sha1)

      native.bind(name=bind_jar, actual=jar)
      native.bind(name=bind_file, actual=file)
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

# Code of Conduct

This project adheres to the [Open Code of Conduct][code-of-conduct]. By participating, you are
expected to honor this code.

[code-of-conduct]: https://github.com/spotify/code-of-conduct/blob/master/code-of-conduct.md
