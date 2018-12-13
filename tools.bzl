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
    _maybe(
        http_archive,
        name = "io_bazel",
        sha256 = "a0333e7e8ce885f85f52bbb239e36810ac340c211c550d10c499f098a2e925a8",
        strip_prefix = "bazel-0.15.2",  # Should match current Bazel version
        urls = [
            "http://bazel-mirror.storage.googleapis.com/github.com/bazelbuild/bazel/archive/0.15.2.tar.gz",
            "https://github.com/bazelbuild/bazel/archive/0.15.2.tar.gz",
        ],
    )

    bazelbuild_buildtools_version = "1f7a4641c80dd8027c676a723cef368bcf94e3b4"  # branch master

    _maybe(
        http_archive,
        name = "com_github_bazelbuild_buildtools",
        sha256 = "5fb3cd3ba4de02c082f29fc317c332f2184f780a24c087388ca57a4fa5f744ab",
        strip_prefix = "buildtools-%s" % (bazelbuild_buildtools_version,),
        urls = ["https://github.com/bazelbuild/buildtools/archive/%s.zip" % (bazelbuild_buildtools_version,)],
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
