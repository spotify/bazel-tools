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
    name = "format",
    srcs = glob(["*.java"]),
    visibility = ["//visibility:public"],
    deps = [
        "//3rdparty/jvm/com/google/auto/value:auto-value",
        "//3rdparty/jvm/com/google/googlejavaformat:google-java-format",
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/jvm/net/sf/jopt-simple",
        "//3rdparty/tools:auto-value",
        "//format/src/main/scala/com/spotify/format",
    ],
)
