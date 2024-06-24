// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chemical.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChemicalCollection on Isar {
  IsarCollection<Chemical> get chemicals => this.collection();
}

const ChemicalSchema = CollectionSchema(
  name: r'Chemical',
  id: -3455160655491003666,
  properties: {
    r'activeIngredient': PropertySchema(
      id: 0,
      name: r'activeIngredient',
      type: IsarType.string,
    ),
    r'chemicalName': PropertySchema(
      id: 1,
      name: r'chemicalName',
      type: IsarType.string,
    ),
    r'esi': PropertySchema(
      id: 2,
      name: r'esi',
      type: IsarType.long,
    ),
    r'exterminator': PropertySchema(
      id: 3,
      name: r'exterminator',
      type: IsarType.string,
    ),
    r'withholdingPeriod': PropertySchema(
      id: 4,
      name: r'withholdingPeriod',
      type: IsarType.long,
    )
  },
  estimateSize: _chemicalEstimateSize,
  serialize: _chemicalSerialize,
  deserialize: _chemicalDeserialize,
  deserializeProp: _chemicalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chemicalGetId,
  getLinks: _chemicalGetLinks,
  attach: _chemicalAttach,
  version: '3.1.0+1',
);

int _chemicalEstimateSize(
  Chemical object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeIngredient.length * 3;
  bytesCount += 3 + object.chemicalName.length * 3;
  bytesCount += 3 + object.exterminator.length * 3;
  return bytesCount;
}

void _chemicalSerialize(
  Chemical object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeIngredient);
  writer.writeString(offsets[1], object.chemicalName);
  writer.writeLong(offsets[2], object.esi);
  writer.writeString(offsets[3], object.exterminator);
  writer.writeLong(offsets[4], object.withholdingPeriod);
}

Chemical _chemicalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Chemical();
  object.activeIngredient = reader.readString(offsets[0]);
  object.chemicalName = reader.readString(offsets[1]);
  object.esi = reader.readLong(offsets[2]);
  object.exterminator = reader.readString(offsets[3]);
  object.id = id;
  object.withholdingPeriod = reader.readLong(offsets[4]);
  return object;
}

P _chemicalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chemicalGetId(Chemical object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chemicalGetLinks(Chemical object) {
  return [];
}

void _chemicalAttach(IsarCollection<dynamic> col, Id id, Chemical object) {
  object.id = id;
}

extension ChemicalQueryWhereSort on QueryBuilder<Chemical, Chemical, QWhere> {
  QueryBuilder<Chemical, Chemical, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChemicalQueryWhere on QueryBuilder<Chemical, Chemical, QWhereClause> {
  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idBetween(
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

extension ChemicalQueryFilter
    on QueryBuilder<Chemical, Chemical, QFilterCondition> {
  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeIngredient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeIngredient',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      activeIngredientIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemicalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemicalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemicalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chemicalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chemicalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chemicalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chemicalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalName',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chemicalName',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> esiEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esi',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> esiGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'esi',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> esiLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'esi',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> esiBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'esi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> exterminatorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exterminator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      exterminatorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exterminator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> exterminatorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exterminator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> exterminatorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exterminator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      exterminatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exterminator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> exterminatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exterminator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> exterminatorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exterminator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> exterminatorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exterminator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      exterminatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exterminator',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      exterminatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exterminator',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      withholdingPeriodEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withholdingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      withholdingPeriodGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'withholdingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      withholdingPeriodLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'withholdingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      withholdingPeriodBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'withholdingPeriod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChemicalQueryObject
    on QueryBuilder<Chemical, Chemical, QFilterCondition> {}

extension ChemicalQueryLinks
    on QueryBuilder<Chemical, Chemical, QFilterCondition> {}

extension ChemicalQuerySortBy on QueryBuilder<Chemical, Chemical, QSortBy> {
  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByActiveIngredient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByActiveIngredientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalName', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalName', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByEsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByEsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByExterminator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exterminator', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByExterminatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exterminator', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByWithholdingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByWithholdingPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.desc);
    });
  }
}

extension ChemicalQuerySortThenBy
    on QueryBuilder<Chemical, Chemical, QSortThenBy> {
  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByActiveIngredient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByActiveIngredientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalName', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalName', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByEsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByEsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByExterminator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exterminator', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByExterminatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exterminator', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByWithholdingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByWithholdingPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.desc);
    });
  }
}

extension ChemicalQueryWhereDistinct
    on QueryBuilder<Chemical, Chemical, QDistinct> {
  QueryBuilder<Chemical, Chemical, QDistinct> distinctByActiveIngredient(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeIngredient',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByChemicalName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chemicalName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByEsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esi');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByExterminator(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exterminator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByWithholdingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'withholdingPeriod');
    });
  }
}

extension ChemicalQueryProperty
    on QueryBuilder<Chemical, Chemical, QQueryProperty> {
  QueryBuilder<Chemical, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Chemical, String, QQueryOperations> activeIngredientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeIngredient');
    });
  }

  QueryBuilder<Chemical, String, QQueryOperations> chemicalNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalName');
    });
  }

  QueryBuilder<Chemical, int, QQueryOperations> esiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esi');
    });
  }

  QueryBuilder<Chemical, String, QQueryOperations> exterminatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exterminator');
    });
  }

  QueryBuilder<Chemical, int, QQueryOperations> withholdingPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'withholdingPeriod');
    });
  }
}
