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
package com.spotify.syncdeps.maven;

import static com.google.common.collect.ImmutableList.toImmutableList;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Table;
import com.spotify.syncdeps.config.Dependencies;
import com.spotify.syncdeps.model.MavenCoords;
import com.spotify.syncdeps.model.MavenDependency;
import com.spotify.syncdeps.model.MavenDependencyKind;
import java.util.Optional;
import java.util.stream.Stream;
import javax.annotation.Nullable;
import org.junit.Test;

public class MavenDependenciesTest {
  @Test
  public void testCreateCellDependencies_simple() {
    final Stream<MavenDependency> dependencies =
        MavenDependencies.createCellDependencies(
            "2.11",
            SimpleCell.create(
                "a",
                "b",
                Dependencies.Maven.create(
                    "1.0", ImmutableSet.of(), /* neverLink= */ false, MavenDependencyKind.JAVA)));

    assertThat(
        dependencies.collect(toImmutableList()),
        is(
            ImmutableList.of(
                MavenDependency.create(
                    MavenCoords.create("a", "b"),
                    "1.0",
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ false,
                    MavenDependencyKind.JAVA))));
  }

  @Test
  public void testCreateCellDependencies_normalModule() {
    final Stream<MavenDependency> dependencies =
        MavenDependencies.createCellDependencies(
            "2.11",
            SimpleCell.create(
                "a",
                "b",
                Dependencies.Maven.create(
                    "1.0",
                    ImmutableSet.of("c"),
                    /* neverLink= */ false,
                    MavenDependencyKind.JAVA)));

    assertThat(
        dependencies.collect(toImmutableList()),
        is(
            ImmutableList.of(
                MavenDependency.create(
                    MavenCoords.create("a", "b-c"),
                    "1.0",
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ false,
                    MavenDependencyKind.JAVA))));
  }

  @Test
  public void testCreateCellDependencies_groupModule() {
    final Stream<MavenDependency> dependencies =
        MavenDependencies.createCellDependencies(
            "2.11",
            SimpleCell.create(
                "a",
                "b",
                Dependencies.Maven.create(
                    "1.0",
                    ImmutableSet.of("c:d"),
                    /* neverLink= */ false,
                    MavenDependencyKind.JAVA)));

    assertThat(
        dependencies.collect(toImmutableList()),
        is(
            ImmutableList.of(
                MavenDependency.create(
                    MavenCoords.create("a.c", "b-d"),
                    "1.0",
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ false,
                    MavenDependencyKind.JAVA))));
  }

  @Test
  public void testCreateCellDependencies_emptyModule() {
    final Stream<MavenDependency> dependencies =
        MavenDependencies.createCellDependencies(
            "2.11",
            SimpleCell.create(
                "a",
                "b",
                Dependencies.Maven.create(
                    "1.0", ImmutableSet.of(""), /* neverLink= */ false, MavenDependencyKind.JAVA)));

    assertThat(
        dependencies.collect(toImmutableList()),
        is(
            ImmutableList.of(
                MavenDependency.create(
                    MavenCoords.create("a", "b"),
                    "1.0",
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ false,
                    MavenDependencyKind.JAVA))));
  }

  @Test
  public void testCreateCellDependencies_scala() {
    final Stream<MavenDependency> dependencies =
        MavenDependencies.createCellDependencies(
            "2.11",
            SimpleCell.create(
                "a",
                "b",
                Dependencies.Maven.create(
                    "1.0",
                    ImmutableSet.of(""),
                    /* neverLink= */ false,
                    MavenDependencyKind.SCALA)));

    assertThat(
        dependencies.collect(toImmutableList()),
        is(
            ImmutableList.of(
                MavenDependency.create(
                    MavenCoords.create("a", "b_2.11"),
                    "1.0",
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ false,
                    MavenDependencyKind.SCALA))));
  }

  @Test
  public void testCreateCellDependencies_scalaMacro() {
    final Stream<MavenDependency> dependencies =
        MavenDependencies.createCellDependencies(
            "2.11",
            SimpleCell.create(
                "a",
                "b",
                Dependencies.Maven.create(
                    "1.0",
                    ImmutableSet.of(""),
                    /* neverLink= */ false,
                    MavenDependencyKind.SCALA_MACRO)));

    assertThat(
        dependencies.collect(toImmutableList()),
        is(
            ImmutableList.of(
                MavenDependency.create(
                    MavenCoords.create("a", "b_2.11"),
                    "1.0",
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ false,
                    MavenDependencyKind.SCALA_MACRO))));
  }

  static class SimpleCell<R, C, V> implements Table.Cell<R, C, V> {
    private final R rowKey;
    private final C columnKey;
    private final V value;

    private SimpleCell(final R rowKey, final C columnKey, final V value) {
      this.rowKey = rowKey;
      this.columnKey = columnKey;
      this.value = value;
    }

    static <R, C, V> SimpleCell<R, C, V> create(final R rowKey, final C columnKey, final V value) {
      return new SimpleCell<>(rowKey, columnKey, value);
    }

    @Nullable
    @Override
    public R getRowKey() {
      return rowKey;
    }

    @Nullable
    @Override
    public C getColumnKey() {
      return columnKey;
    }

    @Nullable
    @Override
    public V getValue() {
      return value;
    }
  }
}
