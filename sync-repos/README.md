# sync-repos

A tool for synchronizing third-party repositories.  Synchronizes the `3rdparty/repositories.yaml`
file with this repository, merging Git histories.

Some useful commands:

  - Add a repository in `3rdparty/repositories.yaml`, make a commit (ensure your checkout is now
    clean), then run:

        sync-repos/run

    This will pull new changes from all third-party repositories and merge their history into this
    repository.
