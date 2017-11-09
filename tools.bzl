load("//3rdparty:workspace.bzl", "maven_dependencies")
load("//3rdparty:load.bzl", "declare_maven")

def bazel_tools_repositories():
    native.http_archive(
        name = "io_bazel",
        sha256 = "8c33ee6b198359265186f95fbd6aa7ad4e84c3a1fd9b14d22efc3ffb22699f63",
        strip_prefix = "bazel-0.7.0",  # Should match current Bazel version
        urls = [
            "http://bazel-mirror.storage.googleapis.com/github.com/bazelbuild/bazel/archive/0.7.0.tar.gz",
            "https://github.com/bazelbuild/bazel/archive/0.7.0.tar.gz",
        ],
    )

    native.http_archive(
        name = "spotify_bazel_buildtools",
        sha256 = "99bf4e70a8bf2992accb2e38103da03e121d207f205f9ecdbf7ccf91b0179d4d",
        strip_prefix = "buildtools-121de4df0295e9b6412d871499943762ff70a736",  # branch superhack
        urls = ["https://github.com/dflemstr/buildtools/archive/121de4df0295e9b6412d871499943762ff70a736.zip"],
    )

    maven_dependencies(declare_maven)

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/buildifier",
        actual = "@spotify_bazel_buildtools//buildifier",
    )

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/buildozer",
        actual = "@spotify_bazel_buildtools//buildozer",
    )

    native.bind(
        name = "spotify_bazel_tools/dependency/buildtools/unused-deps",
        actual = "@spotify_bazel_buildtools//unused_deps",
    )
