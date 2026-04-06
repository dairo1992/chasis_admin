// GENERATED CODE - DO NOT MODIFY BY HAND
// Manual bypass of build_runner due to SDK toolchain issues.

part of 'local_storage_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLocalStorageIsarModelCollection on Isar {
  IsarCollection<LocalStorageIsarModel> get localStorageIsarModels =>
      this.collection();
}

const LocalStorageIsarModelSchema = CollectionSchema(
  name: r'LocalStorageIsarModel',
  id: -5907409425026210816,
  properties: {
    r'isSecure': PropertySchema(
      id: 0,
      name: r'isSecure',
      type: IsarType.bool,
    ),
    r'key': PropertySchema(
      id: 1,
      name: r'key',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _localStorageIsarModelEstimateSize,
  serialize: _localStorageIsarModelSerialize,
  deserialize: _localStorageIsarModelDeserialize,
  deserializeProp: _localStorageIsarModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'key': IndexSchema(
      id: -4826182272838380544,
      name: r'key',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'key',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _localStorageIsarModelGetId,
  getLinks: _localStorageIsarModelGetLinks,
  attach: _localStorageIsarModelAttach,
  version: '3.1.0+1',
);

int _localStorageIsarModelEstimateSize(LocalStorageIsarModel object,
    List<int> offsets, Map<Type, List<int>> allOffsets) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.value.length * 3;
  return bytesCount;
}

void _localStorageIsarModelSerialize(LocalStorageIsarModel object,
    IsarWriter writer, List<int> offsets, Map<Type, List<int>> allOffsets) {
  writer.writeBool(offsets[0], object.isSecure);
  writer.writeString(offsets[1], object.key);
  writer.writeString(offsets[2], object.value);
}

LocalStorageIsarModel _localStorageIsarModelDeserialize(Id id,
    IsarReader reader, List<int> offsets, Map<Type, List<int>> allOffsets) {
  final object = LocalStorageIsarModel(
    key: reader.readString(offsets[1]),
    value: reader.readString(offsets[2]),
    isSecure: reader.readBool(offsets[0]),
  );
  object.id = id;
  return object;
}

P _localStorageIsarModelDeserializeProp<P>(IsarReader reader, int propertyId,
    int offset, Map<Type, List<int>> allOffsets) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localStorageIsarModelGetId(LocalStorageIsarModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localStorageIsarModelGetLinks(
    LocalStorageIsarModel object) {
  return [];
}

void _localStorageIsarModelAttach(
    IsarCollection<dynamic> col, Id id, LocalStorageIsarModel object) {
  object.id = id;
}

extension LocalStorageIsarModelByIndex
    on IsarCollection<LocalStorageIsarModel> {
  Future<LocalStorageIsarModel?> getByKey(String key) {
    return getByIndex(r'key', [key]);
  }

  LocalStorageIsarModel? getByKeySync(String key) {
    return getByIndexSync(r'key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex(r'key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync(r'key', [key]);
  }

  Future<List<LocalStorageIsarModel?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex(r'key', values);
  }

  List<LocalStorageIsarModel?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'key', values);
  }

  Future<Id> putByKey(LocalStorageIsarModel object) {
    return putByIndex(r'key', object);
  }

  Id putByKeySync(LocalStorageIsarModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'key', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKey(List<LocalStorageIsarModel> objects) {
    return putAllByIndex(r'key', objects);
  }

  List<Id> putAllByKeySync(List<LocalStorageIsarModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'key', objects, saveLinks: saveLinks);
  }
}

extension LocalStorageIsarModelQueryWhereSort
    on QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QWhere> {
  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocalStorageIsarModelQueryWhere on QueryBuilder<LocalStorageIsarModel,
    LocalStorageIsarModel, QWhereClause> {
  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: false))
            .addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: false));
      } else {
        return query
            .addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: false))
            .addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: false));
      }
    });
  }
}

extension LocalStorageIsarModelQueryFilter on QueryBuilder<
    LocalStorageIsarModel, LocalStorageIsarModel, QFilterCondition> {
  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel,
      QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel,
      QAfterFilterCondition> valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension LocalStorageIsarModelQueryObject on QueryBuilder<
    LocalStorageIsarModel, LocalStorageIsarModel, QFilterCondition> {}

extension LocalStorageIsarModelQueryLinks on QueryBuilder<LocalStorageIsarModel,
    LocalStorageIsarModel, QFilterCondition> {}

extension LocalStorageIsarModelQuerySortBy
    on QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QSortBy> {
  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterSortBy>
      sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }
}

extension LocalStorageIsarModelQuerySortThenBy
    on QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QSortThenBy> {
  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterSortBy>
      thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<LocalStorageIsarModel, LocalStorageIsarModel, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }
}

extension LocalStorageIsarModelQueryProperty on QueryBuilder<
    LocalStorageIsarModel, LocalStorageIsarModel, QQueryProperty> {
  QueryBuilder<LocalStorageIsarModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalStorageIsarModel, bool, QQueryOperations>
      isSecureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSecure');
    });
  }

  QueryBuilder<LocalStorageIsarModel, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<LocalStorageIsarModel, String, QQueryOperations>
      valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}

extension LocalStorageIsarModelQueryLinksFilter on QueryBuilder<
    LocalStorageIsarModel, LocalStorageIsarModel, QFilterCondition> {}
