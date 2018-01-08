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
licenses(["notice"])

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

scala_library(
    name = "format",
    srcs = glob(["*.scala"]),
    visibility = ["//format:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/geirsson:metaconfig-core_2_11",
        "//3rdparty/jvm/com/geirsson:scalafmt-core_2_11",
    ],
)
