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

rules_go_version = "a966c425b0bab18338bc39bf69b8eecc615549ff"  # branch master

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "41eb89962dbf51287a287b7ce75260abe1150693948ad3c41d453331b608659b",
    strip_prefix = "rules_go-%s" % (rules_go_version,),
    urls = ["https://github.com/bazelbuild/rules_go/archive/%s.zip" % (rules_go_version,)],
)

rules_scala_version = "64faf06a4932a9a1d3378b6ba1a6d77479cefef3"  # branch master

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "df0c86f200c4b4aebf4ae9d546c0788cdda6d33accf191a92abfbb8e5f6ddd8a",
    strip_prefix = "rules_scala-%s" % (rules_scala_version,),
    urls = ["https://github.com/bazelbuild/rules_scala/archive/%s.zip" % (rules_scala_version,)],
)

load("//:tools.bzl", "bazel_tools_repositories")

bazel_tools_repositories()

load("@io_bazel_rules_go//go:def.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

scala_register_toolchains()
