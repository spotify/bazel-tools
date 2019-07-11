resolved = [
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/crosstool",
            "actual": "@bazel_tools//tools/cpp:toolchain"
        },
        "native": "bind(name = \"android/crosstool\", actual = \"@bazel_tools//tools/cpp:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/dx_jar_import",
            "actual": "@bazel_tools//tools/android:no_android_sdk_repository_error"
        },
        "native": "bind(name = \"android/dx_jar_import\", actual = \"@bazel_tools//tools/android:no_android_sdk_repository_error\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/sdk",
            "actual": "@bazel_tools//tools/android:poison_pill_android_sdk"
        },
        "native": "bind(name = \"android/sdk\", actual = \"@bazel_tools//tools/android:poison_pill_android_sdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_ndk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_ndk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_sdk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_sdk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "bazel_tools",
            "path": "/home/dflemstr/.cache/bazel/_bazel_dflemstr/install/99a7a698f576d17c0b88a878bda06cdf/_embedded_binaries/embedded_tools"
        },
        "native": "local_repository(name = \"bazel_tools\", path = __embedded_dir__ + \"/\" + \"embedded_tools\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "cc_toolchain",
            "actual": "@local_config_cc//:toolchain"
        },
        "native": "bind(name = \"cc_toolchain\", actual = \"@local_config_cc//:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "databinding_annotation_processor",
            "actual": "@bazel_tools//tools/android:empty"
        },
        "native": "bind(name = \"databinding_annotation_processor\", actual = \"@bazel_tools//tools/android:empty\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "has_androidsdk",
            "actual": "@bazel_tools//tools/android:always_false"
        },
        "native": "bind(name = \"has_androidsdk\", actual = \"@bazel_tools//tools/android:always_false\")"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "spotify_bazel_tools",
            "path": "."
        },
        "native": "local_repository(name = \"spotify_bazel_tools\", path = \".\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_bazelbuild_buildtools' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:19:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:8:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:38:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:18:1",
        "original_attributes": {
            "name": "com_github_bazelbuild_buildtools",
            "remote": "https://github.com/bazelbuild/buildtools.git",
            "branch": "master"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "c9c13cac631b361d98e404c0b37d435b2f84094eac001ec2a59b8805c5ee6782",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/buildtools.git",
                    "commit": "cb043c505543a77814d6aff39a4a3a78061fa4c9",
                    "shallow_since": "1562767385 +0300",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_bazelbuild_buildtools"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'io_bazel' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:19:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:8:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:37:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:18:1",
        "original_attributes": {
            "name": "io_bazel",
            "remote": "https://github.com/bazelbuild/bazel.git",
            "tag": "0.28.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "f06395d182a35cd91e0077c8f5b5ec83e27091ebf1a4ca55d9558eabc5ca1d4b",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/bazel.git",
                    "commit": "18cd9048526f067a4950c6ddbf4b1b3604760af0",
                    "shallow_since": "1562775062 +0200",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "io_bazel"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_go' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:19:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:8:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:39:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:18:1",
        "original_attributes": {
            "name": "io_bazel_rules_go",
            "remote": "https://github.com/bazelbuild/rules_go.git",
            "branch": "master"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "8ae2ae1405e8644ca375ac9200c6a74d97627c2d71474c56d855b51a0de09334",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/rules_go.git",
                    "commit": "d475f375b041daca853610baa32823d361535fba",
                    "shallow_since": "1562800394 -0400",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "io_bazel_rules_go"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:19:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:8:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:40:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:18:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala",
            "remote": "https://github.com/bazelbuild/rules_scala.git",
            "branch": "master"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "425cf9d0216dfeaf2f5006dc7675670f146a61b01ab81968b060f5cf328a8885",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/rules_scala.git",
                    "commit": "8092d5f6165a8d9c4797d5f089c1ba4eee3326b1",
                    "shallow_since": "1561863522 +0300",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "io_bazel_rules_scala"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'rules_jvm_external' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:19:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:8:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/repositories.bzl:41:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:18:1",
        "original_attributes": {
            "name": "rules_jvm_external",
            "remote": "https://github.com/bazelbuild/rules_jvm_external.git",
            "tag": "2.3"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "bfc662a1c1960bffbd83bdc9850d59b29832238de67e03ad67e63960a41bc4a4",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/rules_jvm_external.git",
                    "commit": "0a67f52558976208ea85d49ea36cfd708dad30da",
                    "shallow_since": "1562251604 +0200",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "rules_jvm_external"
                }
            }
        ]
    },
    {
        "original_rule_class": "@rules_jvm_external//:coursier.bzl%pinned_coursier_fetch",
        "definition_information": "Call stack for the definition of repository 'maven' which is a pinned_coursier_fetch (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/rules_jvm_external/coursier.bzl:789:25):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/rules_jvm_external/defs.bzl:92:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/workspace.bzl:6:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/workspace.bzl:17:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:22:1",
        "original_attributes": {
            "name": "maven",
            "artifacts": [
                "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-classic\", \"version\": \"1.2.3\", \"neverlink\": false }",
                "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-core\", \"version\": \"1.2.3\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-annotations\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-core\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-databind\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.dataformat\", \"artifact\": \"jackson-dataformat-yaml\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.datatype\", \"artifact\": \"jackson-datatype-guava\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.geirsson\", \"artifact\": \"scalafmt-core_2.12\", \"version\": \"1.5.1\", \"neverlink\": false }",
                "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-core_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-typesafe-config_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                "{ \"group\": \"com.github.tomas-langer\", \"artifact\": \"chalk\", \"version\": \"1.0.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value\", \"version\": \"1.6.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value-annotations\", \"version\": \"1.6.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"annotations\", \"version\": \"3.0.1\", \"neverlink\": false }",
                "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"jsr305\", \"version\": \"3.0.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.errorprone\", \"artifact\": \"error_prone_annotations\", \"version\": \"2.3.1\", \"neverlink\": false }",
                "{ \"group\": \"com.google.googlejavaformat\", \"artifact\": \"google-java-format\", \"version\": \"1.6\", \"neverlink\": false }",
                "{ \"group\": \"com.google.guava\", \"artifact\": \"guava\", \"version\": \"23.6.1-jre\", \"neverlink\": false }",
                "{ \"group\": \"com.google.protobuf\", \"artifact\": \"protobuf-java\", \"version\": \"3.8.0\", \"neverlink\": false }",
                "{ \"group\": \"com.google.jimfs\", \"artifact\": \"jimfs\", \"version\": \"1.1\", \"neverlink\": false }",
                "{ \"group\": \"com.squareup.okio\", \"artifact\": \"okio\", \"version\": \"1.15.0\", \"neverlink\": false }",
                "{ \"group\": \"net.sf.jopt-simple\", \"artifact\": \"jopt-simple\", \"version\": \"5.0.4\", \"neverlink\": false }",
                "{ \"group\": \"org.hamcrest\", \"artifact\": \"java-hamcrest\", \"version\": \"2.0.0.0\", \"neverlink\": false }",
                "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-compiler\", \"version\": \"2.12.6\", \"neverlink\": false }",
                "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-library\", \"version\": \"2.12.6\", \"neverlink\": false }",
                "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-reflect\", \"version\": \"2.12.6\", \"neverlink\": false }",
                "{ \"group\": \"org.slf4j\", \"artifact\": \"slf4j-api\", \"version\": \"1.7.25\", \"neverlink\": false }"
            ],
            "fetch_sources": True,
            "generate_compat_repositories": False,
            "maven_install_json": "//3rdparty:maven-install.json"
        },
        "repositories": [
            {
                "rule_class": "@rules_jvm_external//:coursier.bzl%pinned_coursier_fetch",
                "output_tree_hash": "91de0238dada1d273f145d6f8481dc935c6a3ad549a56ef04970596de1ccb9be",
                "attributes": {
                    "name": "maven",
                    "artifacts": [
                        "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-classic\", \"version\": \"1.2.3\", \"neverlink\": false }",
                        "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-core\", \"version\": \"1.2.3\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-annotations\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-core\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-databind\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.dataformat\", \"artifact\": \"jackson-dataformat-yaml\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.datatype\", \"artifact\": \"jackson-datatype-guava\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.geirsson\", \"artifact\": \"scalafmt-core_2.12\", \"version\": \"1.5.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-core_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                        "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-typesafe-config_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                        "{ \"group\": \"com.github.tomas-langer\", \"artifact\": \"chalk\", \"version\": \"1.0.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value\", \"version\": \"1.6.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value-annotations\", \"version\": \"1.6.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"annotations\", \"version\": \"3.0.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"jsr305\", \"version\": \"3.0.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.errorprone\", \"artifact\": \"error_prone_annotations\", \"version\": \"2.3.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.googlejavaformat\", \"artifact\": \"google-java-format\", \"version\": \"1.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.guava\", \"artifact\": \"guava\", \"version\": \"23.6.1-jre\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.protobuf\", \"artifact\": \"protobuf-java\", \"version\": \"3.8.0\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.jimfs\", \"artifact\": \"jimfs\", \"version\": \"1.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.squareup.okio\", \"artifact\": \"okio\", \"version\": \"1.15.0\", \"neverlink\": false }",
                        "{ \"group\": \"net.sf.jopt-simple\", \"artifact\": \"jopt-simple\", \"version\": \"5.0.4\", \"neverlink\": false }",
                        "{ \"group\": \"org.hamcrest\", \"artifact\": \"java-hamcrest\", \"version\": \"2.0.0.0\", \"neverlink\": false }",
                        "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-compiler\", \"version\": \"2.12.6\", \"neverlink\": false }",
                        "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-library\", \"version\": \"2.12.6\", \"neverlink\": false }",
                        "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-reflect\", \"version\": \"2.12.6\", \"neverlink\": false }",
                        "{ \"group\": \"org.slf4j\", \"artifact\": \"slf4j-api\", \"version\": \"1.7.25\", \"neverlink\": false }"
                    ],
                    "fetch_sources": True,
                    "generate_compat_repositories": False,
                    "maven_install_json": "//3rdparty:maven-install.json"
                }
            }
        ]
    },
    {
        "original_rule_class": "@rules_jvm_external//:coursier.bzl%coursier_fetch",
        "definition_information": "Call stack for the definition of repository 'unpinned_maven' which is a coursier_fetch (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/rules_jvm_external/coursier.bzl:801:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/rules_jvm_external/defs.bzl:75:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/workspace.bzl:6:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/3rdparty/workspace.bzl:17:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:22:1",
        "original_attributes": {
            "name": "unpinned_maven",
            "repositories": [
                "{ \"repo_url\": \"https://repo.maven.apache.org/maven2/\" }"
            ],
            "artifacts": [
                "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-classic\", \"version\": \"1.2.3\", \"neverlink\": false }",
                "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-core\", \"version\": \"1.2.3\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-annotations\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-core\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-databind\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.dataformat\", \"artifact\": \"jackson-dataformat-yaml\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.fasterxml.jackson.datatype\", \"artifact\": \"jackson-datatype-guava\", \"version\": \"2.9.6\", \"neverlink\": false }",
                "{ \"group\": \"com.geirsson\", \"artifact\": \"scalafmt-core_2.12\", \"version\": \"1.5.1\", \"neverlink\": false }",
                "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-core_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-typesafe-config_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                "{ \"group\": \"com.github.tomas-langer\", \"artifact\": \"chalk\", \"version\": \"1.0.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value\", \"version\": \"1.6.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value-annotations\", \"version\": \"1.6.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"annotations\", \"version\": \"3.0.1\", \"neverlink\": false }",
                "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"jsr305\", \"version\": \"3.0.2\", \"neverlink\": false }",
                "{ \"group\": \"com.google.errorprone\", \"artifact\": \"error_prone_annotations\", \"version\": \"2.3.1\", \"neverlink\": false }",
                "{ \"group\": \"com.google.googlejavaformat\", \"artifact\": \"google-java-format\", \"version\": \"1.6\", \"neverlink\": false }",
                "{ \"group\": \"com.google.guava\", \"artifact\": \"guava\", \"version\": \"23.6.1-jre\", \"neverlink\": false }",
                "{ \"group\": \"com.google.protobuf\", \"artifact\": \"protobuf-java\", \"version\": \"3.8.0\", \"neverlink\": false }",
                "{ \"group\": \"com.google.jimfs\", \"artifact\": \"jimfs\", \"version\": \"1.1\", \"neverlink\": false }",
                "{ \"group\": \"com.squareup.okio\", \"artifact\": \"okio\", \"version\": \"1.15.0\", \"neverlink\": false }",
                "{ \"group\": \"net.sf.jopt-simple\", \"artifact\": \"jopt-simple\", \"version\": \"5.0.4\", \"neverlink\": false }",
                "{ \"group\": \"org.hamcrest\", \"artifact\": \"java-hamcrest\", \"version\": \"2.0.0.0\", \"neverlink\": false }",
                "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-compiler\", \"version\": \"2.12.6\", \"neverlink\": false }",
                "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-library\", \"version\": \"2.12.6\", \"neverlink\": false }",
                "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-reflect\", \"version\": \"2.12.6\", \"neverlink\": false }",
                "{ \"group\": \"org.slf4j\", \"artifact\": \"slf4j-api\", \"version\": \"1.7.25\", \"neverlink\": false }"
            ],
            "fail_on_missing_checksum": True,
            "fetch_sources": True,
            "use_unsafe_shared_cache": False,
            "excluded_artifacts": [
                "{ \"group\": \"com.google.guava\", \"artifact\": \"guava-jdk5\" }",
                "{ \"group\": \"org.slf4j\", \"artifact\": \"slf4j-log4j12\" }"
            ],
            "generate_compat_repositories": False
        },
        "repositories": [
            {
                "rule_class": "@rules_jvm_external//:coursier.bzl%coursier_fetch",
                "output_tree_hash": "321f51904911d493bd40a8cadf8ecf48fa40b9e765e4e0f539715254f4fcfab6",
                "attributes": {
                    "name": "unpinned_maven",
                    "repositories": [
                        "{ \"repo_url\": \"https://repo.maven.apache.org/maven2/\" }"
                    ],
                    "artifacts": [
                        "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-classic\", \"version\": \"1.2.3\", \"neverlink\": false }",
                        "{ \"group\": \"ch.qos.logback\", \"artifact\": \"logback-core\", \"version\": \"1.2.3\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-annotations\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-core\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.core\", \"artifact\": \"jackson-databind\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.dataformat\", \"artifact\": \"jackson-dataformat-yaml\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.fasterxml.jackson.datatype\", \"artifact\": \"jackson-datatype-guava\", \"version\": \"2.9.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.geirsson\", \"artifact\": \"scalafmt-core_2.12\", \"version\": \"1.5.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-core_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                        "{ \"group\": \"com.geirsson\", \"artifact\": \"metaconfig-typesafe-config_2.12\", \"version\": \"0.4.0\", \"neverlink\": false }",
                        "{ \"group\": \"com.github.tomas-langer\", \"artifact\": \"chalk\", \"version\": \"1.0.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value\", \"version\": \"1.6.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.auto.value\", \"artifact\": \"auto-value-annotations\", \"version\": \"1.6.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"annotations\", \"version\": \"3.0.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.code.findbugs\", \"artifact\": \"jsr305\", \"version\": \"3.0.2\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.errorprone\", \"artifact\": \"error_prone_annotations\", \"version\": \"2.3.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.googlejavaformat\", \"artifact\": \"google-java-format\", \"version\": \"1.6\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.guava\", \"artifact\": \"guava\", \"version\": \"23.6.1-jre\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.protobuf\", \"artifact\": \"protobuf-java\", \"version\": \"3.8.0\", \"neverlink\": false }",
                        "{ \"group\": \"com.google.jimfs\", \"artifact\": \"jimfs\", \"version\": \"1.1\", \"neverlink\": false }",
                        "{ \"group\": \"com.squareup.okio\", \"artifact\": \"okio\", \"version\": \"1.15.0\", \"neverlink\": false }",
                        "{ \"group\": \"net.sf.jopt-simple\", \"artifact\": \"jopt-simple\", \"version\": \"5.0.4\", \"neverlink\": false }",
                        "{ \"group\": \"org.hamcrest\", \"artifact\": \"java-hamcrest\", \"version\": \"2.0.0.0\", \"neverlink\": false }",
                        "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-compiler\", \"version\": \"2.12.6\", \"neverlink\": false }",
                        "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-library\", \"version\": \"2.12.6\", \"neverlink\": false }",
                        "{ \"group\": \"org.scala-lang\", \"artifact\": \"scala-reflect\", \"version\": \"2.12.6\", \"neverlink\": false }",
                        "{ \"group\": \"org.slf4j\", \"artifact\": \"slf4j-api\", \"version\": \"1.7.25\", \"neverlink\": false }"
                    ],
                    "fail_on_missing_checksum": True,
                    "fetch_sources": True,
                    "use_unsafe_shared_cache": False,
                    "excluded_artifacts": [
                        "{ \"group\": \"com.google.guava\", \"artifact\": \"guava-jdk5\" }",
                        "{ \"group\": \"org.slf4j\", \"artifact\": \"slf4j-log4j12\" }"
                    ],
                    "generate_compat_repositories": False
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'ch_qos_logback_logback_classic_1_2_3' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:3:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "ch_qos_logback_logback_classic_1_2_3",
            "sha256": "fb53f8539e7fcb8f093a56e138112056ec1dc809ebb020b59d8a36a5ebac37e0",
            "urls": [
                "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "3fc3436e8e50a46181e5d1ed3016cd8e996b1c304d71c52e0c57fcea1653d5b9",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "fb53f8539e7fcb8f093a56e138112056ec1dc809ebb020b59d8a36a5ebac37e0",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3.jar"
                    ],
                    "name": "ch_qos_logback_logback_classic_1_2_3"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'ch_qos_logback_logback_classic_jar_sources_1_2_3' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:8:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "ch_qos_logback_logback_classic_jar_sources_1_2_3",
            "sha256": "480cb5e99519271c9256716d4be1a27054047435ff72078d9deae5c6a19f63eb",
            "urls": [
                "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "f18ba6f5bc6abb96b1cbda008ed41d32e126e3af007b0caf0c323177a8f8b977",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "480cb5e99519271c9256716d4be1a27054047435ff72078d9deae5c6a19f63eb",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3-sources.jar"
                    ],
                    "name": "ch_qos_logback_logback_classic_jar_sources_1_2_3"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'ch_qos_logback_logback_core_1_2_3' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:13:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "ch_qos_logback_logback_core_1_2_3",
            "sha256": "5946d837fe6f960c02a53eda7a6926ecc3c758bbdd69aa453ee429f858217f22",
            "urls": [
                "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ea3149756395932dbdbfe343fc4ec65a2afff840b015ed417adbe08c4527d5b1",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "5946d837fe6f960c02a53eda7a6926ecc3c758bbdd69aa453ee429f858217f22",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3.jar"
                    ],
                    "name": "ch_qos_logback_logback_core_1_2_3"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'ch_qos_logback_logback_core_jar_sources_1_2_3' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:18:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "ch_qos_logback_logback_core_jar_sources_1_2_3",
            "sha256": "1f69b6b638ec551d26b10feeade5a2b77abe347f9759da95022f0da9a63a9971",
            "urls": [
                "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ebf1fa1e22d432db00781de58f686d75d8a5f92733bf951d5b800e28847ba624",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "1f69b6b638ec551d26b10feeade5a2b77abe347f9759da95022f0da9a63a9971",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3-sources.jar"
                    ],
                    "name": "ch_qos_logback_logback_core_jar_sources_1_2_3"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_core_jackson_annotations_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:23:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_core_jackson_annotations_2_9_6",
            "sha256": "4d1ce5575ad53bee8caae4c15016878e2c3ea47276e675a35ea6bdde3bb0e653",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.6/jackson-annotations-2.9.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "a076758197a873aa8cbd4d65958892e0c73cb233e26c88a4f53fe72478fed717",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "4d1ce5575ad53bee8caae4c15016878e2c3ea47276e675a35ea6bdde3bb0e653",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.6/jackson-annotations-2.9.6.jar"
                    ],
                    "name": "com_fasterxml_jackson_core_jackson_annotations_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_core_jackson_annotations_jar_sources_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:28:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_core_jackson_annotations_jar_sources_2_9_6",
            "sha256": "022ac1b2a3ff015f380d0f8e89b7c08488605f8201227ce9c6a9bb92107414cc",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.6/jackson-annotations-2.9.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "727f71841e4bf273205ee292073ad9556b76942a8bb0ac37d1b5d86d41eb6152",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "022ac1b2a3ff015f380d0f8e89b7c08488605f8201227ce9c6a9bb92107414cc",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.9.6/jackson-annotations-2.9.6-sources.jar"
                    ],
                    "name": "com_fasterxml_jackson_core_jackson_annotations_jar_sources_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_core_jackson_core_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:33:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_core_jackson_core_2_9_6",
            "sha256": "fab8746aedd6427788ee390ea04d438ec141bff7eb3476f8bdd5d9110fb2718a",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.6/jackson-core-2.9.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ac5af1f1cc3d34dedde52e6c54e439dc3303f8f49fb51e91922cc1c455fe8384",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "fab8746aedd6427788ee390ea04d438ec141bff7eb3476f8bdd5d9110fb2718a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.6/jackson-core-2.9.6.jar"
                    ],
                    "name": "com_fasterxml_jackson_core_jackson_core_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_core_jackson_core_jar_sources_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:38:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_core_jackson_core_jar_sources_2_9_6",
            "sha256": "8aff614c41c49fb02ac7444dc1a9518f1f9fc5b7c744ada59825225858a0336d",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.6/jackson-core-2.9.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "c887fd5539f7a4979d00984c2cb4eb12f30483256be535086f5001478fc898b9",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "8aff614c41c49fb02ac7444dc1a9518f1f9fc5b7c744ada59825225858a0336d",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-core/2.9.6/jackson-core-2.9.6-sources.jar"
                    ],
                    "name": "com_fasterxml_jackson_core_jackson_core_jar_sources_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_core_jackson_databind_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:43:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_core_jackson_databind_2_9_6",
            "sha256": "657e3e979446d61f88432b9c50f0ccd9c1fe4f1c822d533f5572e4c0d172a125",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.6/jackson-databind-2.9.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "c4b4a058e160d77d9e4f57dfdc381832edbe86d1c36a74fbd9d93df749e4e2c4",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "657e3e979446d61f88432b9c50f0ccd9c1fe4f1c822d533f5572e4c0d172a125",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.6/jackson-databind-2.9.6.jar"
                    ],
                    "name": "com_fasterxml_jackson_core_jackson_databind_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_core_jackson_databind_jar_sources_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:48:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_core_jackson_databind_jar_sources_2_9_6",
            "sha256": "0f867b675f1f641d06517c2c2232b1fcc21bc6d81a5d09cb8fc6102b13d7e881",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.6/jackson-databind-2.9.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "68e579776943cee6025d1d3eb951d9e4bc4f81b609831e978db9462e905ca4de",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "0f867b675f1f641d06517c2c2232b1fcc21bc6d81a5d09cb8fc6102b13d7e881",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.9.6/jackson-databind-2.9.6-sources.jar"
                    ],
                    "name": "com_fasterxml_jackson_core_jackson_databind_jar_sources_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_dataformat_jackson_dataformat_yaml_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:53:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_dataformat_jackson_dataformat_yaml_2_9_6",
            "sha256": "0450f6b1e60c2cc710533c24351adc29db102cb114246321379c54b8a8253ad8",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.9.6/jackson-dataformat-yaml-2.9.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "cdc55a1a13267f4af428f2eec14960a060a54eb26b06328c7f18dc90f3e4e3cd",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "0450f6b1e60c2cc710533c24351adc29db102cb114246321379c54b8a8253ad8",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.9.6/jackson-dataformat-yaml-2.9.6.jar"
                    ],
                    "name": "com_fasterxml_jackson_dataformat_jackson_dataformat_yaml_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_dataformat_jackson_dataformat_yaml_jar_sources_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:58:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_dataformat_jackson_dataformat_yaml_jar_sources_2_9_6",
            "sha256": "f5895b5b5dd2279f0a6ed72c4073e7e4bb5ed74ed55358324a62a70cfc723988",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.9.6/jackson-dataformat-yaml-2.9.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "5829677489342b64292f6db32b10047717d7c3ac56f1a6a4fe5294b047f42866",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "f5895b5b5dd2279f0a6ed72c4073e7e4bb5ed74ed55358324a62a70cfc723988",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/dataformat/jackson-dataformat-yaml/2.9.6/jackson-dataformat-yaml-2.9.6-sources.jar"
                    ],
                    "name": "com_fasterxml_jackson_dataformat_jackson_dataformat_yaml_jar_sources_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_datatype_jackson_datatype_guava_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:63:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_datatype_jackson_datatype_guava_2_9_6",
            "sha256": "a94fbdd2ac6e7e1726593f018dcfd6a54d5d8b524b145bcb6819615431f0f3ea",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-guava/2.9.6/jackson-datatype-guava-2.9.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "d160d6bb312ed6a61edaed24923e1b7447569e3f16b614752cae80eef4954f4e",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a94fbdd2ac6e7e1726593f018dcfd6a54d5d8b524b145bcb6819615431f0f3ea",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-guava/2.9.6/jackson-datatype-guava-2.9.6.jar"
                    ],
                    "name": "com_fasterxml_jackson_datatype_jackson_datatype_guava_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_fasterxml_jackson_datatype_jackson_datatype_guava_jar_sources_2_9_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:68:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_fasterxml_jackson_datatype_jackson_datatype_guava_jar_sources_2_9_6",
            "sha256": "b5c17d6172da492ff6e4a6766d04136b9cbdd618a0bbb04f061950d258e93d7b",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-guava/2.9.6/jackson-datatype-guava-2.9.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "279bcca1a945e3bd4bd88e430ab2a12bd4113dc2c82410c9be866aab9b1ea16f",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "b5c17d6172da492ff6e4a6766d04136b9cbdd618a0bbb04f061950d258e93d7b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/fasterxml/jackson/datatype/jackson-datatype-guava/2.9.6/jackson-datatype-guava-2.9.6-sources.jar"
                    ],
                    "name": "com_fasterxml_jackson_datatype_jackson_datatype_guava_jar_sources_2_9_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_geirsson_metaconfig_core_2_12_0_4_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:73:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_geirsson_metaconfig_core_2_12_0_4_0",
            "sha256": "6bd25189a12b1edbf1511c44783e611a9edd738841901b9243803ff9c696c78a",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-core_2.12/0.4.0/metaconfig-core_2.12-0.4.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "aea681cf6a4d17efe238b31c2d2eccb7bf36a877bdc71e54dd422bef0d523a35",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "6bd25189a12b1edbf1511c44783e611a9edd738841901b9243803ff9c696c78a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-core_2.12/0.4.0/metaconfig-core_2.12-0.4.0.jar"
                    ],
                    "name": "com_geirsson_metaconfig_core_2_12_0_4_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_geirsson_metaconfig_core_2_12_jar_sources_0_4_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:78:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_geirsson_metaconfig_core_2_12_jar_sources_0_4_0",
            "sha256": "f9ca3ea8723afe3e9213a5664cf8bc3b212d3e7cf861f1d0a96621d89270d532",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-core_2.12/0.4.0/metaconfig-core_2.12-0.4.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "eccda16e6c9c51730b261d5f35b8125cc5b8a10fe95f89271bd7e97d3e3eaace",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "f9ca3ea8723afe3e9213a5664cf8bc3b212d3e7cf861f1d0a96621d89270d532",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-core_2.12/0.4.0/metaconfig-core_2.12-0.4.0-sources.jar"
                    ],
                    "name": "com_geirsson_metaconfig_core_2_12_jar_sources_0_4_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_geirsson_metaconfig_typesafe_config_2_12_0_4_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:83:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_geirsson_metaconfig_typesafe_config_2_12_0_4_0",
            "sha256": "e8f6f38738a96c4c09dbf5e5c687000556a0920b63e8e4fc19bb6cbc6d8dcfbd",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-typesafe-config_2.12/0.4.0/metaconfig-typesafe-config_2.12-0.4.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "97a98e6132160003ae59e7fb3bc9470838c972d4b76601dff587b9edaeca6900",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "e8f6f38738a96c4c09dbf5e5c687000556a0920b63e8e4fc19bb6cbc6d8dcfbd",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-typesafe-config_2.12/0.4.0/metaconfig-typesafe-config_2.12-0.4.0.jar"
                    ],
                    "name": "com_geirsson_metaconfig_typesafe_config_2_12_0_4_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_geirsson_metaconfig_typesafe_config_2_12_jar_sources_0_4_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:88:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_geirsson_metaconfig_typesafe_config_2_12_jar_sources_0_4_0",
            "sha256": "3c0bf468508f0f0f6b82c0ce72c996235eb7568f996fb1d1b1253c548e018170",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-typesafe-config_2.12/0.4.0/metaconfig-typesafe-config_2.12-0.4.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "0ebe3a013cba46635d4b4b6b41011d020a310143f289508203eb13bd5303bb13",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "3c0bf468508f0f0f6b82c0ce72c996235eb7568f996fb1d1b1253c548e018170",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/geirsson/metaconfig-typesafe-config_2.12/0.4.0/metaconfig-typesafe-config_2.12-0.4.0-sources.jar"
                    ],
                    "name": "com_geirsson_metaconfig_typesafe_config_2_12_jar_sources_0_4_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_geirsson_scalafmt_core_2_12_1_5_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:93:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_geirsson_scalafmt_core_2_12_1_5_1",
            "sha256": "808649767cdba809b8e239e3c0f7195f09e04de06dd6281f3471e90a8ca79f55",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/geirsson/scalafmt-core_2.12/1.5.1/scalafmt-core_2.12-1.5.1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "16a53b63880184bd83c13e59a5895d410ae632aebc14337d76ff35f512700cab",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "808649767cdba809b8e239e3c0f7195f09e04de06dd6281f3471e90a8ca79f55",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/geirsson/scalafmt-core_2.12/1.5.1/scalafmt-core_2.12-1.5.1.jar"
                    ],
                    "name": "com_geirsson_scalafmt_core_2_12_1_5_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_geirsson_scalafmt_core_2_12_jar_sources_1_5_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:98:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_geirsson_scalafmt_core_2_12_jar_sources_1_5_1",
            "sha256": "0a996288cf2b0955e74a8ec6aef6714b4b468b42cef717d2c922f59482822b7c",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/geirsson/scalafmt-core_2.12/1.5.1/scalafmt-core_2.12-1.5.1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "d674c85a60e475b108f7db5877a6ffe588ac39f7f84a92d1d08e5a6cf27bdb4b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "0a996288cf2b0955e74a8ec6aef6714b4b468b42cef717d2c922f59482822b7c",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/geirsson/scalafmt-core_2.12/1.5.1/scalafmt-core_2.12-1.5.1-sources.jar"
                    ],
                    "name": "com_geirsson_scalafmt_core_2_12_jar_sources_1_5_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_github_tomas_langer_chalk_1_0_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:103:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_github_tomas_langer_chalk_1_0_2",
            "sha256": "1bbdca6337a288e28a650e50d0121cfad69065b4ef9ff19c2974e5e78cee5eb6",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/github/tomas-langer/chalk/1.0.2/chalk-1.0.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "3a23cb9d6f5795ed5b3b42d3b880416221f466605258bcb66048f1cbcb7e070e",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "1bbdca6337a288e28a650e50d0121cfad69065b4ef9ff19c2974e5e78cee5eb6",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/github/tomas-langer/chalk/1.0.2/chalk-1.0.2.jar"
                    ],
                    "name": "com_github_tomas_langer_chalk_1_0_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_github_tomas_langer_chalk_jar_sources_1_0_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:108:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_github_tomas_langer_chalk_jar_sources_1_0_2",
            "sha256": "a7bedcd7adb4a934682c78c527c6b15e9c06d976e614a1f1185c559a3019870c",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/github/tomas-langer/chalk/1.0.2/chalk-1.0.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "9e8cdfbbfd919687116ca453e2787cfe034f639646468b61a20361916fd21766",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a7bedcd7adb4a934682c78c527c6b15e9c06d976e614a1f1185c559a3019870c",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/github/tomas-langer/chalk/1.0.2/chalk-1.0.2-sources.jar"
                    ],
                    "name": "com_github_tomas_langer_chalk_jar_sources_1_0_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_value_auto_value_1_6_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:123:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_auto_value_auto_value_1_6_2",
            "sha256": "edbe65a5c53e3d4f5cb10b055d4884ae7705a7cd697be4b2a5d8427761b8ba12",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value/1.6.2/auto-value-1.6.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "4200631ad9af4d98c257b7dba7c0cfd94ff04c0fbc7486afa0cb0c4e5caf37c4",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "edbe65a5c53e3d4f5cb10b055d4884ae7705a7cd697be4b2a5d8427761b8ba12",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value/1.6.2/auto-value-1.6.2.jar"
                    ],
                    "name": "com_google_auto_value_auto_value_1_6_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_value_auto_value_annotations_1_6_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:113:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_auto_value_auto_value_annotations_1_6_2",
            "sha256": "b48b04ddba40e8ac33bf036f06fc43995fc5084bd94bdaace807ce27d3bea3fb",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value-annotations/1.6.2/auto-value-annotations-1.6.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "35e4dd7a28561bbc47fa96cb5b147d5b6cb7775e12c5e6a92bb42b202cef5b69",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "b48b04ddba40e8ac33bf036f06fc43995fc5084bd94bdaace807ce27d3bea3fb",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value-annotations/1.6.2/auto-value-annotations-1.6.2.jar"
                    ],
                    "name": "com_google_auto_value_auto_value_annotations_1_6_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_value_auto_value_annotations_jar_sources_1_6_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:118:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_auto_value_auto_value_annotations_jar_sources_1_6_2",
            "sha256": "9cca705ffd696133e998e289defcc332be5196dbcb6813fcd317b14775a24612",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value-annotations/1.6.2/auto-value-annotations-1.6.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "cb4be4f7c08b3528ccf1af8ac1b7885305630e38d4da2945fc65fed8e0eb73c6",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "9cca705ffd696133e998e289defcc332be5196dbcb6813fcd317b14775a24612",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value-annotations/1.6.2/auto-value-annotations-1.6.2-sources.jar"
                    ],
                    "name": "com_google_auto_value_auto_value_annotations_jar_sources_1_6_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_auto_value_auto_value_jar_sources_1_6_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:128:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_auto_value_auto_value_jar_sources_1_6_2",
            "sha256": "d9959ea21834ec9e213378d719b2a7f705efca9b01667cd28718a47683dc273a",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value/1.6.2/auto-value-1.6.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "e2cca79e3edbf4816a71f6ee266f23b3f14147704cd18e9f875e1ad48dd4d66a",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d9959ea21834ec9e213378d719b2a7f705efca9b01667cd28718a47683dc273a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/auto/value/auto-value/1.6.2/auto-value-1.6.2-sources.jar"
                    ],
                    "name": "com_google_auto_value_auto_value_jar_sources_1_6_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_code_findbugs_annotations_3_0_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:133:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_code_findbugs_annotations_3_0_1",
            "sha256": "6b47ff0a6de0ce17cbedc3abb0828ca5bce3009d53ea47b3723ff023c4742f79",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "f34d9ff1020e03eed49cf428df79932d4cbd55b33a62f8bc0bcf6e561b6b7955",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "6b47ff0a6de0ce17cbedc3abb0828ca5bce3009d53ea47b3723ff023c4742f79",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1.jar"
                    ],
                    "name": "com_google_code_findbugs_annotations_3_0_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_code_findbugs_annotations_jar_sources_3_0_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:138:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_code_findbugs_annotations_jar_sources_3_0_1",
            "sha256": "1a64119813ca80a6ebef047190a4f62ee4ad44afe786e92d698ba7aa730ffc0a",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "557c285363ba997580a368d7649f2c2fc671ce737279dc5702d43ddad09c235d",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "1a64119813ca80a6ebef047190a4f62ee4ad44afe786e92d698ba7aa730ffc0a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1/annotations-3.0.1-sources.jar"
                    ],
                    "name": "com_google_code_findbugs_annotations_jar_sources_3_0_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_code_findbugs_jsr305_3_0_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:143:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_code_findbugs_jsr305_3_0_2",
            "sha256": "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "6a5c7fde85b94005915130e782ba1a041c30df30b4e5f4e78005ea81c40673c1",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"
                    ],
                    "name": "com_google_code_findbugs_jsr305_3_0_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_code_findbugs_jsr305_jar_sources_3_0_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:148:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_code_findbugs_jsr305_jar_sources_3_0_2",
            "sha256": "1c9e85e272d0708c6a591dc74828c71603053b48cc75ae83cce56912a2aa063b",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "255dc124453c837e461b2a774333816afdad9ec571f75906b2f399825748ea64",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "1c9e85e272d0708c6a591dc74828c71603053b48cc75ae83cce56912a2aa063b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2-sources.jar"
                    ],
                    "name": "com_google_code_findbugs_jsr305_jar_sources_3_0_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_errorprone_error_prone_annotations_2_3_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:153:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_errorprone_error_prone_annotations_2_3_1",
            "sha256": "10a5949aa0f95c8de4fd47edfe20534d2acefd8c224f8afea1f607e112816120",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.1/error_prone_annotations-2.3.1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "7e2772e239f510cacbc49f454102934fde7bada186659d5957a685636d2cda08",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "10a5949aa0f95c8de4fd47edfe20534d2acefd8c224f8afea1f607e112816120",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.1/error_prone_annotations-2.3.1.jar"
                    ],
                    "name": "com_google_errorprone_error_prone_annotations_2_3_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_errorprone_error_prone_annotations_jar_sources_2_3_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:158:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_errorprone_error_prone_annotations_jar_sources_2_3_1",
            "sha256": "0fe3db0b12e624afd1dbeba85421fa58c362f9caf55f1869d7683b8744c53616",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.1/error_prone_annotations-2.3.1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "391a39d772c1fd4c8cf46f0817854d20c583ef5d5a0cd2db17a6554f57a7b7b7",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "0fe3db0b12e624afd1dbeba85421fa58c362f9caf55f1869d7683b8744c53616",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.1/error_prone_annotations-2.3.1-sources.jar"
                    ],
                    "name": "com_google_errorprone_error_prone_annotations_jar_sources_2_3_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_errorprone_javac_shaded_9_181_r4173_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:163:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_errorprone_javac_shaded_9_181_r4173_1",
            "sha256": "ae6f663a36bac1855076072afd650cdc0076b08f8129fbff504e73e74095a021",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/errorprone/javac-shaded/9%2B181-r4173-1/javac-shaded-9%2B181-r4173-1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "fb63634a17fc7e054260a425b7b29edd4b299694f45c9929615daf5e2bb8cb64",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "ae6f663a36bac1855076072afd650cdc0076b08f8129fbff504e73e74095a021",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/errorprone/javac-shaded/9%2B181-r4173-1/javac-shaded-9%2B181-r4173-1.jar"
                    ],
                    "name": "com_google_errorprone_javac_shaded_9_181_r4173_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_errorprone_javac_shaded_jar_sources_9_181_r4173_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:168:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_errorprone_javac_shaded_jar_sources_9_181_r4173_1",
            "sha256": "b6487292a495b2c44f6975b797f8eb80290609a995c792519ee116c71fc1663b",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/errorprone/javac-shaded/9%2B181-r4173-1/javac-shaded-9%2B181-r4173-1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "4b3a3ef71ec50376737d08a6bed6900c8f90c7c7df89301c470dd2adef4444d0",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "b6487292a495b2c44f6975b797f8eb80290609a995c792519ee116c71fc1663b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/errorprone/javac-shaded/9%2B181-r4173-1/javac-shaded-9%2B181-r4173-1-sources.jar"
                    ],
                    "name": "com_google_errorprone_javac_shaded_jar_sources_9_181_r4173_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_googlejavaformat_google_java_format_1_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:173:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_googlejavaformat_google_java_format_1_6",
            "sha256": "fdb408913d3120ab4dd7e631f5857fe8b1bda2fba4dcc26b253dd6eab5b48020",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/googlejavaformat/google-java-format/1.6/google-java-format-1.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "c67ee466d60e682174aed418fa83f89cd04d28d9d78f80a109956c4315858f3c",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "fdb408913d3120ab4dd7e631f5857fe8b1bda2fba4dcc26b253dd6eab5b48020",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/googlejavaformat/google-java-format/1.6/google-java-format-1.6.jar"
                    ],
                    "name": "com_google_googlejavaformat_google_java_format_1_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_googlejavaformat_google_java_format_jar_sources_1_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:178:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_googlejavaformat_google_java_format_jar_sources_1_6",
            "sha256": "3ce9a79d45b8208f63ee5b6dce80780caf2796dd3bac8d6346bbe52327690ee5",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/googlejavaformat/google-java-format/1.6/google-java-format-1.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "12c6ee97571b3c946d4ee202dc7a2ac6cd33d78a24e2a6e636e15482eb3c31ba",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "3ce9a79d45b8208f63ee5b6dce80780caf2796dd3bac8d6346bbe52327690ee5",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/googlejavaformat/google-java-format/1.6/google-java-format-1.6-sources.jar"
                    ],
                    "name": "com_google_googlejavaformat_google_java_format_jar_sources_1_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_guava_guava_23_6_1_jre' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:183:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_guava_guava_23_6_1_jre",
            "sha256": "9987480e19dba2cc76984c96926a7e9ffbfed3c3fc4ee57e2ae040721d61d5df",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/guava/guava/23.6.1-jre/guava-23.6.1-jre.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "b8c1f8973a20bc2babd4d5e4b587738f74cb975663a1de089d0efcd122738b1d",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "9987480e19dba2cc76984c96926a7e9ffbfed3c3fc4ee57e2ae040721d61d5df",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/guava/guava/23.6.1-jre/guava-23.6.1-jre.jar"
                    ],
                    "name": "com_google_guava_guava_23_6_1_jre"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_guava_guava_jar_sources_23_6_1_jre' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:188:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_guava_guava_jar_sources_23_6_1_jre",
            "sha256": "36a4a0c6bc406a961eff0771a5edaf01a6ea3512192bba3d1f5ac64d395acca0",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/guava/guava/23.6.1-jre/guava-23.6.1-jre-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "c1f4fd0dc482ff1dff0f5d77ef600087c72cf7f0093f3c20ae4be8746196f112",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "36a4a0c6bc406a961eff0771a5edaf01a6ea3512192bba3d1f5ac64d395acca0",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/guava/guava/23.6.1-jre/guava-23.6.1-jre-sources.jar"
                    ],
                    "name": "com_google_guava_guava_jar_sources_23_6_1_jre"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_j2objc_j2objc_annotations_1_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:193:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_j2objc_j2objc_annotations_1_1",
            "sha256": "2994a7eb78f2710bd3d3bfb639b2c94e219cedac0d4d084d516e78c16dddecf6",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8610e196b70a10e504731434a669548a6feb7d5ed2c26402be538b5e9821e6df",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2994a7eb78f2710bd3d3bfb639b2c94e219cedac0d4d084d516e78c16dddecf6",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar"
                    ],
                    "name": "com_google_j2objc_j2objc_annotations_1_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_j2objc_j2objc_annotations_jar_sources_1_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:198:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_j2objc_j2objc_annotations_jar_sources_1_1",
            "sha256": "2cd9022a77151d0b574887635cdfcdf3b78155b602abc89d7f8e62aba55cfb4f",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "37522a41d43c2a4b3b436d1de6d82015f4f8d5ce58bd5bda55c82e8a475e6bf3",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2cd9022a77151d0b574887635cdfcdf3b78155b602abc89d7f8e62aba55cfb4f",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1-sources.jar"
                    ],
                    "name": "com_google_j2objc_j2objc_annotations_jar_sources_1_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_jimfs_jimfs_1_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:203:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_jimfs_jimfs_1_1",
            "sha256": "c4828e28d7c0a930af9387510b3bada7daa5c04d7c25a75c7b8b081f1c257ddd",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/jimfs/jimfs/1.1/jimfs-1.1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "59b2570bc81dd0c6b80188fffca6ca8ec6c8063be895e75fafc21375bcfb3567",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "c4828e28d7c0a930af9387510b3bada7daa5c04d7c25a75c7b8b081f1c257ddd",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/jimfs/jimfs/1.1/jimfs-1.1.jar"
                    ],
                    "name": "com_google_jimfs_jimfs_1_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_jimfs_jimfs_jar_sources_1_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:208:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_jimfs_jimfs_jar_sources_1_1",
            "sha256": "adebb53450d2313d6927db5155c9be85336109e8f8c0af106ec2a30bc37e64ce",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/jimfs/jimfs/1.1/jimfs-1.1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "07e2b42e31c5e95c48dec7d6ad8d53bcab720a968a9264e872fa9db11594a182",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "adebb53450d2313d6927db5155c9be85336109e8f8c0af106ec2a30bc37e64ce",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/jimfs/jimfs/1.1/jimfs-1.1-sources.jar"
                    ],
                    "name": "com_google_jimfs_jimfs_jar_sources_1_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_protobuf_protobuf_java_3_8_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:213:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_protobuf_protobuf_java_3_8_0",
            "sha256": "94ba90a869ddad07eb49afaa8f39e676c2554b5b1c417ad9e1188257e79be60f",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.8.0/protobuf-java-3.8.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "9987ebdf7afbd4ea8e0e34d98a805115630a3968906a174d4f0070b292550d5b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "94ba90a869ddad07eb49afaa8f39e676c2554b5b1c417ad9e1188257e79be60f",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.8.0/protobuf-java-3.8.0.jar"
                    ],
                    "name": "com_google_protobuf_protobuf_java_3_8_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_google_protobuf_protobuf_java_jar_sources_3_8_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:218:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_google_protobuf_protobuf_java_jar_sources_3_8_0",
            "sha256": "1982b2a96f752cf0d64c3066b5e9e4016f9cc825591f3d1a9c40a017203fcb2f",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.8.0/protobuf-java-3.8.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "95e5698900be675d21423ed13206e62c48c7ad559b64525da33a2ceae96f79ee",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "1982b2a96f752cf0d64c3066b5e9e4016f9cc825591f3d1a9c40a017203fcb2f",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.8.0/protobuf-java-3.8.0-sources.jar"
                    ],
                    "name": "com_google_protobuf_protobuf_java_jar_sources_3_8_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_fastparse_2_12_0_4_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:233:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_fastparse_2_12_0_4_2",
            "sha256": "43f57787179e902137167ba107e665272a0764f1addb3f452136f15bad5b21a8",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse_2.12/0.4.2/fastparse_2.12-0.4.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "fd7fc18cc60bf4cca7bac96824e5477e1a44331cc3153b017475804aef801d48",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "43f57787179e902137167ba107e665272a0764f1addb3f452136f15bad5b21a8",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse_2.12/0.4.2/fastparse_2.12-0.4.2.jar"
                    ],
                    "name": "com_lihaoyi_fastparse_2_12_0_4_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_fastparse_2_12_jar_sources_0_4_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:238:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_fastparse_2_12_jar_sources_0_4_2",
            "sha256": "8e242feb1704b8483969c726056c46e5ba2bb659c943d336ae3948b3a507707d",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse_2.12/0.4.2/fastparse_2.12-0.4.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "474168be31a656bbca138b24d6c5b718f3ff939f68a9dd1b9ae3175f37e0ab18",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "8e242feb1704b8483969c726056c46e5ba2bb659c943d336ae3948b3a507707d",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse_2.12/0.4.2/fastparse_2.12-0.4.2-sources.jar"
                    ],
                    "name": "com_lihaoyi_fastparse_2_12_jar_sources_0_4_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_fastparse_utils_2_12_0_4_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:223:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_fastparse_utils_2_12_0_4_2",
            "sha256": "0da40d3c89d3f7009ac2f6e32b11d8cdd379b40a2f09ce08669b4695f558e101",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse-utils_2.12/0.4.2/fastparse-utils_2.12-0.4.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "3f8555d6546c840a7e60cf8e79c96c530e27a918ca80918f4281ebd762d260f4",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "0da40d3c89d3f7009ac2f6e32b11d8cdd379b40a2f09ce08669b4695f558e101",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse-utils_2.12/0.4.2/fastparse-utils_2.12-0.4.2.jar"
                    ],
                    "name": "com_lihaoyi_fastparse_utils_2_12_0_4_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_fastparse_utils_2_12_jar_sources_0_4_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:228:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_fastparse_utils_2_12_jar_sources_0_4_2",
            "sha256": "1eb227bc9659ce84b40d2d258c9ea3e8b8246f362241f43422266e05cabc902d",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse-utils_2.12/0.4.2/fastparse-utils_2.12-0.4.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "4ce03b2daa80f1dbf6c5c27a902a25d3bf646b8e08a7fd8560f1daaa70755f6f",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "1eb227bc9659ce84b40d2d258c9ea3e8b8246f362241f43422266e05cabc902d",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse-utils_2.12/0.4.2/fastparse-utils_2.12-0.4.2-sources.jar"
                    ],
                    "name": "com_lihaoyi_fastparse_utils_2_12_jar_sources_0_4_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_scalaparse_2_12_0_4_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:243:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_scalaparse_2_12_0_4_2",
            "sha256": "148c9ea912639404faef7c8e607260787384ae9a2973120c71e440f78c3b5082",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/scalaparse_2.12/0.4.2/scalaparse_2.12-0.4.2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "cb968b1f3e5e5c2698234523639f973e991988895bb81aa4990e55c68b7c5101",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "148c9ea912639404faef7c8e607260787384ae9a2973120c71e440f78c3b5082",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/scalaparse_2.12/0.4.2/scalaparse_2.12-0.4.2.jar"
                    ],
                    "name": "com_lihaoyi_scalaparse_2_12_0_4_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_scalaparse_2_12_jar_sources_0_4_2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:248:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_scalaparse_2_12_jar_sources_0_4_2",
            "sha256": "faeabf3ef43474e8eb45a704a2490e1aa1fb7dfc49cfb8e458d1f51318a55bb9",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/scalaparse_2.12/0.4.2/scalaparse_2.12-0.4.2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "34d05a94d0909cf26126c5b83bdb2cbb027b7a857e2c41a2754bc1ceea60ab41",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "faeabf3ef43474e8eb45a704a2490e1aa1fb7dfc49cfb8e458d1f51318a55bb9",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/scalaparse_2.12/0.4.2/scalaparse_2.12-0.4.2-sources.jar"
                    ],
                    "name": "com_lihaoyi_scalaparse_2_12_jar_sources_0_4_2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_sourcecode_2_12_0_1_3' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:253:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_sourcecode_2_12_0_1_3",
            "sha256": "3ba3aca0d46496a3304798db8c8d79eedbdf29846b988a0a65207cc13408deca",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.3/sourcecode_2.12-0.1.3.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "80542b0fa3e08b33cef8589278508d369cea9253c988772d58561019ee063cfd",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "3ba3aca0d46496a3304798db8c8d79eedbdf29846b988a0a65207cc13408deca",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.3/sourcecode_2.12-0.1.3.jar"
                    ],
                    "name": "com_lihaoyi_sourcecode_2_12_0_1_3"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_lihaoyi_sourcecode_2_12_jar_sources_0_1_3' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:258:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_lihaoyi_sourcecode_2_12_jar_sources_0_1_3",
            "sha256": "5e20864291d9ef92841282606d99434b7af938619689218180717cb72851f7da",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.3/sourcecode_2.12-0.1.3-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "d4554b94e32bd8cc82e2bca653001f96f067b1bc2f9f4f831205efbcac6a74e7",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "5e20864291d9ef92841282606d99434b7af938619689218180717cb72851f7da",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.3/sourcecode_2.12-0.1.3-sources.jar"
                    ],
                    "name": "com_lihaoyi_sourcecode_2_12_jar_sources_0_1_3"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_squareup_okio_okio_1_15_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:263:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_squareup_okio_okio_1_15_0",
            "sha256": "693fa319a7e8843300602b204023b7674f106ebcb577f2dd5807212b66118bd2",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.15.0/okio-1.15.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "56489bc931bb9647376bc9377bbb9adb2d5f2b524dede2f5f94279a97f7d900b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "693fa319a7e8843300602b204023b7674f106ebcb577f2dd5807212b66118bd2",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.15.0/okio-1.15.0.jar"
                    ],
                    "name": "com_squareup_okio_okio_1_15_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_squareup_okio_okio_jar_sources_1_15_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:268:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_squareup_okio_okio_jar_sources_1_15_0",
            "sha256": "a15f2a8344920da8a68eb4a59089eae1adde5bac1805875ca381cb5b3d96e912",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.15.0/okio-1.15.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ed1915034d1e261f7854f6d3c52d0c780f50e5ef7ec6b20d3a79b6396037ef65",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a15f2a8344920da8a68eb4a59089eae1adde5bac1805875ca381cb5b3d96e912",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.15.0/okio-1.15.0-sources.jar"
                    ],
                    "name": "com_squareup_okio_okio_jar_sources_1_15_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_trueaccord_lenses_lenses_2_12_0_4_10' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:273:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_trueaccord_lenses_lenses_2_12_0_4_10",
            "sha256": "2c4d6218d81eb682927ddccb386c8c3577e4cdf098130fc25bae4c9f9d312e16",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/trueaccord/lenses/lenses_2.12/0.4.10/lenses_2.12-0.4.10.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "57fb054eb287c502a73382fe8fb524d89412e897d8e77d786178830ba990926c",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2c4d6218d81eb682927ddccb386c8c3577e4cdf098130fc25bae4c9f9d312e16",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/trueaccord/lenses/lenses_2.12/0.4.10/lenses_2.12-0.4.10.jar"
                    ],
                    "name": "com_trueaccord_lenses_lenses_2_12_0_4_10"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_trueaccord_lenses_lenses_2_12_jar_sources_0_4_10' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:278:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_trueaccord_lenses_lenses_2_12_jar_sources_0_4_10",
            "sha256": "ee3896f145d5ac5ea9966a702fe30641caa1670bf6a5f74376ba75fd2273c558",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/trueaccord/lenses/lenses_2.12/0.4.10/lenses_2.12-0.4.10-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "06ecdaa138f9368ebb4ee3c0dc61d189479b521403ff721e9df473c067ccc333",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "ee3896f145d5ac5ea9966a702fe30641caa1670bf6a5f74376ba75fd2273c558",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/trueaccord/lenses/lenses_2.12/0.4.10/lenses_2.12-0.4.10-sources.jar"
                    ],
                    "name": "com_trueaccord_lenses_lenses_2_12_jar_sources_0_4_10"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_trueaccord_scalapb_scalapb_runtime_2_12_0_6_0_pre2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:283:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_trueaccord_scalapb_scalapb_runtime_2_12_0_6_0_pre2",
            "sha256": "07bc456f05bb654db0cae9361bd6240d5892f3066534fd5e46b6922f2cbdb1c7",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/trueaccord/scalapb/scalapb-runtime_2.12/0.6.0-pre2/scalapb-runtime_2.12-0.6.0-pre2.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "794442eaf02585ffba74f155c838b1b271a803a1afd40378bea73fc335de8da7",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "07bc456f05bb654db0cae9361bd6240d5892f3066534fd5e46b6922f2cbdb1c7",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/trueaccord/scalapb/scalapb-runtime_2.12/0.6.0-pre2/scalapb-runtime_2.12-0.6.0-pre2.jar"
                    ],
                    "name": "com_trueaccord_scalapb_scalapb_runtime_2_12_0_6_0_pre2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_trueaccord_scalapb_scalapb_runtime_2_12_jar_sources_0_6_0_pre2' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:288:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_trueaccord_scalapb_scalapb_runtime_2_12_jar_sources_0_6_0_pre2",
            "sha256": "d14e202e4583e9c5b8808e090284a7bf362feab80918846f039b744d169a7ecc",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/trueaccord/scalapb/scalapb-runtime_2.12/0.6.0-pre2/scalapb-runtime_2.12-0.6.0-pre2-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "a984e4c6a75b9bbfd88ba4a83cf4930ede16d03e405878b97ca3acc70ceab964",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d14e202e4583e9c5b8808e090284a7bf362feab80918846f039b744d169a7ecc",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/trueaccord/scalapb/scalapb-runtime_2.12/0.6.0-pre2/scalapb-runtime_2.12-0.6.0-pre2-sources.jar"
                    ],
                    "name": "com_trueaccord_scalapb_scalapb_runtime_2_12_jar_sources_0_6_0_pre2"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_typesafe_config_1_2_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:293:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_typesafe_config_1_2_1",
            "sha256": "c160fbd78f51a0c2375a794e435ce2112524a6871f64d0331895e9e26ee8b9ee",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/typesafe/config/1.2.1/config-1.2.1.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "d9bf7306f26373fd36412dc34fc226dc11a2319f37118d6c05198236525e59d9",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "c160fbd78f51a0c2375a794e435ce2112524a6871f64d0331895e9e26ee8b9ee",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/typesafe/config/1.2.1/config-1.2.1.jar"
                    ],
                    "name": "com_typesafe_config_1_2_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'com_typesafe_config_jar_sources_1_2_1' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:298:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "com_typesafe_config_jar_sources_1_2_1",
            "sha256": "78a8a2728fd5236b24a9bed7c253729887848ff5d3af5f9ef02e85be5fc43bba",
            "urls": [
                "https://repo.maven.apache.org/maven2/com/typesafe/config/1.2.1/config-1.2.1-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "59f325d5826622201e44e88641aa827eea0f12f077c4899fea6a049d3ab69fea",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "78a8a2728fd5236b24a9bed7c253729887848ff5d3af5f9ef02e85be5fc43bba",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/com/typesafe/config/1.2.1/config-1.2.1-sources.jar"
                    ],
                    "name": "com_typesafe_config_jar_sources_1_2_1"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'net_jcip_jcip_annotations_1_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:303:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "net_jcip_jcip_annotations_1_0",
            "sha256": "be5805392060c71474bf6c9a67a099471274d30b83eef84bfc4e0889a4f1dcc0",
            "urls": [
                "https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "199be8dc5cd5499baaa23bc404202bedae324bc25b03222cad2f6f5efc3e9aa2",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "be5805392060c71474bf6c9a67a099471274d30b83eef84bfc4e0889a4f1dcc0",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0.jar"
                    ],
                    "name": "net_jcip_jcip_annotations_1_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'net_jcip_jcip_annotations_jar_sources_1_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:308:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "net_jcip_jcip_annotations_jar_sources_1_0",
            "sha256": "e3ad6ae439e3cf8a25372de838efaa1a95f8ef9b5053d5d94fafe89c8c09814e",
            "urls": [
                "https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "799f18d946110d59644b7b77b65200134d84abae4bc4df49092aace147fb4c17",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "e3ad6ae439e3cf8a25372de838efaa1a95f8ef9b5053d5d94fafe89c8c09814e",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/net/jcip/jcip-annotations/1.0/jcip-annotations-1.0-sources.jar"
                    ],
                    "name": "net_jcip_jcip_annotations_jar_sources_1_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'net_sf_jopt_simple_jopt_simple_5_0_4' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:313:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "net_sf_jopt_simple_jopt_simple_5_0_4",
            "sha256": "df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28",
            "urls": [
                "https://repo.maven.apache.org/maven2/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8c1424dcc93d40e908cb4fb3e8a92c89acabced041ed999745ddae05a5b075ec",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar"
                    ],
                    "name": "net_sf_jopt_simple_jopt_simple_5_0_4"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'net_sf_jopt_simple_jopt_simple_jar_sources_5_0_4' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:318:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "net_sf_jopt_simple_jopt_simple_jar_sources_5_0_4",
            "sha256": "06b283801a5a94ef697b7f2c79a048c4e2f848b3daddda61cab74d882bdd97a5",
            "urls": [
                "https://repo.maven.apache.org/maven2/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8c1fa0ca16c9a8109a8b9dfa59761d264e1b207b475da449f3c794f313e4f2ed",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "06b283801a5a94ef697b7f2c79a048c4e2f848b3daddda61cab74d882bdd97a5",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4-sources.jar"
                    ],
                    "name": "net_sf_jopt_simple_jopt_simple_jar_sources_5_0_4"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_checkerframework_checker_compat_qual_2_0_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:323:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_checkerframework_checker_compat_qual_2_0_0",
            "sha256": "a40b2ce6d8551e5b90b1bf637064303f32944d61b52ab2014e38699df573941b",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.0.0/checker-compat-qual-2.0.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "6183f4e5d5e8b83586c2b2e9c78e50f19d72bd90059d12b3bf2d7bdda467119b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a40b2ce6d8551e5b90b1bf637064303f32944d61b52ab2014e38699df573941b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.0.0/checker-compat-qual-2.0.0.jar"
                    ],
                    "name": "org_checkerframework_checker_compat_qual_2_0_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_checkerframework_checker_compat_qual_jar_sources_2_0_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:328:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_checkerframework_checker_compat_qual_jar_sources_2_0_0",
            "sha256": "8e287b29415fac2c0b9eb04f30224d9d2ad33c23b7a7ce8d23d1f197f0eb5074",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.0.0/checker-compat-qual-2.0.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "f751bff698e8a305f8d1519dcf390a363553112b7a90e568b1cdd94ce3b76674",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "8e287b29415fac2c0b9eb04f30224d9d2ad33c23b7a7ce8d23d1f197f0eb5074",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.0.0/checker-compat-qual-2.0.0-sources.jar"
                    ],
                    "name": "org_checkerframework_checker_compat_qual_jar_sources_2_0_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_codehaus_mojo_animal_sniffer_annotations_1_14' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:333:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_codehaus_mojo_animal_sniffer_annotations_1_14",
            "sha256": "2068320bd6bad744c3673ab048f67e30bef8f518996fa380033556600669905d",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "57ee2d5421cc9bbef7da1268403a266dc7729ef14d977c4746ba4c5e364da0dd",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2068320bd6bad744c3673ab048f67e30bef8f518996fa380033556600669905d",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14.jar"
                    ],
                    "name": "org_codehaus_mojo_animal_sniffer_annotations_1_14"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_codehaus_mojo_animal_sniffer_annotations_jar_sources_1_14' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:338:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_codehaus_mojo_animal_sniffer_annotations_jar_sources_1_14",
            "sha256": "d821ae1f706db2c1b9c88d4b7b0746b01039dac63762745ef3fe5579967dd16b",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ac7a3469f03e2381eca6ee3b836e565c4d9d6456580f7f580b102a2c600b616a",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d821ae1f706db2c1b9c88d4b7b0746b01039dac63762745ef3fe5579967dd16b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.14/animal-sniffer-annotations-1.14-sources.jar"
                    ],
                    "name": "org_codehaus_mojo_animal_sniffer_annotations_jar_sources_1_14"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_fusesource_hawtjni_hawtjni_runtime_1_11' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:343:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_fusesource_hawtjni_hawtjni_runtime_1_11",
            "sha256": "cd702bfb80bc859ff9f89bfbcc5f3709dfbb2817160f1254c5f486e1e582af3b",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/fusesource/hawtjni/hawtjni-runtime/1.11/hawtjni-runtime-1.11.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "c623a788f1599526391850f5c333d1bc8baac8750376f95c5e5c835a8bd7567e",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "cd702bfb80bc859ff9f89bfbcc5f3709dfbb2817160f1254c5f486e1e582af3b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/fusesource/hawtjni/hawtjni-runtime/1.11/hawtjni-runtime-1.11.jar"
                    ],
                    "name": "org_fusesource_hawtjni_hawtjni_runtime_1_11"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_fusesource_hawtjni_hawtjni_runtime_jar_sources_1_11' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:348:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_fusesource_hawtjni_hawtjni_runtime_jar_sources_1_11",
            "sha256": "2d9b0be42c6a5cb82e6d3fe412210e38b1e52c8a3cecb8f4d0640b5e6ec8486d",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/fusesource/hawtjni/hawtjni-runtime/1.11/hawtjni-runtime-1.11-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "61f9e061432216cb040662746a706585d1c03cc66feedc062d88509b79bf017a",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2d9b0be42c6a5cb82e6d3fe412210e38b1e52c8a3cecb8f4d0640b5e6ec8486d",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/fusesource/hawtjni/hawtjni-runtime/1.11/hawtjni-runtime-1.11-sources.jar"
                    ],
                    "name": "org_fusesource_hawtjni_hawtjni_runtime_jar_sources_1_11"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_fusesource_jansi_jansi_native_1_5' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:353:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_fusesource_jansi_jansi_native_1_5",
            "sha256": "068c02045c1ee9d8eb86a45a18d677d736b2fa7fbf6061413cc6abf839a4e651",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "bfba347f5f50125b3b45cd4b3b062bd90657da592aa63405e7a21baaf2d5d76e",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "068c02045c1ee9d8eb86a45a18d677d736b2fa7fbf6061413cc6abf839a4e651",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5.jar"
                    ],
                    "name": "org_fusesource_jansi_jansi_native_1_5"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_fusesource_jansi_jansi_native_jar_sources_1_5' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:358:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_fusesource_jansi_jansi_native_jar_sources_1_5",
            "sha256": "d9aaeafcbbd0eb14da32596466968459f826f43cdb3af592816086d1d12baf28",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8d6d6a0aac72a3302f660e1bdcb6daa396214e70981bffdb0a4f7017b37929ff",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d9aaeafcbbd0eb14da32596466968459f826f43cdb3af592816086d1d12baf28",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5-sources.jar"
                    ],
                    "name": "org_fusesource_jansi_jansi_native_jar_sources_1_5"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_fusesource_jansi_jansi_native_jar_windows32_1_5' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:363:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_fusesource_jansi_jansi_native_jar_windows32_1_5",
            "sha256": "4b36697f65369a5a05680d31d0fcd90d77c541b81c0fdef9e3eee5743c5df528",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5-windows32.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "58855776a5045f44e1a3f17fc725af0128199ae3bf95cee1b9d14e30f1966940",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "4b36697f65369a5a05680d31d0fcd90d77c541b81c0fdef9e3eee5743c5df528",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5-windows32.jar"
                    ],
                    "name": "org_fusesource_jansi_jansi_native_jar_windows32_1_5"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_fusesource_jansi_jansi_native_jar_windows64_1_5' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:368:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_fusesource_jansi_jansi_native_jar_windows64_1_5",
            "sha256": "cac96b26e85836334fc523df00b80197c4ba2e1f71337793ccbb6a587afa88f6",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5-windows64.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ea512a454c89b8523579e054932dc4bc76ceb018b2604574cbd605bb0e7d2e28",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "cac96b26e85836334fc523df00b80197c4ba2e1f71337793ccbb6a587afa88f6",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/fusesource/jansi/jansi-native/1.5/jansi-native-1.5-windows64.jar"
                    ],
                    "name": "org_fusesource_jansi_jansi_native_jar_windows64_1_5"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_hamcrest_java_hamcrest_2_0_0_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:373:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_hamcrest_java_hamcrest_2_0_0_0",
            "sha256": "09bc7044d57a497846e2480250e7a72ff3ae58efefc8c3a9ceecd0f4e092851c",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/hamcrest/java-hamcrest/2.0.0.0/java-hamcrest-2.0.0.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "e9f7275e332eb6bb7f6f4281d8fd6f5d500a038eaed18404f023effe91dcec2d",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "09bc7044d57a497846e2480250e7a72ff3ae58efefc8c3a9ceecd0f4e092851c",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/hamcrest/java-hamcrest/2.0.0.0/java-hamcrest-2.0.0.0.jar"
                    ],
                    "name": "org_hamcrest_java_hamcrest_2_0_0_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_hamcrest_java_hamcrest_jar_sources_2_0_0_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:378:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_hamcrest_java_hamcrest_jar_sources_2_0_0_0",
            "sha256": "2ad13be4d6d61cd4cc2bdafb434b7214d1f489b1cc9426335dbfc55329eca675",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/hamcrest/java-hamcrest/2.0.0.0/java-hamcrest-2.0.0.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "1ada9fbbdbb539fc1798358fd07bb577c6457de4f68a804e057cc57ded72d55c",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2ad13be4d6d61cd4cc2bdafb434b7214d1f489b1cc9426335dbfc55329eca675",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/hamcrest/java-hamcrest/2.0.0.0/java-hamcrest-2.0.0.0-sources.jar"
                    ],
                    "name": "org_hamcrest_java_hamcrest_jar_sources_2_0_0_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_modules_scala_xml_2_12_1_0_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:383:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_modules_scala_xml_2_12_1_0_6",
            "sha256": "7cc3b6ceb56e879cb977e8e043f4bfe2e062f78795efd7efa09f85003cb3230a",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "1e915f3e6e2b55aabdfe4dca792f00d55ca9fe3b9c49099efb2cf31d7f2c1eba",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "7cc3b6ceb56e879cb977e8e043f4bfe2e062f78795efd7efa09f85003cb3230a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6.jar"
                    ],
                    "name": "org_scala_lang_modules_scala_xml_2_12_1_0_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_modules_scala_xml_2_12_jar_sources_1_0_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:388:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_modules_scala_xml_2_12_jar_sources_1_0_6",
            "sha256": "a7e8aac79394df396afda98b35537791809d815ce15ab2224f7d31e50c753922",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "afc7b4ba953bbe7fb40ed2c72c1172e658af35763f65338d644f65dd792b87c0",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a7e8aac79394df396afda98b35537791809d815ce15ab2224f7d31e50c753922",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6-sources.jar"
                    ],
                    "name": "org_scala_lang_modules_scala_xml_2_12_jar_sources_1_0_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_scala_compiler_2_12_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:393:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_scala_compiler_2_12_6",
            "sha256": "3023b07cc02f2b0217b2c04f8e636b396130b3a8544a8dfad498a19c3e57a863",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/scala-compiler/2.12.6/scala-compiler-2.12.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "f2c9ce0fa006fc575d605b447fedff687df7a3a3abe5986664c5bd5acbdb7f29",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "3023b07cc02f2b0217b2c04f8e636b396130b3a8544a8dfad498a19c3e57a863",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/scala-compiler/2.12.6/scala-compiler-2.12.6.jar"
                    ],
                    "name": "org_scala_lang_scala_compiler_2_12_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_scala_compiler_jar_sources_2_12_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:398:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_scala_compiler_jar_sources_2_12_6",
            "sha256": "d3e9d7cc7b50c89676481959cebbf231275863c9f74102de28250dc92ffd4a6f",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/scala-compiler/2.12.6/scala-compiler-2.12.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ef6ec9864af11ca8920898f90d07affd81fe99e7978af48a2db7f1462e469050",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d3e9d7cc7b50c89676481959cebbf231275863c9f74102de28250dc92ffd4a6f",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/scala-compiler/2.12.6/scala-compiler-2.12.6-sources.jar"
                    ],
                    "name": "org_scala_lang_scala_compiler_jar_sources_2_12_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_scala_library_2_12_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:403:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_scala_library_2_12_6",
            "sha256": "f81d7144f0ce1b8123335b72ba39003c4be2870767aca15dd0888ba3dab65e98",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.6/scala-library-2.12.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "847bdb42008f6412eaff63cb8a3c8e5c538233cc9da9864f81060dd6cdf633f1",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "f81d7144f0ce1b8123335b72ba39003c4be2870767aca15dd0888ba3dab65e98",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.6/scala-library-2.12.6.jar"
                    ],
                    "name": "org_scala_lang_scala_library_2_12_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_scala_library_jar_sources_2_12_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:408:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_scala_library_jar_sources_2_12_6",
            "sha256": "e1b905fd404095bcff7e26e750c396c7b4b193044f60555147142d24427aeaf6",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.6/scala-library-2.12.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "d842d0f4517c5efbf528b77c2c790fa239cc98af2c6caa910a8fd28ffc812173",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "e1b905fd404095bcff7e26e750c396c7b4b193044f60555147142d24427aeaf6",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.6/scala-library-2.12.6-sources.jar"
                    ],
                    "name": "org_scala_lang_scala_library_jar_sources_2_12_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_scala_reflect_2_12_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:413:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_scala_reflect_2_12_6",
            "sha256": "ffa70d522fc9f9deec14358aa674e6dd75c9dfa39d4668ef15bb52f002ce99fa",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.12.6/scala-reflect-2.12.6.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "aa28d377d60a38d4b12d8deff4f4995a76a914dba289f201ce32bbdd5a1e0972",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "ffa70d522fc9f9deec14358aa674e6dd75c9dfa39d4668ef15bb52f002ce99fa",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.12.6/scala-reflect-2.12.6.jar"
                    ],
                    "name": "org_scala_lang_scala_reflect_2_12_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scala_lang_scala_reflect_jar_sources_2_12_6' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:418:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scala_lang_scala_reflect_jar_sources_2_12_6",
            "sha256": "f30b396d82485470a6f9b1aef955cb70426f8c0cd72b00c37cb68b363f4939de",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.12.6/scala-reflect-2.12.6-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "bed33d6dc32b59ace1ab949aa34b5027980a5fe87691ece1ea084fa126412c88",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "f30b396d82485470a6f9b1aef955cb70426f8c0cd72b00c37cb68b363f4939de",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.12.6/scala-reflect-2.12.6-sources.jar"
                    ],
                    "name": "org_scala_lang_scala_reflect_jar_sources_2_12_6"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_common_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:423:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_common_2_12_1_7_0",
            "sha256": "87445943f1dff51a063b95660ed0bf5b3f2d28a9260aa7c38cfec7d1b684e826",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/common_2.12/1.7.0/common_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8137196ac40ec5c64337da299f96785fec54dd670ba9e8d984907fd06db4241b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "87445943f1dff51a063b95660ed0bf5b3f2d28a9260aa7c38cfec7d1b684e826",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/common_2.12/1.7.0/common_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_common_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_common_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:428:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_common_2_12_jar_sources_1_7_0",
            "sha256": "c8137b4a06ad56c736a00b605447dd19849b84185f93f824d7ee8d729a44b193",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/common_2.12/1.7.0/common_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "307611b86edd06e6668258ebc48399d91ff1ef60a082577e870bcf97ee6c764d",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "c8137b4a06ad56c736a00b605447dd19849b84185f93f824d7ee8d729a44b193",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/common_2.12/1.7.0/common_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_common_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_dialects_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:433:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_dialects_2_12_1_7_0",
            "sha256": "14cb63ebdae50463ef00dd4c3c07dfcb1b5aa7a30b3fc744046010a568f023e8",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/dialects_2.12/1.7.0/dialects_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "668f71a94175edbb2617c9c0a56174142442faafce3766f0fb0e221de8d56e2b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "14cb63ebdae50463ef00dd4c3c07dfcb1b5aa7a30b3fc744046010a568f023e8",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/dialects_2.12/1.7.0/dialects_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_dialects_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_dialects_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:438:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_dialects_2_12_jar_sources_1_7_0",
            "sha256": "405bede88f1ab3bc57d2740508e5a1975d0d578959919a21f37c38c185219a13",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/dialects_2.12/1.7.0/dialects_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8b14d492fb5651f9d9152e930ac7477967c72ba3bc3d695cd5254a5d740b8524",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "405bede88f1ab3bc57d2740508e5a1975d0d578959919a21f37c38c185219a13",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/dialects_2.12/1.7.0/dialects_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_dialects_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_inline_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:443:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_inline_2_12_1_7_0",
            "sha256": "34af09bc3946dc00a276b54f790ffa2ba6ce40fc695dfa3cac74af2ea4416788",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/inline_2.12/1.7.0/inline_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "841c1331d7e01065508801fb2462c2193d3b780b3610c093fbb94fb0092865b2",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "34af09bc3946dc00a276b54f790ffa2ba6ce40fc695dfa3cac74af2ea4416788",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/inline_2.12/1.7.0/inline_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_inline_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_inline_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:448:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_inline_2_12_jar_sources_1_7_0",
            "sha256": "d4b82276c7c2c865bbac98212b872d76865692a08353542a05b6bdfd17dce51b",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/inline_2.12/1.7.0/inline_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "12feeea0f3d2ca2f4b50cf4c19c982f953277bf117d021712a775e35a6f12d48",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d4b82276c7c2c865bbac98212b872d76865692a08353542a05b6bdfd17dce51b",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/inline_2.12/1.7.0/inline_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_inline_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_inputs_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:453:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_inputs_2_12_1_7_0",
            "sha256": "2f8582bba795c8997ea44210fb9c32b97e8e617336f10f01a3f85d206af2efe6",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/inputs_2.12/1.7.0/inputs_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "13e769e6e66d3f03f8c7e32fc3eab21ed36f5582cc39648ce6aa4f3278b53c5e",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "2f8582bba795c8997ea44210fb9c32b97e8e617336f10f01a3f85d206af2efe6",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/inputs_2.12/1.7.0/inputs_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_inputs_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_inputs_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:458:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_inputs_2_12_jar_sources_1_7_0",
            "sha256": "00876d6018a9e6d4ebe04452f8359ccd1404ffae614013b4f91a545a0509f2da",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/inputs_2.12/1.7.0/inputs_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "b13fdbf9fc7eac8a68fe15538db8641b751d880c0591f26f7b7659c9ff29bad7",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "00876d6018a9e6d4ebe04452f8359ccd1404ffae614013b4f91a545a0509f2da",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/inputs_2.12/1.7.0/inputs_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_inputs_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_io_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:463:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_io_2_12_1_7_0",
            "sha256": "7884cf043a6ad61b36352e42a4c6b4c9eace83ebaed54d8072725710009ddc58",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/io_2.12/1.7.0/io_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "77c789e4d038b9490ce9da5c0974e75d00200194b1eb29174c0ab3de52eabbcc",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "7884cf043a6ad61b36352e42a4c6b4c9eace83ebaed54d8072725710009ddc58",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/io_2.12/1.7.0/io_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_io_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_io_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:468:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_io_2_12_jar_sources_1_7_0",
            "sha256": "e503cd739e2f496a499899e43490c5924bb32f64242b281c48f1e563f2c9efcf",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/io_2.12/1.7.0/io_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "2a489e207de5067b6703bc0af4d39832b151441c95ec1b34e6f64981cefab447",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "e503cd739e2f496a499899e43490c5924bb32f64242b281c48f1e563f2c9efcf",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/io_2.12/1.7.0/io_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_io_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_parsers_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:473:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_parsers_2_12_1_7_0",
            "sha256": "fc1625dfe09ec108fda13d39f681a6499876f55f4763ddb124d3275e7084d340",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/parsers_2.12/1.7.0/parsers_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "2e8341242030a3f0cf1554982b89bc1201251c482176c7f1479051fa52fa1062",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "fc1625dfe09ec108fda13d39f681a6499876f55f4763ddb124d3275e7084d340",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/parsers_2.12/1.7.0/parsers_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_parsers_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_parsers_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:478:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_parsers_2_12_jar_sources_1_7_0",
            "sha256": "35513d8a11716937a0e43ab805984491ebef58a873019b451a027c942fa8d720",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/parsers_2.12/1.7.0/parsers_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "8826da2e4446a733c4301252bc3ce1985fb8725d7470bd49d3d8c62d7f4f86d2",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "35513d8a11716937a0e43ab805984491ebef58a873019b451a027c942fa8d720",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/parsers_2.12/1.7.0/parsers_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_parsers_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_quasiquotes_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:483:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_quasiquotes_2_12_1_7_0",
            "sha256": "d3a7144f273dfdeaa21afdfaf437739fd3622855d82d0eead37c3236be25b8fc",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/quasiquotes_2.12/1.7.0/quasiquotes_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "95466762570b978934aac35d7c03eea2f1bfabc8eacbdb95c1f6f98dd881a57d",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "d3a7144f273dfdeaa21afdfaf437739fd3622855d82d0eead37c3236be25b8fc",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/quasiquotes_2.12/1.7.0/quasiquotes_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_quasiquotes_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_quasiquotes_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:488:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_quasiquotes_2_12_jar_sources_1_7_0",
            "sha256": "48f8b9630aafb13e16f67ffc937db012036a334911528b95ebcab59f66e584fa",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/quasiquotes_2.12/1.7.0/quasiquotes_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "1bdf562c17b594b3092ea32eb3fa9e7df394fc82822ea93aad67c409045e38b0",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "48f8b9630aafb13e16f67ffc937db012036a334911528b95ebcab59f66e584fa",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/quasiquotes_2.12/1.7.0/quasiquotes_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_quasiquotes_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_scalameta_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:493:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_scalameta_2_12_1_7_0",
            "sha256": "a981b3a6180912bd33f1ec92bb3a880c452f1eb491f9e456e80d4ac527a7f7c2",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/scalameta_2.12/1.7.0/scalameta_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "049920a5b5ecdca8fbc7e5b4f650aa6d7638baf340155e988e91b2cb9f1e589f",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "a981b3a6180912bd33f1ec92bb3a880c452f1eb491f9e456e80d4ac527a7f7c2",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/scalameta_2.12/1.7.0/scalameta_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_scalameta_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_scalameta_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:498:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_scalameta_2_12_jar_sources_1_7_0",
            "sha256": "6c8205a7f415a28d3cb047dd22a2fcfc037331a9ebd7d44691aac7f3a0d15128",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/scalameta_2.12/1.7.0/scalameta_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "838d4e36291d27858130d29bd098af9a6d184c755113a166561c85ae814832d4",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "6c8205a7f415a28d3cb047dd22a2fcfc037331a9ebd7d44691aac7f3a0d15128",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/scalameta_2.12/1.7.0/scalameta_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_scalameta_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_semantic_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:503:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_semantic_2_12_1_7_0",
            "sha256": "475788dca2cb7f3b53391c65b23885b8bbb8c3c8c932bce178e8e185ba4d012a",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/semantic_2.12/1.7.0/semantic_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "9af552d2d3c6105f6271971760d6d0c8fcc7bc64ac5fef33e5d97f2a4fa6cb64",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "475788dca2cb7f3b53391c65b23885b8bbb8c3c8c932bce178e8e185ba4d012a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/semantic_2.12/1.7.0/semantic_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_semantic_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_semantic_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:508:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_semantic_2_12_jar_sources_1_7_0",
            "sha256": "f8ec633ab3a6bea4dc5075b5fd27eece0f773e33d77b06241fb88ff444f507c2",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/semantic_2.12/1.7.0/semantic_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "21873f6f2a26232195173bce3fa772e578a74e5cc1b54d410654774eb871e821",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "f8ec633ab3a6bea4dc5075b5fd27eece0f773e33d77b06241fb88ff444f507c2",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/semantic_2.12/1.7.0/semantic_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_semantic_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_tokenizers_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:513:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_tokenizers_2_12_1_7_0",
            "sha256": "5057840f62c90eb4cba66b97f6b8815a8f757ba214481668cbc3998b01b0cb7a",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/tokenizers_2.12/1.7.0/tokenizers_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "3ac3a9fc56dd2562646e914c8bcefd9a7928124ef79296a2df2f60a0a4e736e9",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "5057840f62c90eb4cba66b97f6b8815a8f757ba214481668cbc3998b01b0cb7a",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/tokenizers_2.12/1.7.0/tokenizers_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_tokenizers_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_tokenizers_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:518:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_tokenizers_2_12_jar_sources_1_7_0",
            "sha256": "8e051f7627820d3dd39b290209202dac3b558dd0dc6dcd50d936683fc6e05701",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/tokenizers_2.12/1.7.0/tokenizers_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "a84986725e89ef5a120b0a895cf93b25405800d5bad2b85e152906cb6a2f8a5b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "8e051f7627820d3dd39b290209202dac3b558dd0dc6dcd50d936683fc6e05701",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/tokenizers_2.12/1.7.0/tokenizers_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_tokenizers_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_tokens_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:523:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_tokens_2_12_1_7_0",
            "sha256": "8dc25ef61eb7ef76e5ecf25f897e8d835f10d6451c33a0fe3b2fd2b31c7d7bf8",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/tokens_2.12/1.7.0/tokens_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "089b4e940dc144eafc9a54b9fb04b97e9953b16cca985a478c9c40fb70dd5b6f",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "8dc25ef61eb7ef76e5ecf25f897e8d835f10d6451c33a0fe3b2fd2b31c7d7bf8",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/tokens_2.12/1.7.0/tokens_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_tokens_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_tokens_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:528:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_tokens_2_12_jar_sources_1_7_0",
            "sha256": "c7facec3faa933e583bd8db27262ac4b8efaba33795c9b8528f51efa3c37bc1f",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/tokens_2.12/1.7.0/tokens_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "c45ca3294600f57edc1048e5be66d70cbffe7289d7d6e1510d38c4e59ce188fa",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "c7facec3faa933e583bd8db27262ac4b8efaba33795c9b8528f51efa3c37bc1f",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/tokens_2.12/1.7.0/tokens_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_tokens_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_transversers_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:533:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_transversers_2_12_1_7_0",
            "sha256": "b45fe5f0284ec77737778831685f43d5b434121a88c488ff1ec6e82e53eb5536",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/transversers_2.12/1.7.0/transversers_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "a52dfbcf5bc3ac4fe1b561c9bbf65f870d799795e0a5e0925982dd5935aadbc4",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "b45fe5f0284ec77737778831685f43d5b434121a88c488ff1ec6e82e53eb5536",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/transversers_2.12/1.7.0/transversers_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_transversers_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_transversers_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:538:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_transversers_2_12_jar_sources_1_7_0",
            "sha256": "f1b75119ecb65bc29989370b8b82da4945112dfd1c216ead5e4c7253638f8539",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/transversers_2.12/1.7.0/transversers_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "73b9b8db3308a8fb962bf80020fefc98caf78fe48dbf9c3832215ed1f0d2502b",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "f1b75119ecb65bc29989370b8b82da4945112dfd1c216ead5e4c7253638f8539",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/transversers_2.12/1.7.0/transversers_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_transversers_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_trees_2_12_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:543:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_trees_2_12_1_7_0",
            "sha256": "68e115214da0ff306e5bd7e1333680dddb51f72fd5783fe8a686c829208ef84c",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/trees_2.12/1.7.0/trees_2.12-1.7.0.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "03b2aff0672481abc950eb2373081854ba450929f59632b8d95d388c21d26dbd",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "68e115214da0ff306e5bd7e1333680dddb51f72fd5783fe8a686c829208ef84c",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/trees_2.12/1.7.0/trees_2.12-1.7.0.jar"
                    ],
                    "name": "org_scalameta_trees_2_12_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_scalameta_trees_2_12_jar_sources_1_7_0' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:548:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_scalameta_trees_2_12_jar_sources_1_7_0",
            "sha256": "c76f8f57ec044ac22be27dc76063ce836d2358cb011e913b5e1f36efb2bdc792",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/scalameta/trees_2.12/1.7.0/trees_2.12-1.7.0-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "ed01b1f4618e7bd3c246e14bb00f226e70967ca5af1f4c7892e99f257ae19004",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "c76f8f57ec044ac22be27dc76063ce836d2358cb011e913b5e1f36efb2bdc792",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/scalameta/trees_2.12/1.7.0/trees_2.12-1.7.0-sources.jar"
                    ],
                    "name": "org_scalameta_trees_2_12_jar_sources_1_7_0"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_slf4j_slf4j_api_1_7_25' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:553:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_slf4j_slf4j_api_1_7_25",
            "sha256": "18c4a0095d5c1da6b817592e767bb23d29dd2f560ad74df75ff3961dbde25b79",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "cc9da678276135a14c030e65c324a3d71999b8f74ef06435ff949e3aebbb5005",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "18c4a0095d5c1da6b817592e767bb23d29dd2f560ad74df75ff3961dbde25b79",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar"
                    ],
                    "name": "org_slf4j_slf4j_api_1_7_25"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_slf4j_slf4j_api_jar_sources_1_7_25' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:558:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_slf4j_slf4j_api_jar_sources_1_7_25",
            "sha256": "c4bc93180a4f0aceec3b057a2514abe04a79f06c174bbed910a2afb227b79366",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "1b39aa322f5656174b62ba11b6ae0ffefd3c917928072a2d6c002dbcfcd8183c",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "c4bc93180a4f0aceec3b057a2514abe04a79f06c174bbed910a2afb227b79366",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25-sources.jar"
                    ],
                    "name": "org_slf4j_slf4j_api_jar_sources_1_7_25"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_yaml_snakeyaml_1_18' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:563:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_yaml_snakeyaml_1_18",
            "sha256": "81bf4c29d0275dace75fadb5febf5384553422816256023efa83b2b15a9ced60",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/yaml/snakeyaml/1.18/snakeyaml-1.18.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "80a54cdbde16231390004d19a68e125a59acd0e4f9835b5a1505f9350b34fa9a",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "81bf4c29d0275dace75fadb5febf5384553422816256023efa83b2b15a9ced60",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/yaml/snakeyaml/1.18/snakeyaml-1.18.jar"
                    ],
                    "name": "org_yaml_snakeyaml_1_18"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'org_yaml_snakeyaml_jar_sources_1_18' which is a http_file (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:314:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/maven/defs.bzl:568:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:26:1",
        "original_attributes": {
            "name": "org_yaml_snakeyaml_jar_sources_1_18",
            "sha256": "76a7b11358ea5ed67e49de701566a785c25c9ba8b86fca62ce0840838b81f4e7",
            "urls": [
                "https://repo.maven.apache.org/maven2/org/yaml/snakeyaml/1.18/snakeyaml-1.18-sources.jar"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "output_tree_hash": "78c890f43cf622148326bed760a6b3da679eaca3ee9836698895b5aea5e4f7c5",
                "attributes": {
                    "executable": False,
                    "downloaded_file_path": "downloaded",
                    "sha256": "76a7b11358ea5ed67e49de701566a785c25c9ba8b86fca62ce0840838b81f4e7",
                    "urls": [
                        "https://repo.maven.apache.org/maven2/org/yaml/snakeyaml/1.18/snakeyaml-1.18-sources.jar"
                    ],
                    "name": "org_yaml_snakeyaml_jar_sources_1_18"
                }
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/com_google_protobuf/protobuf_java",
            "actual": "@com_google_protobuf//:protobuf_java"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/com_google_protobuf/protobuf_java\", actual = \"@com_google_protobuf//:protobuf_java\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scala/parser_combinators",
            "actual": "@io_bazel_rules_scala_scala_parser_combinators//:io_bazel_rules_scala_scala_parser_combinators"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scala/parser_combinators\", actual = \"@io_bazel_rules_scala_scala_parser_combinators//:io_bazel_rules_scala_scala_parser_combinators\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scala/scala_compiler",
            "actual": "@io_bazel_rules_scala_scala_compiler//:io_bazel_rules_scala_scala_compiler"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scala/scala_compiler\", actual = \"@io_bazel_rules_scala_scala_compiler//:io_bazel_rules_scala_scala_compiler\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scala/scala_library",
            "actual": "@io_bazel_rules_scala_scala_library//:io_bazel_rules_scala_scala_library"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scala/scala_library\", actual = \"@io_bazel_rules_scala_scala_library//:io_bazel_rules_scala_scala_library\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scala/scala_reflect",
            "actual": "@io_bazel_rules_scala_scala_reflect//:io_bazel_rules_scala_scala_reflect"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scala/scala_reflect\", actual = \"@io_bazel_rules_scala_scala_reflect//:io_bazel_rules_scala_scala_reflect\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scala/scala_xml",
            "actual": "@io_bazel_rules_scala_scala_xml//:io_bazel_rules_scala_scala_xml"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scala/scala_xml\", actual = \"@io_bazel_rules_scala_scala_xml//:io_bazel_rules_scala_scala_xml\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scalatest/scalatest",
            "actual": "@io_bazel_rules_scala//scala/scalatest:scalatest"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scalatest/scalatest\", actual = \"@io_bazel_rules_scala//scala/scalatest:scalatest\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "spotify_bazel_tools/dependency/buildtools/buildifier",
            "actual": "@com_github_bazelbuild_buildtools//buildifier:buildifier"
        },
        "native": "bind(name = \"spotify_bazel_tools/dependency/buildtools/buildifier\", actual = \"@com_github_bazelbuild_buildtools//buildifier:buildifier\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "spotify_bazel_tools/dependency/buildtools/buildozer",
            "actual": "@com_github_bazelbuild_buildtools//buildozer:buildozer"
        },
        "native": "bind(name = \"spotify_bazel_tools/dependency/buildtools/buildozer\", actual = \"@com_github_bazelbuild_buildtools//buildozer:buildozer\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "spotify_bazel_tools/dependency/buildtools/unused-deps",
            "actual": "@com_github_bazelbuild_buildtools//unused_deps:unused_deps"
        },
        "native": "bind(name = \"spotify_bazel_tools/dependency/buildtools/unused-deps\", actual = \"@com_github_bazelbuild_buildtools//unused_deps:unused_deps\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'bazel_skylib' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:51:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "bazel_skylib",
            "remote": "https://github.com/bazelbuild/bazel-skylib",
            "commit": "3721d32c14d3639ff94320c780a60a6e658fb033",
            "shallow_since": "1553102012 +0100"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "6e45f0523f92f1b1eb254a535b6ecceac7536969a004cb24f9a131f1d84e8e3e",
                "attributes": {
                    "remote": "https://github.com/bazelbuild/bazel-skylib",
                    "commit": "3721d32c14d3639ff94320c780a60a6e658fb033",
                    "shallow_since": "1553102012 +0100",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "name": "bazel_skylib"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_gogo_protobuf' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:124:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "com_github_gogo_protobuf",
            "remote": "https://github.com/gogo/protobuf",
            "commit": "ba06b47c162d49f2af050fb4c75bcbc86a159d5c",
            "shallow_since": "1550471403 +0200",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_gogo_protobuf-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "e9099ef613c382a77a46cacd6212c63e6287fe312445b05217a2dbbb81efef5b",
                "attributes": {
                    "remote": "https://github.com/gogo/protobuf",
                    "commit": "ba06b47c162d49f2af050fb4c75bcbc86a159d5c",
                    "shallow_since": "1550471403 +0200",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_gogo_protobuf-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_gogo_protobuf"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_golang_protobuf' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:93:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "com_github_golang_protobuf",
            "remote": "https://github.com/golang/protobuf",
            "commit": "b5d812f8a3706043e23a9cd5babf2e5423744d30",
            "shallow_since": "1551367169 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_golang_protobuf-gazelle.patch",
                "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "cc7084252c26b621afc1494a3ec7c9eb24d2d2bb79af518c618bf76827afcf97",
                "attributes": {
                    "remote": "https://github.com/golang/protobuf",
                    "commit": "b5d812f8a3706043e23a9cd5babf2e5423744d30",
                    "shallow_since": "1551367169 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-gazelle.patch",
                        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_golang_protobuf"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_mwitkow_go_proto_validators' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:110:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "com_github_mwitkow_go_proto_validators",
            "remote": "https://github.com/mwitkow/go-proto-validators",
            "commit": "fbdcedf3a5550890154208a722600dd6af252902",
            "shallow_since": "1562622466 +0100",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_mwitkow_go_proto_validators-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "87e467dcc7494c3457ab19d88cebee294bbc812c5121b3711f5b50fb5d44ec0c",
                "attributes": {
                    "remote": "https://github.com/mwitkow/go-proto-validators",
                    "commit": "fbdcedf3a5550890154208a722600dd6af252902",
                    "shallow_since": "1562622466 +0100",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_mwitkow_go_proto_validators-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "com_github_mwitkow_go_proto_validators"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'go_googleapis' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:162:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "go_googleapis",
            "remote": "https://github.com/googleapis/googleapis",
            "commit": "b4c73face84fefb967ef6c72f0eae64faf67895f",
            "shallow_since": "1562194577 -0700",
            "patches": [
                "@io_bazel_rules_go//third_party:go_googleapis-deletebuild.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-directives.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-gazelle.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-fix.patch"
            ],
            "patch_args": [
                "-E",
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "8fd6866cafc7816943f6622d1513f3e157578edb6b290e11d450a581403cb865",
                "attributes": {
                    "remote": "https://github.com/googleapis/googleapis",
                    "commit": "b4c73face84fefb967ef6c72f0eae64faf67895f",
                    "shallow_since": "1562194577 -0700",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:go_googleapis-deletebuild.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-directives.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-gazelle.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-fix.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-E",
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "go_googleapis"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:sdk.bzl%_go_download_sdk",
        "definition_information": "Call stack for the definition of repository 'go_sdk' which is a _go_download_sdk (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/sdk.bzl:80:20):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/sdk.bzl:93:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/sdk.bzl:261:13\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:36:1",
        "original_attributes": {
            "name": "go_sdk",
            "version": "1.12.7"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:sdk.bzl%_go_download_sdk",
                "attributes": {
                    "name": "go_sdk",
                    "version": "1.12.7"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//proto:gogo.bzl%gogo_special_proto",
        "definition_information": "Call stack for the definition of repository 'gogo_special_proto' which is a gogo_special_proto (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/proto/gogo.bzl:34:22):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:136:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "gogo_special_proto"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//proto:gogo.bzl%gogo_special_proto",
                "output_tree_hash": "f352a36f8c81aa0ab46e41070dd0d0e3a7165247b30fcc13e56d6edab7986410",
                "attributes": {
                    "name": "gogo_special_proto"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:compat/compat_repo.bzl%_go_rules_compat",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_go_compat' which is a _go_rules_compat (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/compat/compat_repo.bzl:33:20):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/compat/compat_repo.bzl:55:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:45:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "io_bazel_rules_go_compat",
            "impl": "@io_bazel_rules_go//go/private:compat/v25.bzl"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:compat/compat_repo.bzl%_go_rules_compat",
                "output_tree_hash": "e4cc1f8a56348e70afa41035703ad4cfde6b60392ddfc346193b0ea9ad06ecd1",
                "attributes": {
                    "name": "io_bazel_rules_go_compat",
                    "impl": "@io_bazel_rules_go//go/private:compat/v25.bzl"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:nogo.bzl%go_register_nogo",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_nogo' which is a go_register_nogo (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/nogo.bzl:33:20):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:181:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "io_bazel_rules_nogo",
            "nogo": "@io_bazel_rules_go//:default_nogo"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:nogo.bzl%go_register_nogo",
                "output_tree_hash": "3934c1fa667e35c1bdda975bca7059807ede9fc322e1daa480ab77939375185b",
                "attributes": {
                    "name": "io_bazel_rules_nogo",
                    "nogo": "@io_bazel_rules_go//:default_nogo"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_google_genproto' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:145:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "org_golang_google_genproto",
            "remote": "https://github.com/google/go-genproto",
            "commit": "3bdd9d9f5532d75d09efb230bd767d265245cfe5",
            "shallow_since": "1562600220 -0600",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "9178d7c9aa84239d3dca6c5c2af7b760fac1cc1a06f5f4bd62ff4533cf688f7f",
                "attributes": {
                    "remote": "https://github.com/google/go-genproto",
                    "commit": "3bdd9d9f5532d75d09efb230bd767d265245cfe5",
                    "shallow_since": "1562600220 -0600",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_google_genproto"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_tools' which is a git_repository (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/git.bzl:252:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:189:9\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_go/go/private/repositories.bzl:61:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:34:1",
        "original_attributes": {
            "name": "org_golang_x_tools",
            "remote": "https://go.googlesource.com/tools",
            "commit": "c8855242db9c1762032abe33c2dff50de3ec9d05",
            "shallow_since": "1562618051 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_tools-gazelle.patch",
                "@io_bazel_rules_go//third_party:org_golang_x_tools-extras.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "output_tree_hash": "cabb8aa04f0c2215df4c09f62496e2b2311f7fc0cc4065b93113374f407fe9f7",
                "attributes": {
                    "remote": "https://go.googlesource.com/tools",
                    "commit": "c8855242db9c1762032abe33c2dff50de3ec9d05",
                    "shallow_since": "1562618051 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_tools-gazelle.patch",
                        "@io_bazel_rules_go//third_party:org_golang_x_tools-extras.patch"
                    ],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "name": "org_golang_x_tools"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_protobuf' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:519:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "com_google_protobuf",
            "url": "https://github.com/protocolbuffers/protobuf/archive/b4f193788c9f0f05d7e0879ea96cd738630e5d51.tar.gz",
            "sha256": "d82eb0141ad18e98de47ed7ed415daabead6d5d1bef1b8cccb6aa4d108a9008f",
            "strip_prefix": "protobuf-b4f193788c9f0f05d7e0879ea96cd738630e5d51"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "f9b503d3dee552f6c84c12024d43a3a1767fb6d862c349af70b94aabe59d3901",
                "attributes": {
                    "url": "https://github.com/protocolbuffers/protobuf/archive/b4f193788c9f0f05d7e0879ea96cd738630e5d51.tar.gz",
                    "urls": [],
                    "sha256": "d82eb0141ad18e98de47ed7ed415daabead6d5d1bef1b8cccb6aa4d108a9008f",
                    "canonical_id": "",
                    "strip_prefix": "protobuf-b4f193788c9f0f05d7e0879ea96cd738630e5d51",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_protobuf"
                }
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/commons_io/commons_io",
            "actual": "@scalac_rules_commons_io//jar:jar"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/commons_io/commons_io\", actual = \"@scalac_rules_commons_io//jar:jar\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "io_bazel_rules_scala/dependency/scala/guava",
            "actual": "@io_bazel_rules_scala_guava//:io_bazel_rules_scala_guava"
        },
        "native": "bind(name = \"io_bazel_rules_scala/dependency/scala/guava\", actual = \"@io_bazel_rules_scala_guava//:io_bazel_rules_scala_guava\")"
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_guava' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:484:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_guava",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/com/google/guava/guava/21.0/guava-21.0.jar"
            ],
            "jar_sha256": "972139718abc8a4893fa78cba8cf7b2c903f35c97aaf44fa3031b0669948b480",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "6ef56ae5f61de38b3a5a4b3f374ccb15ae0e03f5a47b700921a4ec6f6bacd34f",
                "attributes": {
                    "name": "io_bazel_rules_scala_guava",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/com/google/guava/guava/21.0/guava-21.0.jar"
                    ],
                    "jar_sha256": "972139718abc8a4893fa78cba8cf7b2c903f35c97aaf44fa3031b0669948b480",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_org_jacoco_org_jacoco_core' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:492:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_org_jacoco_org_jacoco_core",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/jacoco/org.jacoco.core/0.7.5.201505241946/org.jacoco.core-0.7.5.201505241946.jar"
            ],
            "jar_sha256": "ecf1ad8192926438d0748bfcc3f09bebc7387d2a4184bb3a171a26084677e808",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "51c0164c0da3ddec395cb3bf3634a081151c1ff73aa15bf01fe02a2eb74ef99b",
                "attributes": {
                    "name": "io_bazel_rules_scala_org_jacoco_org_jacoco_core",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/jacoco/org.jacoco.core/0.7.5.201505241946/org.jacoco.core-0.7.5.201505241946.jar"
                    ],
                    "jar_sha256": "ecf1ad8192926438d0748bfcc3f09bebc7387d2a4184bb3a171a26084677e808",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_org_ow2_asm_asm_debug_all' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:500:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_org_ow2_asm_asm_debug_all",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/ow2/asm/asm-debug-all/5.0.1/asm-debug-all-5.0.1.jar"
            ],
            "jar_sha256": "4734de5b515a454b0096db6971fb068e5f70e6f10bbee2b3bd2fdfe5d978ed57",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "c4a7b13ad7cd5741978a6b5dd4868700c64f360028edc62c764f9f3c07405bd8",
                "attributes": {
                    "name": "io_bazel_rules_scala_org_ow2_asm_asm_debug_all",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/ow2/asm/asm-debug-all/5.0.1/asm-debug-all-5.0.1.jar"
                    ],
                    "jar_sha256": "4734de5b515a454b0096db6971fb068e5f70e6f10bbee2b3bd2fdfe5d978ed57",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scala_compiler' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_cross_version.bzl:67:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:423:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scala_compiler",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scala-lang/scala-compiler/2.11.12/scala-compiler-2.11.12.jar"
            ],
            "jar_sha256": "3e892546b72ab547cb77de4d840bcfd05c853e73390fed7370a8f19acb0735a0",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "fe0887f46d07c56984d3b47398c98bf28d05ee8e247405dec79fc3aa85d047fe",
                "attributes": {
                    "name": "io_bazel_rules_scala_scala_compiler",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scala-lang/scala-compiler/2.11.12/scala-compiler-2.11.12.jar"
                    ],
                    "jar_sha256": "3e892546b72ab547cb77de4d840bcfd05c853e73390fed7370a8f19acb0735a0",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scala_library' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_cross_version.bzl:60:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:423:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scala_library",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scala-lang/scala-library/2.11.12/scala-library-2.11.12.jar"
            ],
            "jar_sha256": "0b3d6fd42958ee98715ba2ec5fe221f4ca1e694d7c981b0ae0cd68e97baf6dce",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "fa8c24b2cc3d8a5280ae2b4976858f1f7d243c9a61f9dde137422455d9b6c239",
                "attributes": {
                    "name": "io_bazel_rules_scala_scala_library",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scala-lang/scala-library/2.11.12/scala-library-2.11.12.jar"
                    ],
                    "jar_sha256": "0b3d6fd42958ee98715ba2ec5fe221f4ca1e694d7c981b0ae0cd68e97baf6dce",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scala_parser_combinators' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:463:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scala_parser_combinators",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scala-lang/modules/scala-parser-combinators_2.11/1.0.4/scala-parser-combinators_2.11-1.0.4.jar"
            ],
            "jar_sha256": "0dfaafce29a9a245b0a9180ec2c1073d2bd8f0330f03a9f1f6a74d1bc83f62d6",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "c74ea016eedac1132111c2a4080de6bcd0f343ee9cf89a723dcfb258a2317389",
                "attributes": {
                    "name": "io_bazel_rules_scala_scala_parser_combinators",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scala-lang/modules/scala-parser-combinators_2.11/1.0.4/scala-parser-combinators_2.11-1.0.4.jar"
                    ],
                    "jar_sha256": "0dfaafce29a9a245b0a9180ec2c1073d2bd8f0330f03a9f1f6a74d1bc83f62d6",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scala_reflect' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_cross_version.bzl:74:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:423:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scala_reflect",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scala-lang/scala-reflect/2.11.12/scala-reflect-2.11.12.jar"
            ],
            "jar_sha256": "6ba385b450a6311a15c918cf8688b9af9327c6104f0ecbd35933cfcd3095fe04",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "83c9e5028d365e9d3e5e05faf09473dcc5400e1cc0316a097b94f074378b5063",
                "attributes": {
                    "name": "io_bazel_rules_scala_scala_reflect",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scala-lang/scala-reflect/2.11.12/scala-reflect-2.11.12.jar"
                    ],
                    "jar_sha256": "6ba385b450a6311a15c918cf8688b9af9327c6104f0ecbd35933cfcd3095fe04",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scala_xml' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:452:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scala_xml",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scala-lang/modules/scala-xml_2.11/1.0.5/scala-xml_2.11-1.0.5.jar"
            ],
            "jar_sha256": "767e11f33eddcd506980f0ff213f9d553a6a21802e3be1330345f62f7ee3d50f",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "1aaa0b9e33e3d1aa0ae89ac6f88c14d81ebcb3e9697201148f25ab38ad491232",
                "attributes": {
                    "name": "io_bazel_rules_scala_scala_xml",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scala-lang/modules/scala-xml_2.11/1.0.5/scala-xml_2.11-1.0.5.jar"
                    ],
                    "jar_sha256": "767e11f33eddcd506980f0ff213f9d553a6a21802e3be1330345f62f7ee3d50f",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scalactic' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:441:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scalactic",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scalactic/scalactic_2.11/3.0.5/scalactic_2.11-3.0.5.jar"
            ],
            "jar_sha256": "84723064f5716f38990fe6e65468aa39700c725484efceef015771d267341cf2",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "795b1fe3defae0b424e2c0d534b1d4edfde1de8e573694919488eef1a108e524",
                "attributes": {
                    "name": "io_bazel_rules_scala_scalactic",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scalactic/scalactic_2.11/3.0.5/scalactic_2.11-3.0.5.jar"
                    ],
                    "jar_sha256": "84723064f5716f38990fe6e65468aa39700c725484efceef015771d267341cf2",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_scala_scalatest' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:431:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "io_bazel_rules_scala_scalatest",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/org/scalatest/scalatest_2.11/3.0.5/scalatest_2.11-3.0.5.jar"
            ],
            "jar_sha256": "2aafeb41257912cbba95f9d747df9ecdc7ff43f039d35014b4c2a8eb7ed9ba2f",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "d7d4d87a179cdede9880851973ba3d66afebda3f50462ca20aab48b6e322178e",
                "attributes": {
                    "name": "io_bazel_rules_scala_scalatest",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/org/scalatest/scalatest_2.11/3.0.5/scalatest_2.11-3.0.5.jar"
                    ],
                    "jar_sha256": "2aafeb41257912cbba95f9d747df9ecdc7ff43f039d35014b4c2a8eb7ed9ba2f",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'java_stub_template' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:511:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "java_stub_template",
            "urls": [
                "https://github.com/bazelbuild/rules_scala/archive/8b8271e3ee5709e1340b19790d0b396a0ff3dd0f.tar.gz"
            ],
            "sha256": "1859a37dccaee8c56b98869bf1f22f6f5b909606aff74ddcfd59e9757a038dd5",
            "strip_prefix": "rules_scala-8b8271e3ee5709e1340b19790d0b396a0ff3dd0f/java_stub_template"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "cb992e4ddab9d55c326f99a9a6badb69da3846822eb5298eb624ab4ff7bf2c2e",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/rules_scala/archive/8b8271e3ee5709e1340b19790d0b396a0ff3dd0f.tar.gz"
                    ],
                    "sha256": "1859a37dccaee8c56b98869bf1f22f6f5b909606aff74ddcfd59e9757a038dd5",
                    "canonical_id": "",
                    "strip_prefix": "rules_scala-8b8271e3ee5709e1340b19790d0b396a0ff3dd0f/java_stub_template",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "java_stub_template"
                }
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
        "definition_information": "Call stack for the definition of repository 'scalac_rules_commons_io' which is a jvm_import_external (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:207:23):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:276:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala_maven_import_external.bzl:240:5\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:476:5\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "scalac_rules_commons_io",
            "rule_name": "scala_import",
            "licenses": [
                "notice"
            ],
            "jar_urls": [
                "http://central.maven.org/maven2/commons-io/commons-io/2.6/commons-io-2.6.jar"
            ],
            "jar_sha256": "f877d304660ac2a142f3865badfc971dec7ed73c747c7f8d5d2f5139ca736513",
            "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl%jvm_import_external",
                "output_tree_hash": "60ad6b5a347252411679bdf62f0770c883dfd18c28ae382dae131fd9c15b6b37",
                "attributes": {
                    "name": "scalac_rules_commons_io",
                    "rule_name": "scala_import",
                    "licenses": [
                        "notice"
                    ],
                    "jar_urls": [
                        "http://central.maven.org/maven2/commons-io/commons-io/2.6/commons-io-2.6.jar"
                    ],
                    "jar_sha256": "f877d304660ac2a142f3865badfc971dec7ed73c747c7f8d5d2f5139ca736513",
                    "rule_load": "load(\"@io_bazel_rules_scala//scala:scala_import.bzl\", \"scala_import\")"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'zlib' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/io_bazel_rules_scala/scala/scala.bzl:528:9\n - /home/dflemstr/src/github.com/spotify/bazel-tools/WORKSPACE:40:1",
        "original_attributes": {
            "name": "zlib",
            "urls": [
                "https://zlib.net/zlib-1.2.11.tar.gz"
            ],
            "sha256": "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
            "strip_prefix": "zlib-1.2.11",
            "build_file": "@com_google_protobuf//:third_party/zlib.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "26d6ac7f650142cd1585cf4f0cd8ab8fdbc85373dec0f263e6f2d8e27ed5d64a",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://zlib.net/zlib-1.2.11.tar.gz"
                    ],
                    "sha256": "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
                    "canonical_id": "",
                    "strip_prefix": "zlib-1.2.11",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@com_google_protobuf//:third_party/zlib.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "zlib"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_coverage_tools' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:5:1",
        "original_attributes": {
            "name": "remote_coverage_tools",
            "urls": [
                "https://mirror.bazel.build/bazel_coverage_output_generator/releases/coverage_output_generator-v1.0.zip"
            ],
            "sha256": "cc470e529fafb6165b5be3929ff2d99b38429b386ac100878687416603a67889"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "8a2bd5f6d7b633d736d771e1c21a3223559d9adaa35207d76b1d2b53032bdc57",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_coverage_output_generator/releases/coverage_output_generator-v1.0.zip"
                    ],
                    "sha256": "cc470e529fafb6165b5be3929ff2d99b38429b386ac100878687416603a67889",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_coverage_tools"
                }
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "bootclasspath",
            "actual": "@local_jdk//:bootclasspath"
        },
        "native": "bind(name = \"bootclasspath\", actual = \"@local_jdk//:bootclasspath\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extclasspath",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extclasspath\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extdir",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extdir\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jar",
            "actual": "@local_jdk//:jar"
        },
        "native": "bind(name = \"jar\", actual = \"@local_jdk//:jar\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "java",
            "actual": "@local_jdk//:java"
        },
        "native": "bind(name = \"java\", actual = \"@local_jdk//:java\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "javac",
            "actual": "@local_jdk//:javac"
        },
        "native": "bind(name = \"javac\", actual = \"@local_jdk//:javac\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk-default",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk-default\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_header",
            "actual": "@local_jdk//:jni_header"
        },
        "native": "bind(name = \"jni_header\", actual = \"@local_jdk//:jni_header\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-darwin",
            "actual": "@local_jdk//:jni_md_header-darwin"
        },
        "native": "bind(name = \"jni_md_header-darwin\", actual = \"@local_jdk//:jni_md_header-darwin\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-freebsd",
            "actual": "@local_jdk//:jni_md_header-freebsd"
        },
        "native": "bind(name = \"jni_md_header-freebsd\", actual = \"@local_jdk//:jni_md_header-freebsd\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-linux",
            "actual": "@local_jdk//:jni_md_header-linux"
        },
        "native": "bind(name = \"jni_md_header-linux\", actual = \"@local_jdk//:jni_md_header-linux\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre-default",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre-default\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "new_local_repository",
        "original_attributes": {
            "name": "local_jdk",
            "path": "/usr/lib/jvm/java-8-jdk",
            "build_file": "/home/dflemstr/.cache/bazel/_bazel_dflemstr/install/99a7a698f576d17c0b88a878bda06cdf/_embedded_binaries/jdk.BUILD"
        },
        "native": "new_local_repository(name = \"local_jdk\", path = \"/usr/lib/jvm/java-8-jdk\", build_file = __embedded_dir__ + \"/\" + \"jdk.BUILD\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_darwin' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:245:1",
        "original_attributes": {
            "name": "remote_java_tools_darwin",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_darwin-v2.0.zip"
            ],
            "sha256": "0ceb0c9ff91256fe33508306bc9cd9e188dcca38df78e70839d426bdaef67a38"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "6e401be95c764ebb19c9cc15e21631ba4596132ad3f9a171a851078bef86423e",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_darwin-v2.0.zip"
                    ],
                    "sha256": "0ceb0c9ff91256fe33508306bc9cd9e188dcca38df78e70839d426bdaef67a38",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_darwin"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_linux' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:229:1",
        "original_attributes": {
            "name": "remote_java_tools_linux",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_linux-v2.0.zip"
            ],
            "sha256": "074d624fb34441df369afdfd454e75dba821d5d54932fcfee5ba598d17dc1b99"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "5a0bf7da6f4240b1590103a667ee58be4ab3b2514a2784f5d96cc61fdfe37f1c",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_linux-v2.0.zip"
                    ],
                    "sha256": "074d624fb34441df369afdfd454e75dba821d5d54932fcfee5ba598d17dc1b99",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_windows' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:237:1",
        "original_attributes": {
            "name": "remote_java_tools_windows",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_windows-v2.0.zip"
            ],
            "sha256": "2c3fc0ce7d30d60e26f4b8a36e2eadcf9e6a9d5a51b667d3d13b78db53b24251"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "8d1072bc57b27b6b59bacecce338dc1517aa3b1dcf99a991f233ad1e3a7c6466",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v2.0/java_tools_javac11_windows-v2.0.zip"
                    ],
                    "sha256": "2c3fc0ce7d30d60e26f4b8a36e2eadcf9e6a9d5a51b667d3d13b78db53b24251",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_windows"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_linux' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:155:1",
        "original_attributes": {
            "name": "remotejdk10_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "68635cf0b631d86eb488acc5e8d11f9b8e52cb48c0a920a62164957390c95b1b",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_linux_aarch64' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:187:1",
        "original_attributes": {
            "name": "remotejdk10_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
            ],
            "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
            "strip_prefix": "jdk10-server-release-1804",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "eed5745d9b44725b2386e9f4d4bf23bbd96776a686f5a4f9f0283dba700c122b",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
                    ],
                    "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
                    "canonical_id": "",
                    "strip_prefix": "jdk10-server-release-1804",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux_aarch64"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_macos' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:165:1",
        "original_attributes": {
            "name": "remotejdk10_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "c8e0533fa1387f0a000b13417a55228d1afb212141c8aa88ac2e9399c8c0af95",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_win' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:175:1",
        "original_attributes": {
            "name": "remotejdk10_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
            ],
            "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "39a4c3f755408b8d841ec5e26fff79d967cb346711931c80aca34ffb401268cd",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
                    ],
                    "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_linux' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:199:1",
        "original_attributes": {
            "name": "remotejdk11_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-linux_x64.tar.gz"
            ],
            "sha256": "232b1c3511f0d26e92582b7c3cc363be7ac633e371854ca2f2e9f2b50eb72a75",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-linux_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "a69b51daa38e36a8df50b38c457bed7a891e265be553e9addd9cf68ba20e3199",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-linux_x64.tar.gz"
                    ],
                    "sha256": "232b1c3511f0d26e92582b7c3cc363be7ac633e371854ca2f2e9f2b50eb72a75",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-linux_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_macos' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:209:1",
        "original_attributes": {
            "name": "remotejdk11_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-macosx_x64.tar.gz"
            ],
            "sha256": "1edf366ee821e5db8e348152fcb337b28dfd6bf0f97943c270dcc6747cedb6cb",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-macosx_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "dbdcb740e805dc00c08b52d33c5365f4619c662f22b3407f3ac46fb92b23564c",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-macosx_x64.tar.gz"
                    ],
                    "sha256": "1edf366ee821e5db8e348152fcb337b28dfd6bf0f97943c270dcc6747cedb6cb",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-macosx_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_win' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:219:1",
        "original_attributes": {
            "name": "remotejdk11_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-win_x64.zip"
            ],
            "sha256": "8e1e2b8347de6746f3fd1538840dd643201533ab113abc4ed93678e342d28aa3",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-win_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "0e0f669f2d143b2b16a406e7c7de8557048103b144a5def76c54f7e368403fe5",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-win_x64.zip"
                    ],
                    "sha256": "8e1e2b8347de6746f3fd1538840dd643201533ab113abc4ed93678e342d28aa3",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-win_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_linux' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:111:1",
        "original_attributes": {
            "name": "remotejdk_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "84ecda96d9caa3283708639e4c694503a1008384bef3490f1183a7859531b032",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_linux"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_linux_aarch64' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:143:1",
        "original_attributes": {
            "name": "remotejdk_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
            ],
            "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
            "strip_prefix": "jdk9-server-release-1708",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "9619a6b9fa84ee04ccd6f2200eea2d846ca7d050cef351fa7db9d84d3f500bb4",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
                    ],
                    "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
                    "canonical_id": "",
                    "strip_prefix": "jdk9-server-release-1708",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_linux_aarch64"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_macos' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:121:1",
        "original_attributes": {
            "name": "remotejdk_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "863f85a41b9a42a743939c525ea03c9480977d0f0f6d964267f3e1e8f60c6248",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_macos"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_win' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:131:1",
        "original_attributes": {
            "name": "remotejdk_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
            ],
            "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "914538371f6117c0a1acd5057afcdc22e33dfacedaaca6e4f0d15d7d61e20499",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
                    ],
                    "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_win"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'android_tools' which is a http_archive (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/build_defs/repo/http.bzl:237:16):\n - /DEFAULT.WORKSPACE.SUFFIX:267:1",
        "original_attributes": {
            "name": "android_tools",
            "url": "https://mirror.bazel.build/bazel_android_tools/android_tools_pkg-0.4.tar.gz",
            "sha256": "331e7706f2bcae8a68057d8ddd3e3f1574bca26c67c65802fc4a8ac6164fa912"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "output_tree_hash": "53d05d7480b16311a481ad07a6c8114b8c8a6646016a1217e10fb3ca279bfb92",
                "attributes": {
                    "url": "https://mirror.bazel.build/bazel_android_tools/android_tools_pkg-0.4.tar.gz",
                    "urls": [],
                    "sha256": "331e7706f2bcae8a68057d8ddd3e3f1574bca26c67c65802fc4a8ac6164fa912",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "patch",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "android_tools"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
        "definition_information": "Call stack for the definition of repository 'local_config_cc' which is a cc_autoconf (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/cpp/cc_configure.bzl:121:15):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/cpp/cc_configure.bzl:162:5\n - /DEFAULT.WORKSPACE.SUFFIX:293:1",
        "original_attributes": {
            "name": "local_config_cc"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
                "output_tree_hash": "0c57972e5b92e883c9a718362865e3286144ea7696ef440e9cfc85890a1f1a2f",
                "attributes": {
                    "name": "local_config_cc"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf_toolchains",
        "definition_information": "Call stack for the definition of repository 'local_config_cc_toolchains' which is a cc_autoconf_toolchains (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/cpp/cc_configure.bzl:79:26):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/cpp/cc_configure.bzl:161:5\n - /DEFAULT.WORKSPACE.SUFFIX:293:1",
        "original_attributes": {
            "name": "local_config_cc_toolchains"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf_toolchains",
                "output_tree_hash": "b49ed07ecd31233cf835f6d7c50619050854cc5f1a25d775c6cd85412f90876a",
                "attributes": {
                    "name": "local_config_cc_toolchains"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
        "definition_information": "Call stack for the definition of repository 'local_config_xcode' which is a xcode_autoconf (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/osx/xcode_configure.bzl:242:18):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/osx/xcode_configure.bzl:252:5\n - /DEFAULT.WORKSPACE.SUFFIX:296:1",
        "original_attributes": {
            "name": "local_config_xcode",
            "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
                "output_tree_hash": "ec026961157bb71cf68d1b568815ad68147ed16f318161bc0da40f6f3d7d79fd",
                "attributes": {
                    "name": "local_config_xcode",
                    "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
                }
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
        "definition_information": "Call stack for the definition of repository 'local_config_sh' which is a sh_config (rule definition at /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/sh/sh_configure.bzl:72:13):\n - /home/dflemstr/.cache/bazel/_bazel_dflemstr/54f16cd4becd383432475ebe0420229d/external/bazel_tools/tools/sh/sh_configure.bzl:83:5\n - /DEFAULT.WORKSPACE.SUFFIX:299:1",
        "original_attributes": {
            "name": "local_config_sh"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
                "output_tree_hash": "7bf5ba89669bcdf4526f821bc9f1f9f49409ae9c61c4e8f21c9f17e06c475127",
                "attributes": {
                    "name": "local_config_sh"
                }
            }
        ]
    },
    {
        "original_rule_class": "register_toolchains",
        "original_attributes": {
            "name": "//external/toolchains",
            "*args": [
                "@go_sdk//:go_android_386",
                "@go_sdk//:go_android_386_cgo",
                "@go_sdk//:go_android_amd64",
                "@go_sdk//:go_android_amd64_cgo",
                "@go_sdk//:go_android_arm",
                "@go_sdk//:go_android_arm_cgo",
                "@go_sdk//:go_android_arm64",
                "@go_sdk//:go_android_arm64_cgo",
                "@go_sdk//:go_darwin_386",
                "@go_sdk//:go_darwin_amd64",
                "@go_sdk//:go_darwin_amd64_cgo",
                "@go_sdk//:go_darwin_arm",
                "@go_sdk//:go_darwin_arm_cgo",
                "@go_sdk//:go_darwin_arm64",
                "@go_sdk//:go_darwin_arm64_cgo",
                "@go_sdk//:go_dragonfly_amd64",
                "@go_sdk//:go_dragonfly_amd64_cgo",
                "@go_sdk//:go_freebsd_386",
                "@go_sdk//:go_freebsd_386_cgo",
                "@go_sdk//:go_freebsd_amd64",
                "@go_sdk//:go_freebsd_amd64_cgo",
                "@go_sdk//:go_freebsd_arm",
                "@go_sdk//:go_freebsd_arm_cgo",
                "@go_sdk//:go_linux_386",
                "@go_sdk//:go_linux_386_cgo",
                "@go_sdk//:go_linux_amd64",
                "@go_sdk//:go_linux_amd64_cgo",
                "@go_sdk//:go_linux_arm",
                "@go_sdk//:go_linux_arm_cgo",
                "@go_sdk//:go_linux_arm64",
                "@go_sdk//:go_linux_arm64_cgo",
                "@go_sdk//:go_linux_mips",
                "@go_sdk//:go_linux_mips_cgo",
                "@go_sdk//:go_linux_mips64",
                "@go_sdk//:go_linux_mips64_cgo",
                "@go_sdk//:go_linux_mips64le",
                "@go_sdk//:go_linux_mips64le_cgo",
                "@go_sdk//:go_linux_mipsle",
                "@go_sdk//:go_linux_mipsle_cgo",
                "@go_sdk//:go_linux_ppc64",
                "@go_sdk//:go_linux_ppc64le",
                "@go_sdk//:go_linux_ppc64le_cgo",
                "@go_sdk//:go_linux_s390x",
                "@go_sdk//:go_linux_s390x_cgo",
                "@go_sdk//:go_nacl_386",
                "@go_sdk//:go_nacl_amd64p32",
                "@go_sdk//:go_nacl_arm",
                "@go_sdk//:go_netbsd_386",
                "@go_sdk//:go_netbsd_386_cgo",
                "@go_sdk//:go_netbsd_amd64",
                "@go_sdk//:go_netbsd_amd64_cgo",
                "@go_sdk//:go_netbsd_arm",
                "@go_sdk//:go_netbsd_arm_cgo",
                "@go_sdk//:go_openbsd_386",
                "@go_sdk//:go_openbsd_386_cgo",
                "@go_sdk//:go_openbsd_amd64",
                "@go_sdk//:go_openbsd_amd64_cgo",
                "@go_sdk//:go_openbsd_arm",
                "@go_sdk//:go_openbsd_arm_cgo",
                "@go_sdk//:go_plan9_386",
                "@go_sdk//:go_plan9_amd64",
                "@go_sdk//:go_plan9_arm",
                "@go_sdk//:go_solaris_amd64",
                "@go_sdk//:go_solaris_amd64_cgo",
                "@go_sdk//:go_windows_386",
                "@go_sdk//:go_windows_386_cgo",
                "@go_sdk//:go_windows_amd64",
                "@go_sdk//:go_windows_amd64_cgo",
                "@go_sdk//:go_js_wasm",
                "@go_sdk//:go_ios_arm",
                "@go_sdk//:go_ios_arm_cgo",
                "@go_sdk//:go_ios_arm64",
                "@go_sdk//:go_ios_arm64_cgo",
                "@go_sdk//:go_ios_386",
                "@go_sdk//:go_ios_386_cgo",
                "@go_sdk//:go_ios_amd64",
                "@go_sdk//:go_ios_amd64_cgo",
                "@io_bazel_rules_scala//scala:default_toolchain",
                "@bazel_tools//tools/jdk:all",
                "@bazel_tools//tools/python:autodetecting_toolchain",
                "@local_config_cc_toolchains//:all",
                "@local_config_sh//:local_sh_toolchain"
            ]
        },
        "native": "register_toolchains(\"@go_sdk//:go_android_386\", \"@go_sdk//:go_android_386_cgo\", \"@go_sdk//:go_android_amd64\", \"@go_sdk//:go_android_amd64_cgo\", \"@go_sdk//:go_android_arm\", \"@go_sdk//:go_android_arm_cgo\", \"@go_sdk//:go_android_arm64\", \"@go_sdk//:go_android_arm64_cgo\", \"@go_sdk//:go_darwin_386\", \"@go_sdk//:go_darwin_amd64\", \"@go_sdk//:go_darwin_amd64_cgo\", \"@go_sdk//:go_darwin_arm\", \"@go_sdk//:go_darwin_arm_cgo\", \"@go_sdk//:go_darwin_arm64\", \"@go_sdk//:go_darwin_arm64_cgo\", \"@go_sdk//:go_dragonfly_amd64\", \"@go_sdk//:go_dragonfly_amd64_cgo\", \"@go_sdk//:go_freebsd_386\", \"@go_sdk//:go_freebsd_386_cgo\", \"@go_sdk//:go_freebsd_amd64\", \"@go_sdk//:go_freebsd_amd64_cgo\", \"@go_sdk//:go_freebsd_arm\", \"@go_sdk//:go_freebsd_arm_cgo\", \"@go_sdk//:go_linux_386\", \"@go_sdk//:go_linux_386_cgo\", \"@go_sdk//:go_linux_amd64\", \"@go_sdk//:go_linux_amd64_cgo\", \"@go_sdk//:go_linux_arm\", \"@go_sdk//:go_linux_arm_cgo\", \"@go_sdk//:go_linux_arm64\", \"@go_sdk//:go_linux_arm64_cgo\", \"@go_sdk//:go_linux_mips\", \"@go_sdk//:go_linux_mips_cgo\", \"@go_sdk//:go_linux_mips64\", \"@go_sdk//:go_linux_mips64_cgo\", \"@go_sdk//:go_linux_mips64le\", \"@go_sdk//:go_linux_mips64le_cgo\", \"@go_sdk//:go_linux_mipsle\", \"@go_sdk//:go_linux_mipsle_cgo\", \"@go_sdk//:go_linux_ppc64\", \"@go_sdk//:go_linux_ppc64le\", \"@go_sdk//:go_linux_ppc64le_cgo\", \"@go_sdk//:go_linux_s390x\", \"@go_sdk//:go_linux_s390x_cgo\", \"@go_sdk//:go_nacl_386\", \"@go_sdk//:go_nacl_amd64p32\", \"@go_sdk//:go_nacl_arm\", \"@go_sdk//:go_netbsd_386\", \"@go_sdk//:go_netbsd_386_cgo\", \"@go_sdk//:go_netbsd_amd64\", \"@go_sdk//:go_netbsd_amd64_cgo\", \"@go_sdk//:go_netbsd_arm\", \"@go_sdk//:go_netbsd_arm_cgo\", \"@go_sdk//:go_openbsd_386\", \"@go_sdk//:go_openbsd_386_cgo\", \"@go_sdk//:go_openbsd_amd64\", \"@go_sdk//:go_openbsd_amd64_cgo\", \"@go_sdk//:go_openbsd_arm\", \"@go_sdk//:go_openbsd_arm_cgo\", \"@go_sdk//:go_plan9_386\", \"@go_sdk//:go_plan9_amd64\", \"@go_sdk//:go_plan9_arm\", \"@go_sdk//:go_solaris_amd64\", \"@go_sdk//:go_solaris_amd64_cgo\", \"@go_sdk//:go_windows_386\", \"@go_sdk//:go_windows_386_cgo\", \"@go_sdk//:go_windows_amd64\", \"@go_sdk//:go_windows_amd64_cgo\", \"@go_sdk//:go_js_wasm\", \"@go_sdk//:go_ios_arm\", \"@go_sdk//:go_ios_arm_cgo\", \"@go_sdk//:go_ios_arm64\", \"@go_sdk//:go_ios_arm64_cgo\", \"@go_sdk//:go_ios_386\", \"@go_sdk//:go_ios_386_cgo\", \"@go_sdk//:go_ios_amd64\", \"@go_sdk//:go_ios_amd64_cgo\", \"@io_bazel_rules_scala//scala:default_toolchain\", \"@bazel_tools//tools/jdk:all\", \"@bazel_tools//tools/python:autodetecting_toolchain\", \"@local_config_cc_toolchains//:all\", \"@local_config_sh//:local_sh_toolchain\")"
    }
]