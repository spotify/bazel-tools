# Copyright 2016-2017 Spotify AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//3rdparty:workspace.bzl", "maven_dependencies")

def bazel_tools_repositories():
    bazel_version = "1.2.1"

    _maybe(
        http_archive,
        name = "io_bazel",
        sha256 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        strip_prefix = "bazel-%s" % bazel_version,  # Should match current Bazel version
        url = "https://github.com/bazelbuild/bazel/releases/download/%s/bazel-%s-dist.zip" % (bazel_version, bazel_version),
    )

    bazelbuild_buildtools_version = "77355e5628b4bfffa932bc8645ea165d9f5c486d"  # branch master

    _maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        sha256 = "df7f345aaf9a5a25ca52d9aae90fbb680fea51e0ffd27d6332a7a6529c59a250",
        strip_prefix = "buildtools-%s" % bazelbuild_buildtools_version,
        url = "https://github.com/bazelbuild/buildtools/archive/%s.zip" % bazelbuild_buildtools_version,
    )

    maven_dependencies()

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/buildifier",
        actual = "@com_github_bazelbuild_buildtools//buildifier",
    )

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/buildozer",
        actual = "@com_github_bazelbuild_buildtools//buildozer",
    )

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/unused-deps",
        actual = "@com_github_bazelbuild_buildtools//unused_deps",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/com_google_protobuf/protobuf_java",
        actual = "//3rdparty/jvm/com/google/protobuf:protobuf-java",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/scala/parser_combinators",
        actual = "//3rdparty/jvm/org/scala-lang/modules:scala-parser-combinators",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/scala/scala_compiler",
        actual = "//3rdparty/jvm/org/scala-lang:scala-compiler",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/scala/scala_library",
        actual = "//3rdparty/jvm/org/scala-lang:scala-library",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/scala/scala_reflect",
        actual = "//3rdparty/jvm/org/scala-lang:scala-reflect",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/scala/scala_xml",
        actual = "//3rdparty/jvm/org/scala-lang/modules:scala-xml",
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/scalatest/scalatest",
        actual = "//3rdparty/jvm/org/scalatest:scalatest",
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
