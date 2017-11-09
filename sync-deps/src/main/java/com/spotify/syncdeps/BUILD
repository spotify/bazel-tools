java_library(
    name = "syncdeps",
    srcs = glob(["*.java"]),
    data = [
        "//3rdparty:dependencies.yaml",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/jvm/org/slf4j:slf4j-api",
        "//sync-deps/src/main/java/com/spotify/syncdeps/cli",
        "//sync-deps/src/main/java/com/spotify/syncdeps/config",
        "//sync-deps/src/main/java/com/spotify/syncdeps/maven",
        "//sync-deps/src/main/java/com/spotify/syncdeps/model",
        "//sync-deps/src/main/java/com/spotify/syncdeps/util",
    ],
)
