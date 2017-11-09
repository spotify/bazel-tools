java_library(
    name = "jackson-annotations",
    visibility = ["//visibility:public"],
    exports = ["//external:jar/com/fasterxml/jackson/core/jackson-annotations"],
)

java_library(
    name = "jackson-core",
    visibility = ["//visibility:public"],
    exports = ["//external:jar/com/fasterxml/jackson/core/jackson-core"],
)

java_library(
    name = "jackson-databind",
    visibility = ["//visibility:public"],
    exports = ["//external:jar/com/fasterxml/jackson/core/jackson-databind"],
    runtime_deps = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-annotations",
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-core",
    ],
)
