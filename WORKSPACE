workspace(name = "spotify_bazel_tools")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "53059e0cda4517afe5a3907f77d1a379577773f2b1659fed8dc668b3f110a7d3",
    strip_prefix = "rules_go-0dc1f9e0741d766780e931d49790ddb501bb34c9",  # branch master
    urls = ["https://github.com/bazelbuild/rules_go/archive/0dc1f9e0741d766780e931d49790ddb501bb34c9.zip"],
)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

load("//:tools.bzl", "bazel_tools_repositories")

bazel_tools_repositories()
