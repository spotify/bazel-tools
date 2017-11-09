# sync-deps

A tool for synchronizing third-party dependencies.  Synchronizes the `3rdparty/dependencies.yaml`
file with the dependency tree, making dependencies available for use and resolving version
conflicts.

Some useful commands:

  - Add a dependency in `3rdparty/dependencies.yaml`, then run:

        sync-deps/run

    This will resolve the dependency graph of the repository, and commit the result to:

        3rdparty/jvm
        3rdparty/dependencies.lock
        3rdparty/workspace.bzl
