java_library(
    name = "model",
    srcs = glob(["*.java"]),
    visibility = ["//sync-deps:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-annotations",
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-core",
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-databind",
        "//3rdparty/jvm/com/fasterxml/jackson/dataformat:jackson-dataformat-yaml",
        "//3rdparty/jvm/com/fasterxml/jackson/datatype:jackson-datatype-guava",
        "//3rdparty/jvm/com/google/auto/value:auto-value",
        "//3rdparty/jvm/com/google/code/findbugs:jsr305",
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/tools:auto-value",
        "//sync-deps/src/main/java/com/spotify/syncdeps/util",
    ],
)
