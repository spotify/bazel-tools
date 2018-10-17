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

java_library(
    name = "util",
    srcs = glob(["*.java"]),
    javacopts = JAVACOPTS,
    visibility = ["//sync-deps:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/jvm/org/slf4j:slf4j-api",
    ],
)
