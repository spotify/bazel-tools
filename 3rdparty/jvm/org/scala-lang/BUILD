java_library(
    name = "scala-compiler",
    visibility = ["//visibility:public"],
    exports = ["//external:jar/org/scala-lang/scala-compiler"],
    runtime_deps = [
        "//3rdparty/jvm/org/scala-lang:scala-library",
        "//3rdparty/jvm/org/scala-lang:scala-reflect",
        "//external:jar/org/scala-lang/modules/scala-parser-combinators_2.11",
        "//external:jar/org/scala-lang/modules/scala-xml_2.11",
    ],
)

java_library(
    name = "scala-library",
    visibility = ["//visibility:public"],
    exports = ["//external:jar/org/scala-lang/scala-library"],
)

java_library(
    name = "scala-reflect",
    visibility = ["//visibility:public"],
    exports = ["//external:jar/org/scala-lang/scala-reflect"],
    runtime_deps = [
        "//3rdparty/jvm/org/scala-lang:scala-library",
    ],
)
