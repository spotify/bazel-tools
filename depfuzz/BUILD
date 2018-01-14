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
licenses(["notice"])

java_binary(
    name = "depfuzz",
    args = [
        "--buildozer",
        "$(location //external:spotify_bazel_tools/dependency/buildtools/buildozer)",
        "--unused-deps",
        "$(location //external:spotify_bazel_tools/dependency/buildtools/unused-deps)",
    ],
    data = [
        "//external:spotify_bazel_tools/dependency/buildtools/buildozer",
        "//external:spotify_bazel_tools/dependency/buildtools/unused-deps",
    ],
    main_class = "com.spotify.depfuzz.Main",
    runtime_deps = [
        "//depfuzz/src/java/com/spotify/depfuzz",
    ],
)
