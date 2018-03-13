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

load("//3rdparty:workspace.bzl", "maven_dependencies")
load("//3rdparty:load.bzl", "declare_maven")

def bazel_tools_repositories():
    native.http_archive(
        name = "io_bazel",
        sha256 = "255e1199c0876b9a8cc02d5ea569b6cfe1901d30428355817b7606ddecb04c15",
        strip_prefix = "bazel-0.8.0",  # Should match current Bazel version
        urls = [
            "http://bazel-mirror.storage.googleapis.com/github.com/bazelbuild/bazel/archive/0.8.0.tar.gz",
            "https://github.com/bazelbuild/bazel/archive/0.8.0.tar.gz",
        ],
    )

    native.http_archive(
        name = "spotify_bazel_buildtools",
        sha256 = "99bf4e70a8bf2992accb2e38103da03e121d207f205f9ecdbf7ccf91b0179d4d",
        strip_prefix = "buildtools-121de4df0295e9b6412d871499943762ff70a736",  # branch superhack
        urls = ["https://github.com/dflemstr/buildtools/archive/121de4df0295e9b6412d871499943762ff70a736.zip"],
    )

    maven_dependencies(declare_maven)

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/buildifier",
        actual = "@spotify_bazel_buildtools//buildifier",
    )

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/buildozer",
        actual = "@spotify_bazel_buildtools//buildozer",
    )

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/unused-deps",
        actual = "@spotify_bazel_buildtools//unused_deps",
    )
