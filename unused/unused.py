#!/usr/bin/env python

# Copyright 2016-2017 Spotify AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
from __future__ import print_function

import argparse
import re
import subprocess

import sys


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--workspace', '-w')
    parser.add_argument('--regex', '-r')
    parser.add_argument('positional_regex', nargs='?')

    args = parser.parse_args()

    workspace = args.workspace
    regex = args.regex or args.positional_regex

    if regex is not None:
        print('Using regex', regex, 'for filtering', file=sys.stderr)
        compiled_regex = re.compile(regex)

        def filter_fn(line):
            return compiled_regex.findall(line)
    else:
        def filter_fn(_line):
            return True

    def is_local(label):
        return label.startswith('//')

    def to_path(local_label):
        return local_label[2:].replace(':', '/')  # //x/y:foo.cc -> x/y/foo.cc

    bazel_cmd = ['bazel', 'query', '--output=label', 'kind("source file", deps(//...))']
    bazel_paths = set(map(to_path, filter(is_local, lines_set(workspace, bazel_cmd, filter_fn))))

    git_cmd = ['git', 'ls-files']
    git_paths = lines_set(workspace, git_cmd, filter_fn)

    for path in sorted(git_paths - bazel_paths):
        print(path)


def lines_set(cwd, cmd, filter_fn):
    print('Running command', cmd, '...', file=sys.stderr)
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, cwd=cwd)
    try:
        result = set()

        for line in iter(lambda: process.stdout.readline().decode('utf-8'), ''):
            if filter_fn(line):
                result.add(line.rstrip('\n'))

        process.wait()
    finally:
        process.kill()
    return result


if __name__ == '__main__':
    main()
