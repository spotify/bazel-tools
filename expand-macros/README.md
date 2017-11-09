# expand-macros

A tool for expanding Bazel macros into the rules that they generate.

Some useful commands:

  - Expand `java_tests` into individual `java_test` rules:

        expand-macros/run java_tests
        
    After doing this, it is recommended to run `buildifier` to make the `BUILD` files readable
    again, and `depfuzz` to remove dependencies that might be unused for each expanded rule.
