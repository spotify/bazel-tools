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
