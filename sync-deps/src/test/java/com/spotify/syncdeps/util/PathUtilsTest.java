package com.spotify.syncdeps.util;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.describedAs;
import static org.hamcrest.Matchers.is;

import com.google.common.hash.HashCode;
import com.google.common.jimfs.Configuration;
import com.google.common.jimfs.Jimfs;
import java.nio.file.FileSystem;
import java.nio.file.Files;
import java.nio.file.Path;
import okio.ByteString;
import org.junit.Test;

public class PathUtilsTest {
  private final FileSystem fs = Jimfs.newFileSystem(Configuration.unix());

  @Test
  public void testSha256() throws Exception {
    final Path file = fs.getPath("/", "file");
    Files.write(file, new byte[] {0x00, 0x01, 0x02});

    final HashCode hashCode = PathUtils.sha256(file);
    assertThat(
        hashCode.toString(),
        is("ae4b3280e56e2faf83f414a6e3dabe9d5fbe18976544c05fed121accb85b53fc"));
  }

  @Test
  public void testEquivalentSubpath() throws Exception {
    final Path a = fs.getPath("/", "a", "b");
    final Path b = fs.getPath("/", "a", "d");
    final Path path = fs.getPath("/", "a", "b", "c");

    final Path expectedOutput = fs.getPath("/", "a", "d", "c");
    final Path actualOutput = PathUtils.equivalentSubpath(a, b, path);

    assertThat(actualOutput, is(expectedOutput));
  }

  @Test
  public void testRemoveRecursive() throws Exception {
    final Path root = Files.createDirectory(fs.getPath("/", "root"));
    final Path unrelated = Files.write(root.resolve("unrelated"), new byte[] {0x0f});

    final Path dir = Files.createDirectory(root.resolve("dir"));
    Files.write(dir.resolve("a"), new byte[] {0x00});
    Files.write(dir.resolve("b"), new byte[] {0x01});
    Files.createSymbolicLink(dir.resolve("c"), dir.resolve("b"));
    // The target of this link intentionally points to a file outside of our dir
    Files.createSymbolicLink(dir.resolve("d"), unrelated);
    // Create a subdir
    final Path subdir = Files.createDirectory(dir.resolve("subdir"));
    Files.write(subdir.resolve("e"), new byte[] {0x00});
    Files.write(subdir.resolve("f"), new byte[] {0x01});

    PathUtils.removeRecursive(dir);

    assertThat(Files.notExists(dir), describedAs("directory was deleted", is(true)));
    assertThat(Files.exists(unrelated), describedAs("unrelated file was kept", is(true)));
  }

  @Test
  public void testSyncRecursive() throws Exception {
    final Path root = Files.createDirectory(fs.getPath("/", "root"));
    final Path unrelated = Files.write(root.resolve("unrelated"), new byte[] {0x0f});

    final Path dir = Files.createDirectory(root.resolve("dir"));
    Files.write(dir.resolve("a"), new byte[] {0x00});
    Files.write(dir.resolve("b"), new byte[] {0x01});
    Files.createSymbolicLink(dir.resolve("c"), dir.resolve("b"));
    // The target of this link intentionally points to a file outside of our dir
    Files.createSymbolicLink(dir.resolve("d"), unrelated);
    // Create a subdir
    final Path subdir = Files.createDirectory(dir.resolve("subdir"));
    Files.write(subdir.resolve("e"), new byte[] {0x00});
    Files.write(subdir.resolve("f"), new byte[] {0x01});

    final Path newdir = Files.createDirectory(root.resolve("newdir"));
    final Path targetFileA = newdir.resolve("a");
    final Path targetFileB = newdir.resolve("b");
    final Path targetFileC = newdir.resolve("c");
    final Path targetFileD = newdir.resolve("d");
    final Path targetFileX = newdir.resolve("x");
    final Path newsubdir = newdir.resolve("subdir");
    final Path targetFileE = newsubdir.resolve("e");
    final Path targetFileF = newsubdir.resolve("f");
    final Path newsubdirX = newdir.resolve("subdirX");

    // Different contents
    Files.write(targetFileA, new byte[] {0x0f});
    // Same contents
    Files.write(targetFileB, new byte[] {0x01});
    // Different link target
    Files.createSymbolicLink(targetFileC, dir.resolve("a"));
    // Shouldn't exist
    Files.write(targetFileX, new byte[] {0x01});
    // Shouldn't exist
    Files.createDirectory(newsubdirX);
    Files.write(newsubdirX.resolve("foo"), new byte[] {0x01});
    Files.write(newsubdirX.resolve("bar"), new byte[] {0x01});

    PathUtils.syncRecursive(dir, newdir);

    assertThat(ByteString.of(Files.readAllBytes(targetFileA)), is(ByteString.of((byte) 0x00)));
    assertThat(ByteString.of(Files.readAllBytes(targetFileB)), is(ByteString.of((byte) 0x01)));
    assertThat(Files.readSymbolicLink(targetFileC).toRealPath(), is(newdir.resolve("b")));
    assertThat(Files.readSymbolicLink(targetFileD).toRealPath(), is(unrelated));
    assertThat(ByteString.of(Files.readAllBytes(targetFileE)), is(ByteString.of((byte) 0x00)));
    assertThat(ByteString.of(Files.readAllBytes(targetFileF)), is(ByteString.of((byte) 0x01)));

    assertThat(Files.notExists(targetFileX), is(true));
    assertThat(Files.notExists(newsubdirX), is(true));
  }
}
