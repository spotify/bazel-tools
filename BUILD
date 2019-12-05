load("@rules_proto//proto:defs.bzl", "proto_lang_toolchain")

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

exports_files(["tools.bzl"])

proto_lang_toolchain(
    name = "protobuf_java_toolchain",
    command_line = "--java_out=$(OUT)",
    runtime = "//3rdparty/jvm/com/google/protobuf:protobuf-java",
    visibility = ["//visibility:public"],
)
