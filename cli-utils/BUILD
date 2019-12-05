load("//tools:java.bzl", "JAVACOPTS")
load("@rules_java//java:defs.bzl", "java_library")

java_library(
    name = "cli-utils",
    javacopts = JAVACOPTS,
    visibility = ["//:__subpackages__"],
    exports = [
        "//cli-utils/src/main/java/com/spotify/bazeltools/cliutils",
    ],
)
