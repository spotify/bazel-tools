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

import static com.google.common.collect.ImmutableMap.toImmutableMap;

import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Multimap;
import com.google.common.collect.Table;
import com.google.common.collect.TreeMultimap;
import com.google.common.hash.HashCode;
import com.google.common.hash.Hashing;
import com.google.common.io.Files;
import com.spotify.syncdeps.config.Dependencies;
import com.spotify.syncdeps.model.MavenCoords;
import com.spotify.syncdeps.model.MavenDependency;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.time.Instant;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.apache.ivy.Ivy;
import org.apache.ivy.core.module.descriptor.DefaultDependencyDescriptor;
import org.apache.ivy.core.module.descriptor.DefaultModuleDescriptor;
import org.apache.ivy.core.module.id.ModuleId;
import org.apache.ivy.core.module.id.ModuleRevisionId;
import org.apache.ivy.core.report.ResolveReport;
import org.apache.ivy.core.resolve.IvyNode;
import org.apache.ivy.core.resolve.ResolveOptions;
import org.apache.ivy.core.retrieve.RetrieveOptions;
import org.apache.ivy.core.settings.IvySettings;
import org.apache.ivy.plugins.conflict.LatestConflictManager;
import org.apache.ivy.plugins.resolver.DependencyResolver;
import org.apache.ivy.plugins.resolver.IBiblioResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class MavenDependencies {

  private static final Logger LOG = LoggerFactory.getLogger(MavenDependencies.class);

  private static final ModuleRevisionId MODULE_REVISION_ID =
      new ModuleRevisionId(new ModuleId("com.spotify", "spotify"), "master");
  private static final String ARTIFACT_PATTERN =
      "lib/[organisation]/[artifact](-[classifier])-[revision].jar";

  public static ImmutableSet<MavenDependency> resolveDependencies(
      final Dependencies dependencyDescriptor) throws IOException, ParseException {
    final IvySettings settings = new IvySettings();
    Path cacheDirectory =
        Paths.get(System.getProperty("user.home"), ".cache", "bazel", "ivy2-cache");
    LOG.info("Using {} as Ivy cache directory", cacheDirectory.toAbsolutePath().toString());
    settings.setDefaultCache(cacheDirectory.toFile());

    final LatestConflictManager conflictManager = new LatestConflictManager();
    conflictManager.setSettings(settings);
    settings.setDefaultConflictManager(conflictManager);
    addResolvers(dependencyDescriptor.options().mavenResolvers(), settings);

    final Ivy ivy = Ivy.newInstance(settings);
    final ResolveOptions resolveOptions = createResolveOptions();

    final DefaultModuleDescriptor descriptor =
        DefaultModuleDescriptor.newBasicInstance(MODULE_REVISION_ID, Date.from(Instant.EPOCH));

    final Set<MavenDependency> leafDependencies =
        dependencyDescriptor
            .maven()
            .cellSet()
            .stream()
            .flatMap(MavenDependencies::createCellDependencies)
            .collect(Collectors.toSet());

    final Set<MavenCoords> leafDependencyCoords =
        leafDependencies.stream().map(MavenDependency::coords).collect(Collectors.toSet());

    leafDependencies
        .stream()
        .map(MavenDependencies::createDependencyDescriptor)
        .forEach(descriptor::addDependency);

    final ResolveReport resolveReport = ivy.resolve(descriptor, resolveOptions);

    if (resolveReport.hasError()) {
      throw new IllegalStateException("Error while resolving dependencies");
    }

    @SuppressWarnings("unchecked")
    final List<IvyNode> dependencies = resolveReport.getDependencies();

    ivy.retrieve(MODULE_REVISION_ID, ARTIFACT_PATTERN, createRetrieveOptions());

    final Multimap<MavenCoords, MavenCoords> edges = TreeMultimap.create();
    final Set<MavenDependency> result = new TreeSet<>();

    for (final IvyNode dependency : dependencies) {
      @SuppressWarnings("unchecked")
      final Collection<ModuleId> moduleIds = dependency.getAllCallersModuleIds();

      for (final ModuleId caller : moduleIds) {
        edges.put(getCoords(caller), getCoords(dependency.getResolvedId()));
      }
    }

    final ImmutableSet<MavenCoords> excludedDependencies =
        dependencyDescriptor.options().excludedDependencies();

    for (final IvyNode dependency : dependencies) {
      if (!dependency.isCompletelyEvicted()) {
        final ModuleRevisionId id = dependency.getId();
        final MavenCoords coords = getCoords(id);

        if (excludedDependencies.contains(coords)) {
          continue;
        }

        final String version = id.getRevision();
        final ImmutableMap<MavenCoords, Boolean> transitiveDependencies =
            edges
                .get(coords)
                .stream()
                .filter(mc -> !excludedDependencies.contains(mc))
                .collect(toImmutableMap(Function.identity(), leafDependencyCoords::contains));
        final boolean isPublic = leafDependencyCoords.contains(coords);

        final File file =
            new File(
                String.format(
                    Locale.ROOT,
                    "lib/%s/%s-%s.jar",
                    id.getOrganisation(),
                    id.getName(),
                    id.getRevision()));

        final Optional<HashCode> maybeSha1;
        if (file.exists()) {
          maybeSha1 = Optional.of(Files.hash(file, Hashing.sha1()));
        } else {
          maybeSha1 = Optional.empty();
        }

        final MavenDependency mavenDependency =
            MavenDependency.create(coords, version, maybeSha1, transitiveDependencies, isPublic);

        result.add(mavenDependency);
      }
    }

    return ImmutableSet.copyOf(result);
  }

  private static DefaultDependencyDescriptor createDependencyDescriptor(final MavenDependency d) {
    return createDependencyDescriptor(d.coords().groupId(), d.coords().artifactId(), d.version());
  }

  private static MavenCoords getCoords(final ModuleId moduleId) {
    return MavenCoords.create(moduleId.getOrganisation(), moduleId.getName());
  }

  private static MavenCoords getCoords(final ModuleRevisionId moduleRevisionId) {
    return MavenCoords.create(moduleRevisionId.getOrganisation(), moduleRevisionId.getName());
  }

  private static Stream<MavenDependency> createCellDependencies(
      final Table.Cell<String, String, Dependencies.Maven> cell) {
    final String groupIdBase = cell.getRowKey();
    final String artifactIdBase = cell.getColumnKey();
    final Dependencies.Maven dependencySpec = cell.getValue();
    assert dependencySpec != null;

    // TODO(dflemstr): handle absent version, which is "dependency management"?
    final String version = dependencySpec.version().get();

    return buildCoords(groupIdBase, artifactIdBase, dependencySpec.modules())
        .map(coord -> MavenDependency.create(coord, version, Optional.empty(), false));
  }

  private static Stream<MavenCoords> buildCoords(
      final String groupIdBase, final String artifactIdBase, final ImmutableSet<String> modules) {
    if (modules.isEmpty()) {
      return Stream.of(MavenCoords.create(groupIdBase, artifactIdBase));
    } else {
      return modules.stream().map(spec -> formatSpec(groupIdBase, artifactIdBase, spec));
    }
  }

  private static MavenCoords formatSpec(
      final String groupIdBase, final String artifactIdBase, final String spec) {
    if (spec.contains(":")) {
      final List<String> parts = Splitter.on(':').limit(2).splitToList(spec);
      final String groupIdFragment = parts.get(0);
      final String artifactIdFragment = parts.get(1);

      final String groupId;
      if (groupIdFragment.isEmpty()) {
        groupId = groupIdBase;
      } else {
        groupId = String.format(Locale.ROOT, "%s.%s", groupIdBase, groupIdFragment);
      }

      final String artifactId;
      if (artifactIdFragment.isEmpty()) {
        artifactId = artifactIdBase;
      } else {
        artifactId = String.format(Locale.ROOT, "%s-%s", artifactIdBase, artifactIdFragment);
      }

      return MavenCoords.create(groupId, artifactId);
    } else {
      final String artifactId;
      if (spec.isEmpty()) {
        artifactId = artifactIdBase;
      } else {
        artifactId = String.format(Locale.ROOT, "%s-%s", artifactIdBase, spec);
      }

      return MavenCoords.create(groupIdBase, artifactId);
    }
  }

  private static DefaultDependencyDescriptor createDependencyDescriptor(
      final String groupId, final String artifactId, final String version) {
    final ModuleRevisionId moduleRevisionId =
        new ModuleRevisionId(new ModuleId(groupId, artifactId), version);
    final DefaultDependencyDescriptor dependencyDescriptor =
        new DefaultDependencyDescriptor(moduleRevisionId, false);
    dependencyDescriptor.addDependencyConfiguration("default", "default");
    return dependencyDescriptor;
  }

  private static ResolveOptions createResolveOptions() {
    final ResolveOptions resolveOptions = new ResolveOptions();
    resolveOptions.setTransitive(true);
    resolveOptions.setDownload(true);
    return resolveOptions;
  }

  private static RetrieveOptions createRetrieveOptions() {
    final RetrieveOptions retrieveOptions = new RetrieveOptions();
    retrieveOptions.setMakeSymlinksInMass(true);
    return retrieveOptions;
  }

  private static void addResolvers(
      final ImmutableSet<Dependencies.MavenResolver> mavenResolvers, final IvySettings settings) {
    for (Dependencies.MavenResolver mavenResolver : mavenResolvers) {
      settings.addResolver(createResolver(mavenResolver));
    }
    settings.setDefaultResolver("default");
  }

  private static DependencyResolver createResolver(final Dependencies.MavenResolver mavenResolver) {
    final IBiblioResolver resolver = new IBiblioResolver();
    resolver.setM2compatible(true);
    resolver.setUsepoms(true);
    resolver.setName(mavenResolver.id());
    resolver.setRoot(mavenResolver.url());
    return resolver;
  }
}
