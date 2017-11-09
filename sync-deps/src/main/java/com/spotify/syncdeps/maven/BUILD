java_library(
    name = "maven",
    srcs = glob(["*.java"]),
    visibility = ["//sync-deps:__subpackages__"],
    deps = [
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/jvm/org/apache/ivy",
        "//3rdparty/jvm/org/slf4j:slf4j-api",
        "//3rdparty/tools:auto-value",
        "//sync-deps/src/main/java/com/spotify/syncdeps/config",
        "//sync-deps/src/main/java/com/spotify/syncdeps/model",
    ],
)
