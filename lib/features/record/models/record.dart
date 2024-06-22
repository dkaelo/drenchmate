import 'package:isar/isar.dart';

// This line is needed to generate the file
// then run: dart run build_runner build

part 'record.g.dart'; // This is crucial for Isar code generation

@Collection()
class Record {
  Id id = Isar.autoIncrement;

  late DateTime dateOfTreatment;
  late int numberOfAnimalsTreated;
  late String mobId;
  late String animalDetails;
  late String productName;
  late String activeIngredient;
  late double treatmentRate;
  late int esi;
  late int withholdingPeriod;
  String? batchNumber;
  DateTime? expiryDate;
  String? personAdministering;
}
