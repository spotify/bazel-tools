java_binary(
    name = "format",
    args = [
        "--buildifier",
        "$(location //external:spotify_bazel_tools/dependency/buildtools/buildifier)",
    ],
    data = [
        "//external:spotify_bazel_tools/dependency/buildtools/buildifier",
    ],
    main_class = "com.spotify.format.Main",
    runtime_deps = [
        "//format/src/main/java/com/spotify/format",
    ],
)
