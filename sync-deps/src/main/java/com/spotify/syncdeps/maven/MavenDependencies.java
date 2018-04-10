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
import com.google.common.hash.HashFunction;
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
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.annotation.Nullable;
import org.apache.ivy.Ivy;
import org.apache.ivy.core.module.descriptor.DefaultDependencyArtifactDescriptor;
import org.apache.ivy.core.module.descriptor.DefaultDependencyDescriptor;
import org.apache.ivy.core.module.descriptor.DefaultExcludeRule;
import org.apache.ivy.core.module.descriptor.DefaultModuleDescriptor;
import org.apache.ivy.core.module.descriptor.DependencyArtifactDescriptor;
import org.apache.ivy.core.module.descriptor.ExcludeRule;
import org.apache.ivy.core.module.id.ArtifactId;
import org.apache.ivy.core.module.id.ModuleId;
import org.apache.ivy.core.module.id.ModuleRevisionId;
import org.apache.ivy.core.report.ResolveReport;
import org.apache.ivy.core.resolve.IvyNode;
import org.apache.ivy.core.resolve.ResolveOptions;
import org.apache.ivy.core.retrieve.RetrieveOptions;
import org.apache.ivy.core.settings.IvySettings;
import org.apache.ivy.plugins.conflict.LatestConflictManager;
import org.apache.ivy.plugins.matcher.ExactOrRegexpPatternMatcher;
import org.apache.ivy.plugins.resolver.DependencyResolver;
import org.apache.ivy.plugins.resolver.IBiblioResolver;
import org.apache.ivy.util.Message;
import org.apache.ivy.util.MessageLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class MavenDependencies {

  private static final Logger LOG = LoggerFactory.getLogger(MavenDependencies.class);

  private static final ModuleRevisionId MODULE_REVISION_ID =
      new ModuleRevisionId(new ModuleId("com.spotify", "spotify"), "master");
  private static final String ARTIFACT_PATTERN =
      "lib/[organisation]/[artifact](-[classifier])-[revision].jar";

  private MavenDependencies() {}

  public static ImmutableSet<MavenDependency> resolveDependencies(
      final Dependencies dependencyDescriptor) throws IOException, ParseException {
    Message.setDefaultLogger(IvyLogger.INSTANCE);

    final IvySettings settings = new IvySettings();
    final Path cacheDirectory =
        Paths.get(System.getProperty("user.home"), ".cache", "bazel", "ivy2-cache");
    LOG.info(
        "Using @|bold {}|@ as Ivy cache directory", cacheDirectory.toAbsolutePath().toString());
    settings.setDefaultCache(cacheDirectory.toFile());

    final LatestConflictManager conflictManager = new LatestConflictManager();
    conflictManager.setSettings(settings);
    settings.setDefaultConflictManager(conflictManager);
    addResolvers(dependencyDescriptor.options().mavenResolvers(), settings);

    final Ivy ivy = Ivy.newInstance(settings);
    ivy.getLoggerEngine().setDefaultLogger(IvyLogger.INSTANCE);

    final ResolveOptions resolveOptions = createResolveOptions();

    final DefaultModuleDescriptor descriptor =
        DefaultModuleDescriptor.newBasicInstance(MODULE_REVISION_ID, Date.from(Instant.EPOCH));

    final ImmutableSet<MavenCoords> excludedDependencies =
        dependencyDescriptor.options().excludedDependencies();

    final Set<MavenDependency> leafDependencies =
        dependencyDescriptor
            .maven()
            .cellSet()
            .stream()
            .flatMap(MavenDependencies::createCellDependencies)
            .collect(Collectors.toSet());

    final Map<MavenCoords, MavenDependency> leafDependenciesByCoords =
        leafDependencies
            .stream()
            .collect(Collectors.toMap(MavenDependency::coords, Function.identity()));

    leafDependencies
        .stream()
        .map(MavenDependencies::createDependencyDescriptor)
        .forEach(descriptor::addDependency);

    excludedDependencies
        .stream()
        .map(MavenDependencies::createExcludeRule)
        .forEach(descriptor::addExcludeRule);

    System.out.println("=== === ===" + descriptor.toString());
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

    for (final IvyNode dependency : dependencies) {
      final ModuleRevisionId id = dependency.getId();
      final MavenCoords coords = getCoords(id);

      if (!(excludedDependencies.contains(coords) || dependency.isCompletelyEvicted())) {
        final String version = id.getRevision();
        final ImmutableMap<MavenCoords, Boolean> transitiveDependencies =
            edges
                .get(coords)
                .stream()
                .filter(mc -> !excludedDependencies.contains(mc))
                .collect(
                    toImmutableMap(
                        Function.identity(),
                        c -> {
                          final MavenDependency dep = leafDependenciesByCoords.get(c);
                          return dep != null && dep.isPublic();
                        }));

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
          @SuppressWarnings("deprecation") // Yes, this hash function is broken but needed by Bazel
          final HashFunction hashFunction = Hashing.sha1();
          maybeSha1 = Optional.of(Files.asByteSource(file).hash(hashFunction));
        } else {
          maybeSha1 = Optional.empty();
        }

        final @Nullable MavenDependency declaredDependency = leafDependenciesByCoords.get(coords);

        final MavenDependency mavenDependency =
            MavenDependency.create(
                coords,
                version,
                maybeSha1,
                transitiveDependencies,
                declaredDependency != null && declaredDependency.isPublic(),
                declaredDependency != null && declaredDependency.neverLink(),
                declaredDependency != null && declaredDependency.asFile());

        result.add(mavenDependency);
      }
    }

    return ImmutableSet.copyOf(result);
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

    return buildCoords(groupIdBase, artifactIdBase, dependencySpec.modules(), dependencySpec.classifier())
        .map(
            coord ->
                MavenDependency.create(
                    coord,
                    version,
                    Optional.empty(),
                    ImmutableMap.of(),
                    /* isPublic= */ true,
                    /* neverLink= */ dependencySpec.neverLink(),
                    /* asFile=*/ dependencySpec.asFile()));
  }

  private static Stream<MavenCoords> buildCoords(
      final String groupIdBase, final String artifactIdBase, final ImmutableSet<String> modules,
      Optional<String> classifier) {
    if (modules.isEmpty()) {
      return Stream.of(MavenCoords.create(groupIdBase, artifactIdBase, classifier));
    } else {
      return modules.stream().map(spec -> formatSpec(groupIdBase, artifactIdBase, classifier, spec));
    }
  }

  private static MavenCoords formatSpec(
      final String groupIdBase, final String artifactIdBase,
      Optional<String> classifier, final String spec) {
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

      return MavenCoords.create(groupId, artifactId, classifier);
    } else {
      final String artifactId;
      if (spec.isEmpty()) {
        artifactId = artifactIdBase;
      } else {
        artifactId = String.format(Locale.ROOT, "%s-%s", artifactIdBase, spec);
      }

      return MavenCoords.create(groupIdBase, artifactId, classifier);
    }
  }

  private static ExcludeRule createExcludeRule(final MavenCoords mavenCoords) {
    final ModuleId moduleId = new ModuleId(mavenCoords.groupId(), mavenCoords.artifactId());
    final ArtifactId artifactId = new ArtifactId(moduleId, ".*", ".*", ",*");
    final DefaultExcludeRule excludeRule =
        new DefaultExcludeRule(
            artifactId, ExactOrRegexpPatternMatcher.INSTANCE, Collections.emptyMap());
    excludeRule.addConfiguration("default");
    return excludeRule;
  }

  private static DefaultDependencyDescriptor createDependencyDescriptor(final MavenDependency d) {
    return createDependencyDescriptor(
        d.coords().groupId(), d.coords().artifactId(), d.coords().classifier(), d.version());
  }

  private static DefaultDependencyDescriptor createDependencyDescriptor(
      final String groupId,
      final String artifactId,
      Optional<String> classifier,
      final String version) {
    final ModuleRevisionId moduleRevisionId =
        ModuleRevisionId.newInstance(groupId, artifactId, version);
    System.out.println("A ==> " + moduleRevisionId.encodeToString());
    final DefaultDependencyDescriptor dependencyDescriptor =
        new DefaultDependencyDescriptor(moduleRevisionId, false);
    dependencyDescriptor.addDependencyConfiguration("default", "default");

    classifier.ifPresent(
        classifierName -> {
          DependencyArtifactDescriptor artifact =
              new DefaultDependencyArtifactDescriptor(
                  dependencyDescriptor,
                  moduleRevisionId.getName(),
                  "jar",
                  "jar",
                  null,
                  ImmutableMap.of("m:classifier", classifierName));
          dependencyDescriptor.addDependencyArtifact("default", artifact);
        });
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

  private enum IvyLogger implements MessageLogger {
    INSTANCE;

    // Intentionally using Ivy as the logger name here.
    private static final Logger LOG = LoggerFactory.getLogger(Ivy.class);

    @Override
    public void log(final String msg, final int level) {
      switch (level) {
        case Message.MSG_DEBUG:
          debug(msg);
          break;
        case Message.MSG_VERBOSE:
          verbose(msg);
          break;
        case Message.MSG_INFO:
          info(msg);
          break;
        case Message.MSG_WARN:
          warn(msg);
          break;
        case Message.MSG_ERR:
          error(msg);
          break;
        default:
          throw new IllegalArgumentException("Unexpected log level " + level);
      }
    }

    @Override
    public void rawlog(final String msg, final int level) {
      log(msg, level);
    }

    @Override
    public void debug(final String msg) {
      LOG.debug("{}", msg);
    }

    @Override
    public void verbose(final String msg) {}

    @Override
    public void deprecated(final String msg) {}

    @Override
    public void info(final String msg) {
      LOG.info("{}", msg);
    }

    @Override
    public void rawinfo(final String msg) {
      info(msg);
    }

    @Override
    public void warn(final String msg) {
      LOG.warn("{}", msg);
    }

    @Override
    public void error(final String msg) {
      LOG.error("{}", msg);
    }

    @Override
    public List<String> getProblems() {
      return Collections.emptyList();
    }

    @Override
    public List<String> getWarns() {
      return Collections.emptyList();
    }

    @Override
    public List<String> getErrors() {
      return Collections.emptyList();
    }

    @Override
    public void clearProblems() {
      // No-op
    }

    @Override
    public void sumupProblems() {
      // No-op
    }

    @Override
    public void progress() {
      // No-op
    }

    @Override
    public void endProgress() {
      // No-op
    }

    @Override
    public void endProgress(final String msg) {
      // No-op
    }

    @Override
    public boolean isShowProgress() {
      return false;
    }

    @Override
    public void setShowProgress(final boolean progress) {
      // No-op
    }
  }
}
