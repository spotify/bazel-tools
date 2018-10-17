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
package com.spotify.bazeltools.cliutils;

import com.google.auto.value.AutoValue;
import com.google.common.base.Splitter;

import com.github.tomaslanger.chalk.Chalk;

import org.slf4j.LoggerFactory;

import java.util.Locale;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.spi.IThrowableProxy;
import ch.qos.logback.classic.spi.ThrowableProxyUtil;
import ch.qos.logback.core.AppenderBase;

import static org.fusesource.jansi.Ansi.ansi;

public final class Cli {

  public static final Chalk DEBUG_CHALK = Chalk.on("DEBUG").green();

  private Cli() {
    throw new IllegalAccessError("This class must not be instantiated.");
  }

  public static void configureLogging(final String toolName, final boolean verbose) {
    final LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
    final Logger logger = loggerContext.getLogger(org.slf4j.Logger.ROOT_LOGGER_NAME);
    final CliAppender appender = CliAppender.create(toolName, verbose);
    appender.setContext(loggerContext);
    logger.detachAndStopAllAppenders();
    logger.addAppender(appender);
    appender.start();
  }

  @AutoValue
  abstract static class CliAppender extends AppenderBase<ILoggingEvent> {

    private static final Chalk ERROR_CHALK = Chalk.on("ERROR").red();
    private static final Chalk WARN_CHALK = Chalk.on(" WARN").yellow();
    private static final Chalk INFO_CHALK = Chalk.on(" INFO").blue();
    private static final Chalk TRACE_CHALK = Chalk.on("TRACE").gray();

    abstract String toolName();

    abstract boolean verbose();

    Chalk toolChalk() {
      return Chalk.on(toolName()).bold();
    }

    static CliAppender create(final String toolName, final boolean verbose) {
      return new AutoValue_Cli_CliAppender(toolName, verbose);
    }

    @Override
    protected void append(final ILoggingEvent eventObject) {
      final Level level = eventObject.getLevel();

      final Chalk prefix;
      switch (level.toInt()) {
        case Level.ERROR_INT:
          prefix = ERROR_CHALK;
          break;
        case Level.WARN_INT:
          prefix = WARN_CHALK;
          break;
        case Level.INFO_INT:
          prefix = INFO_CHALK;
          break;
        case Level.DEBUG_INT:
          if (!verbose()) {
            return;
          }
          prefix = DEBUG_CHALK;
          break;
        case Level.TRACE_INT:
          if (!verbose()) {
            return;
          }
          prefix = TRACE_CHALK;
          break;
        case Level.OFF_INT:
        case Level.ALL_INT:
        default:
          throw new IllegalArgumentException("Unexpected log level " + level);
      }

      System.err.printf(
          Locale.ROOT,
          "%s %s: %s%n",
          toolChalk(),
          prefix,
          ansi().render(eventObject.getFormattedMessage()));

      final IThrowableProxy throwableProxy = eventObject.getThrowableProxy();
      if (throwableProxy != null) {
        for (final String line :
            Splitter.on('\n')
                .omitEmptyStrings()
                .split(ThrowableProxyUtil.asString(throwableProxy))) {
          System.err.printf(Locale.ROOT, "%s %s: %s%n", toolChalk(), prefix, line);
        }
      }
    }
  }
}
