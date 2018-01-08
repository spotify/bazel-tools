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
package com.spotify.syncdeps.config;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableTable;
import java.io.IOException;
import java.util.Map;

final class TableDeserializer extends JsonDeserializer<ImmutableTable<?, ?, ?>>
    implements ContextualDeserializer {

  private final JavaType javaType;

  TableDeserializer() {
    this.javaType = null;
  }

  TableDeserializer(final JavaType javaType) {
    this.javaType = javaType;
  }

  @Override
  public ImmutableTable<?, ?, ?> deserialize(final JsonParser jp, final DeserializationContext ctxt)
      throws IOException {
    final ImmutableTable.Builder<Object, Object, Object> tableBuilder = ImmutableTable.builder();

    final JavaType rowKeyType = javaType.containedTypeOrUnknown(0);
    final JavaType columnKeyType = javaType.containedTypeOrUnknown(1);
    final JavaType valueType = javaType.containedTypeOrUnknown(2);
    final JavaType mapifiedType =
        ctxt.getTypeFactory()
            .constructMapType(
                Map.class,
                rowKeyType,
                ctxt.getTypeFactory().constructMapType(Map.class, columnKeyType, valueType));

    final Map<Object, Map<Object, Object>> rowMap = ctxt.readValue(jp, mapifiedType);

    for (final Map.Entry<Object, Map<Object, Object>> rowEntry : rowMap.entrySet()) {
      final Object rowKey = rowEntry.getKey();
      for (final Map.Entry<Object, Object> cellEntry : rowEntry.getValue().entrySet()) {
        final Object colKey = cellEntry.getKey();
        final Object val = cellEntry.getValue();
        tableBuilder.put(rowKey, colKey, val);
      }
    }
    return tableBuilder.build();
  }

  @Override
  public JsonDeserializer<?> createContextual(
      final DeserializationContext deserializationContext, final BeanProperty beanProperty)
      throws JsonMappingException {
    return new TableDeserializer(deserializationContext.getContextualType());
  }
}
