java_import(
    name = "scala-compiler",
    jars = ["//external:file/org/scala-lang/scala-compiler"],
    visibility = ["//visibility:public"],
    runtime_deps = [
        "//3rdparty/jvm/org/scala-lang:scala-library",
        "//3rdparty/jvm/org/scala-lang:scala-reflect",
        "//external:jar/org/scala-lang/modules/scala-parser-combinators_2.11",
        "//external:jar/org/scala-lang/modules/scala-xml_2.11",
    ],
)

java_import(
    name = "scala-library",
    jars = ["//external:file/org/scala-lang/scala-library"],
    visibility = ["//visibility:public"],
)

java_import(
    name = "scala-reflect",
    jars = ["//external:file/org/scala-lang/scala-reflect"],
    visibility = ["//visibility:public"],
    runtime_deps = [
        "//3rdparty/jvm/org/scala-lang:scala-library",
    ],
)
