def declare_maven(name, artifact, bind, actual, sha1=None):
  if sha1 == None:
    print("%s does not have a sha1 checksum; integrity cannot be verified" % (artifact,))
    native.maven_jar(name=name, artifact=artifact)
  else:
    native.maven_jar(name=name, artifact=artifact, sha1=sha1)

  native.bind(name=bind, actual=actual)
