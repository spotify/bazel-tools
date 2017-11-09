java_library(
    name = "syncrepos",
    srcs = glob(["*.java"]),
    data = [
        "//3rdparty:dependencies.yaml",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//3rdparty/jvm/com/google/guava",
        "//3rdparty/jvm/org/slf4j:slf4j-api",
        "//sync-repos/src/main/java/com/spotify/syncrepos/cli",
        "//sync-repos/src/main/java/com/spotify/syncrepos/config",
    ],
)
