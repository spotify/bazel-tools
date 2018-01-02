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

def declare_maven(name, artifact, bind, actual, sha1=None):
  if sha1 == None:
    print("%s does not have a sha1 checksum; integrity cannot be verified" % (artifact,))
    native.maven_jar(name=name, artifact=artifact)
  else:
    native.maven_jar(name=name, artifact=artifact, sha1=sha1)

  native.bind(name=bind, actual=actual)
