java_binary(
    name = "format",
    args = [
        "--buildifier",
        "$(location //external:tool/buildifier)",
    ],
    data = [
        "//external:tool/buildifier",
    ],
    main_class = "com.spotify.format.Main",
    runtime_deps = [
        "//format/src/main/java/com/spotify/format",
    ],
)
