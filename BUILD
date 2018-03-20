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

load("@bazel_tools//tools/jdk:default_java_toolchain.bzl", "default_java_toolchain")

exports_files(["tools.bzl"])

default_java_toolchain(
    name = "java_toolchain",
    bootclasspath = ["@bazel_tools//tools/jdk:platformclasspath.jar"],
    javac = ["@bazel_tools//third_party/java/jdk/langtools:javac_jar"],
    jvm_opts = ["-Xbootclasspath/p:$(location @bazel_tools//third_party/java/jdk/langtools:javac_jar)"],
    package_configuration = [
        ":java_lints",
    ],
    visibility = ["//visibility:public"],
)

java_package_configuration(
    name = "java_lints",
    javacopts = [
        "-Xlint:cast",
        "-Xlint:deprecation",
        "-Xlint:divzero",
        "-Xlint:empty",
        "-Xlint:fallthrough",
        "-Xlint:finally",
        "-Xlint:overrides",
        "-Xlint:path",
        "-Xlint:serial",
        "-Xlint:unchecked",
        "-Xlint:-options",
        "-XepAllDisabledChecksAsWarnings",
        "-XepDisableWarningsInGeneratedCode",
        "-Xep:Var:OFF",
        "-Xep:StaticOrDefaultInterfaceMethod:OFF",
        "-Werror",
    ],
    packages = [":java_linted_packages"],
)

package_group(
    name = "java_linted_packages",
    packages = ["//..."],
)

proto_lang_toolchain(
    name = "protobuf_java_toolchain",
    command_line = "--java_out=$(OUT)",
    runtime = "//3rdparty/jvm/com/google/protobuf:protobuf-java",
    visibility = ["//visibility:public"],
)
