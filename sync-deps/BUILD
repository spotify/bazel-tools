java_binary(
    name = "sync-deps",
    srcs = glob(["src/main/java/**/*.java"]),
    args = [
        "--buildifier",
        "$(location //external:spotify_bazel_tools/dependency/buildtools/buildifier)",
    ],
    data = [
        "//external:spotify_bazel_tools/dependency/buildtools/buildifier",
    ],
    main_class = "com.spotify.syncdeps.Main",
    runtime_deps = [
        "//3rdparty/jvm/ch/qos/logback:logback-classic",
        "//sync-deps/src/main/java/com/spotify/syncdeps",
    ],
)
