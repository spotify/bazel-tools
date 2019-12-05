load("@rules_java//java:defs.bzl", "java_binary")

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

java_binary(
    name = "sync-deps",
    srcs = glob(["src/main/java/**/*.java"]),
    args = [
        "--buildifier",
        "$(location //external:spotify_bazel_tools/dependency/buildtools/buildifier)",
    ],
    data = [
        "//external:spotify_bazel_tools/dependency/buildtools/buildifier",
    ],
    main_class = "com.spotify.syncdeps.Main",
    runtime_deps = [
        "//3rdparty/jvm/ch/qos/logback:logback-classic",
        "//sync-deps/src/main/java/com/spotify/syncdeps",
    ],
)
