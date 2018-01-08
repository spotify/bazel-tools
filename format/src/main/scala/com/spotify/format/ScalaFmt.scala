/*
 * Copyright 2016-2017 Spotify AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.spotify.format

import org.scalafmt.Scalafmt

/**
  * Why this silly wrapper you might wonder?
  *
  * Well, calling Scala code from Java sucks when the Scala code has default values as you need to
  * provide them in Java. Even worse, it sucks even more when the parameters are Scala primitives.
  * To top it off, the default option method name is 'default' which is a reserved keyword in Java..
  */
object ScalaFmt {

  def format(source: String): String = {
    Scalafmt.format(source).get
  }
}
