# depfuzz

A tool for removing unused dependencies with a fuzzing strategy.  Analyses `javac` output and tries
to remove unused dependencies by removing one at a time and seeing if all tests pass.

Some useful commands:

  - Remove all unused dependencies in the repo:

        depfuzz/run //...
