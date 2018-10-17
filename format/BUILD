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

java_binary(
    name = "format",
    args = [
        "--buildifier",
        "$(location //external:spotify_bazel_tools/dependency/buildtools/buildifier)",
    ],
    data = [
        "//external:spotify_bazel_tools/dependency/buildtools/buildifier",
    ],
    javacopts = JAVACOPTS,
    main_class = "com.spotify.format.Main",
    runtime_deps = [
        "//format/src/main/java/com/spotify/format",
    ],
)
