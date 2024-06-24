import 'package:isar/isar.dart';
import 'package:drenchmate/services/database_service.dart';
import 'chemical.dart';

class ChemicalDatabase {
  static Future<List<Chemical>> fetchChemicals() async {
    return await DatabaseService.isar.chemicals.where().findAll();
  }

  static Future<void> addChemical(Chemical chemical) async {
    await DatabaseService.isar.writeTxn(() async {
      await DatabaseService.isar.chemicals.put(chemical);
    });
  }

  static Future<void> updateChemical(int id, Chemical chemical) async {
    final existingChemical = await DatabaseService.isar.chemicals.get(id);
    if (existingChemical != null) {
      existingChemical
        ..chemicalName = chemical.chemicalName
        ..exterminator = chemical.exterminator
        ..activeIngredient = chemical.activeIngredient
        ..esi = chemical.esi
        ..withholdingPeriod = chemical.withholdingPeriod;

      await DatabaseService.isar.writeTxn(() => DatabaseService.isar.chemicals.put(existingChemical));
    }
  }

  static Future<void> deleteChemical(int id) async {
    await DatabaseService.isar.writeTxn(() => DatabaseService.isar.chemicals.delete(id));
  }
}
