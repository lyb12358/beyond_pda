// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInventoryCollection on Isar {
  IsarCollection<Inventory> get inventorys => this.collection();
}

const InventorySchema = CollectionSchema(
  name: r'Inventory',
  id: 9013770421438767579,
  properties: {
    r'documentCode': PropertySchema(
      id: 0,
      name: r'documentCode',
      type: IsarType.string,
    ),
    r'inventoryList': PropertySchema(
      id: 1,
      name: r'inventoryList',
      type: IsarType.objectList,
      target: r'OnlineSingleProdInventory',
    ),
    r'shopId': PropertySchema(
      id: 2,
      name: r'shopId',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _inventoryEstimateSize,
  serialize: _inventorySerialize,
  deserialize: _inventoryDeserialize,
  deserializeProp: _inventoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'OnlineSingleProdInventory': OnlineSingleProdInventorySchema
  },
  getId: _inventoryGetId,
  getLinks: _inventoryGetLinks,
  attach: _inventoryAttach,
  version: '3.1.0+1',
);

int _inventoryEstimateSize(
  Inventory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.documentCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.inventoryList;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[OnlineSingleProdInventory]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += OnlineSingleProdInventorySchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _inventorySerialize(
  Inventory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.documentCode);
  writer.writeObjectList<OnlineSingleProdInventory>(
    offsets[1],
    allOffsets,
    OnlineSingleProdInventorySchema.serialize,
    object.inventoryList,
  );
  writer.writeLong(offsets[2], object.shopId);
  writer.writeLong(offsets[3], object.userId);
}

Inventory _inventoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Inventory(
    documentCode: reader.readStringOrNull(offsets[0]),
    id: id,
    inventoryList: reader.readObjectList<OnlineSingleProdInventory>(
      offsets[1],
      OnlineSingleProdInventorySchema.deserialize,
      allOffsets,
      OnlineSingleProdInventory(),
    ),
    shopId: reader.readLongOrNull(offsets[2]),
    userId: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _inventoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<OnlineSingleProdInventory>(
        offset,
        OnlineSingleProdInventorySchema.deserialize,
        allOffsets,
        OnlineSingleProdInventory(),
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inventoryGetId(Inventory object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _inventoryGetLinks(Inventory object) {
  return [];
}

void _inventoryAttach(IsarCollection<dynamic> col, Id id, Inventory object) {
  object.id = id;
}

extension InventoryQueryWhereSort
    on QueryBuilder<Inventory, Inventory, QWhere> {
  QueryBuilder<Inventory, Inventory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InventoryQueryWhere
    on QueryBuilder<Inventory, Inventory, QWhereClause> {
  QueryBuilder<Inventory, Inventory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InventoryQueryFilter
    on QueryBuilder<Inventory, Inventory, QFilterCondition> {
  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentCode',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentCode',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> documentCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> documentCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> documentCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      documentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inventoryList',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inventoryList',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inventoryList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inventoryList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inventoryList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inventoryList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inventoryList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'inventoryList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> shopIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shopId',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> shopIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shopId',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> shopIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> shopIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> shopIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shopId',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> shopIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shopId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InventoryQueryObject
    on QueryBuilder<Inventory, Inventory, QFilterCondition> {
  QueryBuilder<Inventory, Inventory, QAfterFilterCondition>
      inventoryListElement(FilterQuery<OnlineSingleProdInventory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'inventoryList');
    });
  }
}

extension InventoryQueryLinks
    on QueryBuilder<Inventory, Inventory, QFilterCondition> {}

extension InventoryQuerySortBy on QueryBuilder<Inventory, Inventory, QSortBy> {
  QueryBuilder<Inventory, Inventory, QAfterSortBy> sortByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> sortByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> sortByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> sortByShopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.desc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension InventoryQuerySortThenBy
    on QueryBuilder<Inventory, Inventory, QSortThenBy> {
  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByDocumentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByDocumentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentCode', Sort.desc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByShopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shopId', Sort.desc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Inventory, Inventory, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension InventoryQueryWhereDistinct
    on QueryBuilder<Inventory, Inventory, QDistinct> {
  QueryBuilder<Inventory, Inventory, QDistinct> distinctByDocumentCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Inventory, Inventory, QDistinct> distinctByShopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shopId');
    });
  }

  QueryBuilder<Inventory, Inventory, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension InventoryQueryProperty
    on QueryBuilder<Inventory, Inventory, QQueryProperty> {
  QueryBuilder<Inventory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Inventory, String?, QQueryOperations> documentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentCode');
    });
  }

  QueryBuilder<Inventory, List<OnlineSingleProdInventory>?, QQueryOperations>
      inventoryListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inventoryList');
    });
  }

  QueryBuilder<Inventory, int?, QQueryOperations> shopIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shopId');
    });
  }

  QueryBuilder<Inventory, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OnlineSingleProdInventorySchema = Schema(
  name: r'OnlineSingleProdInventory',
  id: 2373345791972000599,
  properties: {
    r'catName': PropertySchema(
      id: 0,
      name: r'catName',
      type: IsarType.string,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'codeId': PropertySchema(
      id: 2,
      name: r'codeId',
      type: IsarType.long,
    ),
    r'codeThumbnail': PropertySchema(
      id: 3,
      name: r'codeThumbnail',
      type: IsarType.string,
    ),
    r'diffNum': PropertySchema(
      id: 4,
      name: r'diffNum',
      type: IsarType.long,
    ),
    r'num': PropertySchema(
      id: 5,
      name: r'num',
      type: IsarType.long,
    ),
    r'onlineNum': PropertySchema(
      id: 6,
      name: r'onlineNum',
      type: IsarType.long,
    ),
    r'prodName': PropertySchema(
      id: 7,
      name: r'prodName',
      type: IsarType.string,
    ),
    r'speName': PropertySchema(
      id: 8,
      name: r'speName',
      type: IsarType.string,
    ),
    r'styleId': PropertySchema(
      id: 9,
      name: r'styleId',
      type: IsarType.long,
    ),
    r'styleThumbnail': PropertySchema(
      id: 10,
      name: r'styleThumbnail',
      type: IsarType.string,
    ),
    r'typeName': PropertySchema(
      id: 11,
      name: r'typeName',
      type: IsarType.string,
    ),
    r'yearName': PropertySchema(
      id: 12,
      name: r'yearName',
      type: IsarType.string,
    )
  },
  estimateSize: _onlineSingleProdInventoryEstimateSize,
  serialize: _onlineSingleProdInventorySerialize,
  deserialize: _onlineSingleProdInventoryDeserialize,
  deserializeProp: _onlineSingleProdInventoryDeserializeProp,
);

int _onlineSingleProdInventoryEstimateSize(
  OnlineSingleProdInventory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.catName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.codeThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.prodName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.speName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.styleThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.typeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.yearName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _onlineSingleProdInventorySerialize(
  OnlineSingleProdInventory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.catName);
  writer.writeString(offsets[1], object.code);
  writer.writeLong(offsets[2], object.codeId);
  writer.writeString(offsets[3], object.codeThumbnail);
  writer.writeLong(offsets[4], object.diffNum);
  writer.writeLong(offsets[5], object.num);
  writer.writeLong(offsets[6], object.onlineNum);
  writer.writeString(offsets[7], object.prodName);
  writer.writeString(offsets[8], object.speName);
  writer.writeLong(offsets[9], object.styleId);
  writer.writeString(offsets[10], object.styleThumbnail);
  writer.writeString(offsets[11], object.typeName);
  writer.writeString(offsets[12], object.yearName);
}

OnlineSingleProdInventory _onlineSingleProdInventoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OnlineSingleProdInventory();
  object.catName = reader.readStringOrNull(offsets[0]);
  object.code = reader.readStringOrNull(offsets[1]);
  object.codeId = reader.readLongOrNull(offsets[2]);
  object.codeThumbnail = reader.readStringOrNull(offsets[3]);
  object.diffNum = reader.readLongOrNull(offsets[4]);
  object.num = reader.readLongOrNull(offsets[5]);
  object.onlineNum = reader.readLongOrNull(offsets[6]);
  object.prodName = reader.readStringOrNull(offsets[7]);
  object.speName = reader.readStringOrNull(offsets[8]);
  object.styleId = reader.readLongOrNull(offsets[9]);
  object.styleThumbnail = reader.readStringOrNull(offsets[10]);
  object.typeName = reader.readStringOrNull(offsets[11]);
  object.yearName = reader.readStringOrNull(offsets[12]);
  return object;
}

P _onlineSingleProdInventoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OnlineSingleProdInventoryQueryFilter on QueryBuilder<
    OnlineSingleProdInventory, OnlineSingleProdInventory, QFilterCondition> {
  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'catName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'catName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'catName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      catNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      catNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'catName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> catNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'catName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codeId',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codeId',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeId',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codeId',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codeId',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codeThumbnail',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codeThumbnail',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codeThumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      codeThumbnailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      codeThumbnailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codeThumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> codeThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codeThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> diffNumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diffNum',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> diffNumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diffNum',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> diffNumEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diffNum',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> diffNumGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diffNum',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> diffNumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diffNum',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> diffNumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diffNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> numIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'num',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> numIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'num',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> numEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> numGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> numLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> numBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'num',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> onlineNumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'onlineNum',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> onlineNumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'onlineNum',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> onlineNumEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'onlineNum',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> onlineNumGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'onlineNum',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> onlineNumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'onlineNum',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> onlineNumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'onlineNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prodName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prodName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prodName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      prodNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      prodNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prodName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prodName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> prodNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prodName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      speNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      speNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> speNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'styleId',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'styleId',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'styleId',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'styleId',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'styleId',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'styleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'styleThumbnail',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'styleThumbnail',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'styleThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'styleThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'styleThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'styleThumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'styleThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'styleThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      styleThumbnailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'styleThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      styleThumbnailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'styleThumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'styleThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> styleThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'styleThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'typeName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'typeName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      typeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      typeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> typeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typeName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yearName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yearName',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'yearName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'yearName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      yearNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'yearName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
          QAfterFilterCondition>
      yearNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'yearName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearName',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlineSingleProdInventory, OnlineSingleProdInventory,
      QAfterFilterCondition> yearNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'yearName',
        value: '',
      ));
    });
  }
}

extension OnlineSingleProdInventoryQueryObject on QueryBuilder<
    OnlineSingleProdInventory, OnlineSingleProdInventory, QFilterCondition> {}
