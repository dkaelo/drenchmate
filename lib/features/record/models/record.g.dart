// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecordCollection on Isar {
  IsarCollection<Record> get records => this.collection();
}

const RecordSchema = CollectionSchema(
  name: r'Record',
  id: -5560585825827271694,
  properties: {
    r'activeIngredient': PropertySchema(
      id: 0,
      name: r'activeIngredient',
      type: IsarType.string,
    ),
    r'animalDetails': PropertySchema(
      id: 1,
      name: r'animalDetails',
      type: IsarType.string,
    ),
    r'batchNumber': PropertySchema(
      id: 2,
      name: r'batchNumber',
      type: IsarType.string,
    ),
    r'dateOfTreatment': PropertySchema(
      id: 3,
      name: r'dateOfTreatment',
      type: IsarType.dateTime,
    ),
    r'esi': PropertySchema(
      id: 4,
      name: r'esi',
      type: IsarType.long,
    ),
    r'expiryDate': PropertySchema(
      id: 5,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'mobId': PropertySchema(
      id: 6,
      name: r'mobId',
      type: IsarType.string,
    ),
    r'numberOfAnimalsTreated': PropertySchema(
      id: 7,
      name: r'numberOfAnimalsTreated',
      type: IsarType.long,
    ),
    r'personAdministering': PropertySchema(
      id: 8,
      name: r'personAdministering',
      type: IsarType.string,
    ),
    r'productName': PropertySchema(
      id: 9,
      name: r'productName',
      type: IsarType.string,
    ),
    r'treatmentRate': PropertySchema(
      id: 10,
      name: r'treatmentRate',
      type: IsarType.double,
    ),
    r'withholdingPeriod': PropertySchema(
      id: 11,
      name: r'withholdingPeriod',
      type: IsarType.long,
    )
  },
  estimateSize: _recordEstimateSize,
  serialize: _recordSerialize,
  deserialize: _recordDeserialize,
  deserializeProp: _recordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recordGetId,
  getLinks: _recordGetLinks,
  attach: _recordAttach,
  version: '3.1.0+1',
);

int _recordEstimateSize(
  Record object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeIngredient.length * 3;
  bytesCount += 3 + object.animalDetails.length * 3;
  {
    final value = object.batchNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mobId.length * 3;
  {
    final value = object.personAdministering;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.productName.length * 3;
  return bytesCount;
}

void _recordSerialize(
  Record object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeIngredient);
  writer.writeString(offsets[1], object.animalDetails);
  writer.writeString(offsets[2], object.batchNumber);
  writer.writeDateTime(offsets[3], object.dateOfTreatment);
  writer.writeLong(offsets[4], object.esi);
  writer.writeDateTime(offsets[5], object.expiryDate);
  writer.writeString(offsets[6], object.mobId);
  writer.writeLong(offsets[7], object.numberOfAnimalsTreated);
  writer.writeString(offsets[8], object.personAdministering);
  writer.writeString(offsets[9], object.productName);
  writer.writeDouble(offsets[10], object.treatmentRate);
  writer.writeLong(offsets[11], object.withholdingPeriod);
}

Record _recordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Record();
  object.activeIngredient = reader.readString(offsets[0]);
  object.animalDetails = reader.readString(offsets[1]);
  object.batchNumber = reader.readStringOrNull(offsets[2]);
  object.dateOfTreatment = reader.readDateTime(offsets[3]);
  object.esi = reader.readLong(offsets[4]);
  object.expiryDate = reader.readDateTimeOrNull(offsets[5]);
  object.id = id;
  object.mobId = reader.readString(offsets[6]);
  object.numberOfAnimalsTreated = reader.readLong(offsets[7]);
  object.personAdministering = reader.readStringOrNull(offsets[8]);
  object.productName = reader.readString(offsets[9]);
  object.treatmentRate = reader.readDouble(offsets[10]);
  object.withholdingPeriod = reader.readLong(offsets[11]);
  return object;
}

P _recordDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recordGetId(Record object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recordGetLinks(Record object) {
  return [];
}

void _recordAttach(IsarCollection<dynamic> col, Id id, Record object) {
  object.id = id;
}

extension RecordQueryWhereSort on QueryBuilder<Record, Record, QWhere> {
  QueryBuilder<Record, Record, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecordQueryWhere on QueryBuilder<Record, Record, QWhereClause> {
  QueryBuilder<Record, Record, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Record, Record, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Record, Record, QAfterWhereClause> idBetween(
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

extension RecordQueryFilter on QueryBuilder<Record, Record, QFilterCondition> {
  QueryBuilder<Record, Record, QAfterFilterCondition> activeIngredientEqualTo(
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

  QueryBuilder<Record, Record, QAfterFilterCondition>
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

  QueryBuilder<Record, Record, QAfterFilterCondition> activeIngredientLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> activeIngredientBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition>
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

  QueryBuilder<Record, Record, QAfterFilterCondition> activeIngredientEndsWith(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> activeIngredientContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> activeIngredientMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeIngredient',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      activeIngredientIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      activeIngredientIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animalDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'animalDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'animalDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'animalDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'animalDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'animalDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'animalDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'animalDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> animalDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animalDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      animalDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'animalDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchNumber',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchNumber',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> batchNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateOfTreatmentEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfTreatment',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      dateOfTreatmentGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateOfTreatment',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateOfTreatmentLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateOfTreatment',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> dateOfTreatmentBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateOfTreatment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> esiEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'esi',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> esiGreaterThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> esiLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> esiBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> expiryDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mobId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mobId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mobId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobId',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> mobIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mobId',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      numberOfAnimalsTreatedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfAnimalsTreated',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      numberOfAnimalsTreatedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfAnimalsTreated',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      numberOfAnimalsTreatedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfAnimalsTreated',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      numberOfAnimalsTreatedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfAnimalsTreated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'personAdministering',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'personAdministering',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personAdministering',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'personAdministering',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'personAdministering',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'personAdministering',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'personAdministering',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'personAdministering',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'personAdministering',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'personAdministering',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personAdministering',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
      personAdministeringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'personAdministering',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> treatmentRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'treatmentRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> treatmentRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'treatmentRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> treatmentRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'treatmentRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> treatmentRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'treatmentRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition> withholdingPeriodEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withholdingPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<Record, Record, QAfterFilterCondition>
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

  QueryBuilder<Record, Record, QAfterFilterCondition> withholdingPeriodLessThan(
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

  QueryBuilder<Record, Record, QAfterFilterCondition> withholdingPeriodBetween(
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

extension RecordQueryObject on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQueryLinks on QueryBuilder<Record, Record, QFilterCondition> {}

extension RecordQuerySortBy on QueryBuilder<Record, Record, QSortBy> {
  QueryBuilder<Record, Record, QAfterSortBy> sortByActiveIngredient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByActiveIngredientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByAnimalDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDetails', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByAnimalDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDetails', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDateOfTreatment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfTreatment', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByDateOfTreatmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfTreatment', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByEsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByEsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByMobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobId', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByMobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobId', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByNumberOfAnimalsTreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfAnimalsTreated', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      sortByNumberOfAnimalsTreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfAnimalsTreated', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByPersonAdministering() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personAdministering', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByPersonAdministeringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personAdministering', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByTreatmentRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentRate', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByTreatmentRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentRate', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByWithholdingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> sortByWithholdingPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.desc);
    });
  }
}

extension RecordQuerySortThenBy on QueryBuilder<Record, Record, QSortThenBy> {
  QueryBuilder<Record, Record, QAfterSortBy> thenByActiveIngredient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByActiveIngredientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByAnimalDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDetails', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByAnimalDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDetails', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDateOfTreatment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfTreatment', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByDateOfTreatmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfTreatment', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByEsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByEsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'esi', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByMobId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobId', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByMobIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobId', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByNumberOfAnimalsTreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfAnimalsTreated', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy>
      thenByNumberOfAnimalsTreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfAnimalsTreated', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByPersonAdministering() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personAdministering', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByPersonAdministeringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personAdministering', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByTreatmentRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentRate', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByTreatmentRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentRate', Sort.desc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByWithholdingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.asc);
    });
  }

  QueryBuilder<Record, Record, QAfterSortBy> thenByWithholdingPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withholdingPeriod', Sort.desc);
    });
  }
}

extension RecordQueryWhereDistinct on QueryBuilder<Record, Record, QDistinct> {
  QueryBuilder<Record, Record, QDistinct> distinctByActiveIngredient(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeIngredient',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByAnimalDetails(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'animalDetails',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByBatchNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByDateOfTreatment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfTreatment');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByEsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'esi');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByMobId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mobId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByNumberOfAnimalsTreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberOfAnimalsTreated');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByPersonAdministering(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personAdministering',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByProductName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByTreatmentRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'treatmentRate');
    });
  }

  QueryBuilder<Record, Record, QDistinct> distinctByWithholdingPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'withholdingPeriod');
    });
  }
}

extension RecordQueryProperty on QueryBuilder<Record, Record, QQueryProperty> {
  QueryBuilder<Record, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> activeIngredientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeIngredient');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> animalDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'animalDetails');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations> batchNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNumber');
    });
  }

  QueryBuilder<Record, DateTime, QQueryOperations> dateOfTreatmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfTreatment');
    });
  }

  QueryBuilder<Record, int, QQueryOperations> esiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'esi');
    });
  }

  QueryBuilder<Record, DateTime?, QQueryOperations> expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> mobIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mobId');
    });
  }

  QueryBuilder<Record, int, QQueryOperations> numberOfAnimalsTreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberOfAnimalsTreated');
    });
  }

  QueryBuilder<Record, String?, QQueryOperations>
      personAdministeringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personAdministering');
    });
  }

  QueryBuilder<Record, String, QQueryOperations> productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<Record, double, QQueryOperations> treatmentRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'treatmentRate');
    });
  }

  QueryBuilder<Record, int, QQueryOperations> withholdingPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'withholdingPeriod');
    });
  }
}
