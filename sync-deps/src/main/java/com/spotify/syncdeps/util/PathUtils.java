package com.spotify.syncdeps.util;

import com.google.common.collect.Sets;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;
import com.google.common.io.MoreFiles;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Set;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class PathUtils {
  private static final Logger LOG = LoggerFactory.getLogger(PathUtils.class);

  private PathUtils() {
    throw new IllegalAccessError("This class must not be instantiated.");
  }

  public static HashCode sha256(final Path file) throws IOException {
    return MoreFiles.asByteSource(file).hash(Hashing.sha256());
  }

  public static void syncRecursive(final Path source, final Path target) throws IOException {
    Files.walkFileTree(
        source,
        new SimpleFileVisitor<Path>() {
          @Override
          public FileVisitResult preVisitDirectory(
              final Path sourceDir, final BasicFileAttributes attrs) throws IOException {
            final Path targetDir = equivalentSubpath(source, target, sourceDir);

            Files.createDirectories(targetDir);

            return FileVisitResult.CONTINUE;
          }

          @Override
          public FileVisitResult visitFile(final Path sourceFile, final BasicFileAttributes attrs)
              throws IOException {
            final Path targetFile = equivalentSubpath(source, target, sourceFile);

            if (attrs.isSymbolicLink()) {
              syncSymbolicLink(source, target, sourceFile, targetFile);
            } else if (attrs.isRegularFile()) {
              syncRegularFile(sourceFile, targetFile);
            } else {
              LOG.warn("Will not sync irregular file {}", sourceFile);
            }

            return FileVisitResult.CONTINUE;
          }

          @Override
          public FileVisitResult postVisitDirectory(final Path sourceDir, final IOException exc)
              throws IOException {
            final Path targetDir = equivalentSubpath(source, target, sourceDir);

            final Set<Path> oldPaths =
                Sets.difference(dirContents(targetDir), dirContents(sourceDir));

            for (final Path path : oldPaths) {
              removeRecursive(targetDir.resolve(path));
            }

            return FileVisitResult.CONTINUE;
          }
        });
  }

  private static void syncRegularFile(final Path sourceFile, final Path targetFile)
      throws IOException {
    if (Files.exists(targetFile)) {
      final HashCode sourceHash = sha256(sourceFile);
      final HashCode targetHash = sha256(targetFile);

      if (sourceHash.equals(targetHash)) {
        return;
      }
    }

    Files.copy(sourceFile, targetFile, StandardCopyOption.REPLACE_EXISTING);
  }

  private static void syncSymbolicLink(
      final Path source, final Path target, final Path sourceFile, final Path targetFile)
      throws IOException {
    final Path sourceLink = Files.readSymbolicLink(sourceFile);
    final Path expectedTargetLink = equivalentSubpath(source, target, sourceLink);

    if (Files.exists(targetFile)) {
      final Path actualTargetLink = Files.readSymbolicLink(targetFile);

      if (expectedTargetLink.toRealPath().equals(actualTargetLink.toRealPath())) {
        return;
      }
    }

    Files.deleteIfExists(targetFile);
    Files.createSymbolicLink(targetFile, expectedTargetLink);
  }

  private static Set<Path> dirContents(final Path dir) throws IOException {
    return Files.list(dir).map(Path::getFileName).collect(Collectors.toSet());
  }

  static Path equivalentSubpath(final Path a, final Path b, final Path path) {
    return b.resolve(a.relativize(path));
  }

  public static void removeRecursive(final Path path) throws IOException {
    Files.walkFileTree(
        path,
        new SimpleFileVisitor<Path>() {
          @Override
          public FileVisitResult visitFile(final Path file, final BasicFileAttributes attrs)
              throws IOException {
            Files.deleteIfExists(file);
            return FileVisitResult.CONTINUE;
          }

          @Override
          public FileVisitResult postVisitDirectory(final Path dir, final IOException exc)
              throws IOException {
            Files.deleteIfExists(dir);
            return FileVisitResult.CONTINUE;
          }
        });
  }
}
