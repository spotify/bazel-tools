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
workspace(name = "spotify_bazel_tools")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "4f95bc867830231b3fa0ab5325632f7865cbe8cef842d2b5a269b59a7df95279",
    strip_prefix = "rules_go-f668026feec298887e7114b01edf72b229829ec9",  # branch master
    urls = ["https://github.com/bazelbuild/rules_go/archive/f668026feec298887e7114b01edf72b229829ec9.zip"],
)

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "e81aab0ff850ecda0e3a704f8c4c8a570875a833199313b51555125339724124",
    strip_prefix = "rules_scala-e9e65ada59823c263352d10c30411f4739d5df25",  # branch master
    urls = ["https://github.com/bazelbuild/rules_scala/archive/e9e65ada59823c263352d10c30411f4739d5df25.zip"],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "5772dfbd67f6fc7ad8aa07fb5896858d4c65b8aee7a54ada69271b962d69535f",
    strip_prefix = "buildtools-405641a50b8583dc9fe254b7a22ebc2002722d17",  # branch master
    urls = ["https://github.com/bazelbuild/buildtools/archive/405641a50b8583dc9fe254b7a22ebc2002722d17.zip"],
)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

scala_register_toolchains()

bind(
    name = "io_bazel_rules_scala/dependency/com_google_protobuf/protobuf_java",
    actual = "//3rdparty/jvm/com/google/protobuf:protobuf-java",
)

bind(
    name = "io_bazel_rules_scala/dependency/scala/parser_combinators",
    actual = "//3rdparty/jvm/org/scala-lang/modules:scala-parser-combinators",
)

bind(
    name = "io_bazel_rules_scala/dependency/scala/scala_compiler",
    actual = "//3rdparty/jvm/org/scala-lang:scala-compiler",
)

bind(
    name = "io_bazel_rules_scala/dependency/scala/scala_library",
    actual = "//3rdparty/jvm/org/scala-lang:scala-library",
)

bind(
    name = "io_bazel_rules_scala/dependency/scala/scala_reflect",
    actual = "//3rdparty/jvm/org/scala-lang:scala-reflect",
)

bind(
    name = "io_bazel_rules_scala/dependency/scala/scala_xml",
    actual = "//3rdparty/jvm/org/scala-lang/modules:scala-xml",
)

bind(
    name = "io_bazel_rules_scala/dependency/scalatest/scalatest",
    actual = "//3rdparty/jvm/org/scalatest:scalatest",
)

load("//:tools.bzl", "bazel_tools_repositories")

bazel_tools_repositories()
