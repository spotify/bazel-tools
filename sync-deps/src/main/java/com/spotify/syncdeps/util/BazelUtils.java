package com.spotify.syncdeps.util;

import com.google.common.base.CharMatcher;

public final class BazelUtils {

  private static final CharMatcher PUNCTUATION_REQUIRING_QUOTING = CharMatcher.anyOf("+,=~# ()$");

  private static final CharMatcher PUNCTUATION_NOT_REQUIRING_QUOTING = CharMatcher.anyOf("_@-");

  private static final CharMatcher ALLOWED_CHARACTERS_IN_PACKAGE_NAME =
      CharMatcher.inRange('0', '9')
          .or(CharMatcher.inRange('a', 'z'))
          .or(CharMatcher.inRange('A', 'Z'))
          .or(CharMatcher.anyOf("/-._ $()"))
          .precomputed();

  private static final CharMatcher NOT_ALLOWED_CHARACTERS_IN_PACKAGE_NAME =
      ALLOWED_CHARACTERS_IN_PACKAGE_NAME.negate().precomputed();

  private static final CharMatcher ALWAYS_ALLOWED_WORKSPACE_NAME_CHARACTERS =
      CharMatcher.javaLetterOrDigit().or(CharMatcher.is('_')).precomputed();

  private static final CharMatcher NOT_ALWAYS_ALLOWED_WORKSPACE_NAME_CHARACTERS =
      ALWAYS_ALLOWED_WORKSPACE_NAME_CHARACTERS.negate().precomputed();

  private static final CharMatcher ALWAYS_ALLOWED_TARGET_CHARACTERS =
      CharMatcher.javaLetterOrDigit()
          .or(PUNCTUATION_REQUIRING_QUOTING)
          .or(PUNCTUATION_NOT_REQUIRING_QUOTING)
          .precomputed();

  private static final CharMatcher NOT_ALWAYS_ALLOWED_TARGET_CHARACTERS =
      ALWAYS_ALLOWED_TARGET_CHARACTERS.negate().precomputed();

  private BazelUtils() {
    throw new IllegalAccessError("This class must not be instantiated.");
  }

  public static String packagePathSegment(final String string) {
    return NOT_ALLOWED_CHARACTERS_IN_PACKAGE_NAME.replaceFrom(string, '_');
  }

  public static String label(final String string) {
    return NOT_ALWAYS_ALLOWED_TARGET_CHARACTERS.replaceFrom(string, '_');
  }

  public static String workspaceName(final String string) {
    return NOT_ALWAYS_ALLOWED_WORKSPACE_NAME_CHARACTERS.replaceFrom(string, '_');
  }
}
