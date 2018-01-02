load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

scala_library(
    name = "format",
    srcs = glob(["*.scala"]),
    visibility = ["//format:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/geirsson:metaconfig-core_2_11",
        "//3rdparty/jvm/com/geirsson:scalafmt-core_2_11",
    ],
)
