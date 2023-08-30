// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductDataCollection on Isar {
  IsarCollection<ProductData> get productDatas => this.collection();
}

const ProductDataSchema = CollectionSchema(
  name: r'ProductData',
  id: -11498757595454297,
  properties: {
    r'catName': PropertySchema(
      id: 0,
      name: r'catName',
      type: IsarType.string,
    ),
    r'codeId': PropertySchema(
      id: 1,
      name: r'codeId',
      type: IsarType.long,
    ),
    r'codeThumbnail': PropertySchema(
      id: 2,
      name: r'codeThumbnail',
      type: IsarType.string,
    ),
    r'prodCode': PropertySchema(
      id: 3,
      name: r'prodCode',
      type: IsarType.string,
    ),
    r'prodName': PropertySchema(
      id: 4,
      name: r'prodName',
      type: IsarType.string,
    ),
    r'speName': PropertySchema(
      id: 5,
      name: r'speName',
      type: IsarType.string,
    ),
    r'styleId': PropertySchema(
      id: 6,
      name: r'styleId',
      type: IsarType.long,
    )
  },
  estimateSize: _productDataEstimateSize,
  serialize: _productDataSerialize,
  deserialize: _productDataDeserialize,
  deserializeProp: _productDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'prodCode': IndexSchema(
      id: 3460852858819243643,
      name: r'prodCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'prodCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _productDataGetId,
  getLinks: _productDataGetLinks,
  attach: _productDataAttach,
  version: '3.1.0+1',
);

int _productDataEstimateSize(
  ProductData object,
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
    final value = object.codeThumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.prodCode;
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
  return bytesCount;
}

void _productDataSerialize(
  ProductData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.catName);
  writer.writeLong(offsets[1], object.codeId);
  writer.writeString(offsets[2], object.codeThumbnail);
  writer.writeString(offsets[3], object.prodCode);
  writer.writeString(offsets[4], object.prodName);
  writer.writeString(offsets[5], object.speName);
  writer.writeLong(offsets[6], object.styleId);
}

ProductData _productDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductData(
    catName: reader.readStringOrNull(offsets[0]),
    codeId: reader.readLongOrNull(offsets[1]),
    codeThumbnail: reader.readStringOrNull(offsets[2]),
    id: id,
    prodCode: reader.readStringOrNull(offsets[3]),
    prodName: reader.readStringOrNull(offsets[4]),
    speName: reader.readStringOrNull(offsets[5]),
    styleId: reader.readLongOrNull(offsets[6]),
  );
  return object;
}

P _productDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productDataGetId(ProductData object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _productDataGetLinks(ProductData object) {
  return [];
}

void _productDataAttach(
    IsarCollection<dynamic> col, Id id, ProductData object) {
  object.id = id;
}

extension ProductDataQueryWhereSort
    on QueryBuilder<ProductData, ProductData, QWhere> {
  QueryBuilder<ProductData, ProductData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductDataQueryWhere
    on QueryBuilder<ProductData, ProductData, QWhereClause> {
  QueryBuilder<ProductData, ProductData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> prodCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prodCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterWhereClause>
      prodCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prodCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> prodCodeEqualTo(
      String? prodCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prodCode',
        value: [prodCode],
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterWhereClause> prodCodeNotEqualTo(
      String? prodCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prodCode',
              lower: [],
              upper: [prodCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prodCode',
              lower: [prodCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prodCode',
              lower: [prodCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prodCode',
              lower: [],
              upper: [prodCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ProductDataQueryFilter
    on QueryBuilder<ProductData, ProductData, QFilterCondition> {
  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      catNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'catName',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      catNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'catName',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> catNameEqualTo(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      catNameGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> catNameLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> catNameBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      catNameStartsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> catNameEndsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> catNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'catName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> catNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'catName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      catNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      catNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'catName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> codeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codeId',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codeId',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> codeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeIdGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> codeIdLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> codeIdBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codeThumbnail',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codeThumbnail',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailEqualTo(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailStartsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailEndsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codeThumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codeThumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codeThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      codeThumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codeThumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prodCode',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prodCode',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> prodCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> prodCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prodCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prodCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> prodCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prodCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prodCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prodCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prodName',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prodName',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> prodNameEqualTo(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> prodNameBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameStartsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameEndsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> prodNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prodName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prodName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      prodNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prodName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      speNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speName',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      speNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speName',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> speNameEqualTo(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      speNameGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> speNameLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> speNameBetween(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      speNameStartsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> speNameEndsWith(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> speNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> speNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      speNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      speNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      styleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'styleId',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      styleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'styleId',
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> styleIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'styleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition>
      styleIdGreaterThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> styleIdLessThan(
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

  QueryBuilder<ProductData, ProductData, QAfterFilterCondition> styleIdBetween(
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
}

extension ProductDataQueryObject
    on QueryBuilder<ProductData, ProductData, QFilterCondition> {}

extension ProductDataQueryLinks
    on QueryBuilder<ProductData, ProductData, QFilterCondition> {}

extension ProductDataQuerySortBy
    on QueryBuilder<ProductData, ProductData, QSortBy> {
  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByCatName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catName', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByCatNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catName', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByCodeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeId', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByCodeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeId', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByCodeThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeThumbnail', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy>
      sortByCodeThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeThumbnail', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByProdCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodCode', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByProdCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodCode', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByProdName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodName', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByProdNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodName', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortBySpeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speName', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortBySpeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speName', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByStyleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleId', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> sortByStyleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleId', Sort.desc);
    });
  }
}

extension ProductDataQuerySortThenBy
    on QueryBuilder<ProductData, ProductData, QSortThenBy> {
  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByCatName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catName', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByCatNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catName', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByCodeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeId', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByCodeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeId', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByCodeThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeThumbnail', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy>
      thenByCodeThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codeThumbnail', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByProdCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodCode', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByProdCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodCode', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByProdName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodName', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByProdNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prodName', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenBySpeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speName', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenBySpeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speName', Sort.desc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByStyleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleId', Sort.asc);
    });
  }

  QueryBuilder<ProductData, ProductData, QAfterSortBy> thenByStyleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'styleId', Sort.desc);
    });
  }
}

extension ProductDataQueryWhereDistinct
    on QueryBuilder<ProductData, ProductData, QDistinct> {
  QueryBuilder<ProductData, ProductData, QDistinct> distinctByCatName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'catName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductData, ProductData, QDistinct> distinctByCodeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codeId');
    });
  }

  QueryBuilder<ProductData, ProductData, QDistinct> distinctByCodeThumbnail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codeThumbnail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductData, ProductData, QDistinct> distinctByProdCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prodCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductData, ProductData, QDistinct> distinctByProdName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prodName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductData, ProductData, QDistinct> distinctBySpeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductData, ProductData, QDistinct> distinctByStyleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'styleId');
    });
  }
}

extension ProductDataQueryProperty
    on QueryBuilder<ProductData, ProductData, QQueryProperty> {
  QueryBuilder<ProductData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductData, String?, QQueryOperations> catNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catName');
    });
  }

  QueryBuilder<ProductData, int?, QQueryOperations> codeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codeId');
    });
  }

  QueryBuilder<ProductData, String?, QQueryOperations> codeThumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codeThumbnail');
    });
  }

  QueryBuilder<ProductData, String?, QQueryOperations> prodCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prodCode');
    });
  }

  QueryBuilder<ProductData, String?, QQueryOperations> prodNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prodName');
    });
  }

  QueryBuilder<ProductData, String?, QQueryOperations> speNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speName');
    });
  }

  QueryBuilder<ProductData, int?, QQueryOperations> styleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'styleId');
    });
  }
}
