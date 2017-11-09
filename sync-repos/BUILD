java_binary(
    name = "sync-repos",
    srcs = glob(["src/main/java/**/*.java"]),
    main_class = "com.spotify.syncrepos.Main",
    runtime_deps = [
        "//3rdparty/jvm/ch/qos/logback:logback-classic",
        "//sync-repos/src/main/java/com/spotify/syncrepos",
    ],
)
