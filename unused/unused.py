#!/usr/bin/env python
from __future__ import print_function

import argparse
import re
import subprocess

import sys


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--workspace', '-w')
    parser.add_argument('--regex', '-r')

    args = parser.parse_args()

    workspace = args.workspace

    if args.regex is not None:
        regex = re.compile(args.regex)

        def filter_fn(line):
            return regex.findall(line)
    else:
        def filter_fn(_line):
            return True

    bazel_cmd = ['bazel', 'query', '--output=label', 'kind("source file", deps(//...))']
    bazel_paths = lines_set(workspace, bazel_cmd, filter_fn)

    git_cmd = ['git', 'ls-files']
    git_paths = lines_set(workspace, git_cmd, filter_fn)

    for path in sorted(git_paths - bazel_paths):
        print(path)


def lines_set(cwd, cmd, filter_fn):
    print('Running command', cmd, '...', file=sys.stderr)
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, cwd=cwd)
    try:
        result = set()

        for line in iter(lambda: process.stdout.readline().decode("utf-8"), ''):
            if filter_fn(line):
                result.add(line.rstrip('\n'))

        process.wait()
    finally:
        process.kill()
    return result


if __name__ == '__main__':
    main()
