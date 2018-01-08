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

java_library(
    name = "config",
    srcs = glob(["*.java"]),
    visibility = ["//sync-deps:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-annotations",
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-core",
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-databind",
        "//3rdparty/jvm/com/fasterxml/jackson/dataformat:jackson-dataformat-yaml",
        "//3rdparty/jvm/com/fasterxml/jackson/datatype:jackson-datatype-guava",
        "//3rdparty/jvm/com/google/auto/value:auto-value",
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/tools:auto-value",
        "//sync-deps/src/main/java/com/spotify/syncdeps/model",
    ],
)
