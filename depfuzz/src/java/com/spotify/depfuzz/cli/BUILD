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

load("//tools:java.bzl", "JAVACOPTS")
load("@rules_java//java:defs.bzl", "java_library")

java_library(
    name = "cli",
    srcs = ["Options.java"],
    javacopts = JAVACOPTS,
    visibility = ["//depfuzz:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/google/auto/value:auto-value-annotations",
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/jvm/net/sf/jopt-simple",
        "//3rdparty/tools:auto-value",
    ],
)
