import 'package:isar/isar.dart';

part 'chemical.g.dart'; // This is crucial for Isar code generation

@Collection()
class Chemical {
  Id id = Isar.autoIncrement;

  late String chemicalName;
  late String exterminator;
  late String activeIngredient;
  late int esi; // Export Slaughter Interval in days
  late int withholdingPeriod; // Withholding period for domestic slaughter in days
}
