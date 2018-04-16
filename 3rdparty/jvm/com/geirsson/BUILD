load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")

scala_import(
    name = "metaconfig-core",
    jars = ["//external:file/com/geirsson/metaconfig-core_2.11"],
    visibility = ["//visibility:public"],
    runtime_deps = [
        "//3rdparty/jvm/org/scala-lang:scala-library",
        "//external:jar/com/lihaoyi/sourcecode_2.11",
        "//external:jar/org/scalameta/common_2.11",
        "//external:jar/org/scalameta/inputs_2.11",
        "//external:jar/org/scalameta/io_2.11",
    ],
)

scala_import(
    name = "metaconfig-typesafe-config",
    jars = ["//external:file/com/geirsson/metaconfig-typesafe-config_2.11"],
    visibility = ["//visibility:public"],
    runtime_deps = [
        "//3rdparty/jvm/com/geirsson:metaconfig-core",
        "//3rdparty/jvm/org/scala-lang:scala-library",
        "//external:jar/com/typesafe/config",
    ],
)

scala_import(
    name = "scalafmt-core",
    jars = ["//external:file/com/geirsson/scalafmt-core_2.11"],
    visibility = ["//visibility:public"],
    runtime_deps = [
        "//3rdparty/jvm/com/geirsson:metaconfig-core",
        "//3rdparty/jvm/com/geirsson:metaconfig-typesafe-config",
        "//3rdparty/jvm/com/google/protobuf:protobuf-java",
        "//3rdparty/jvm/org/scala-lang:scala-library",
        "//external:jar/com/lihaoyi/fastparse-utils_2.11",
        "//external:jar/com/lihaoyi/fastparse_2.11",
        "//external:jar/com/lihaoyi/scalaparse_2.11",
        "//external:jar/com/lihaoyi/sourcecode_2.11",
        "//external:jar/com/trueaccord/lenses/lenses_2.11",
        "//external:jar/com/trueaccord/scalapb/scalapb-runtime_2.11",
        "//external:jar/com/typesafe/config",
        "//external:jar/org/scalameta/common_2.11",
        "//external:jar/org/scalameta/dialects_2.11",
        "//external:jar/org/scalameta/inline_2.11",
        "//external:jar/org/scalameta/inputs_2.11",
        "//external:jar/org/scalameta/io_2.11",
        "//external:jar/org/scalameta/parsers_2.11",
        "//external:jar/org/scalameta/quasiquotes_2.11",
        "//external:jar/org/scalameta/scalameta_2.11",
        "//external:jar/org/scalameta/semantic_2.11",
        "//external:jar/org/scalameta/tokenizers_2.11",
        "//external:jar/org/scalameta/tokens_2.11",
        "//external:jar/org/scalameta/transversers_2.11",
        "//external:jar/org/scalameta/trees_2.11",
    ],
)
