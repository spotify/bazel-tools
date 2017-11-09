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
