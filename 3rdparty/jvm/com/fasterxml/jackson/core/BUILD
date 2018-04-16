java_import(
    name = "jackson-annotations",
    jars = ["//external:file/com/fasterxml/jackson/core/jackson-annotations"],
    visibility = ["//visibility:public"],
)

java_import(
    name = "jackson-core",
    jars = ["//external:file/com/fasterxml/jackson/core/jackson-core"],
    visibility = ["//visibility:public"],
)

java_import(
    name = "jackson-databind",
    jars = ["//external:file/com/fasterxml/jackson/core/jackson-databind"],
    visibility = ["//visibility:public"],
    runtime_deps = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-annotations",
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson-core",
    ],
)
