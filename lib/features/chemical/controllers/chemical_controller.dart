import 'package:flutter/material.dart';
import '../models/chemical.dart';
import '../models/chemical_database.dart';

class ChemicalController extends ChangeNotifier {
  List<Chemical> currentChemicals = [];

  Future<void> fetchChemicals() async {
    currentChemicals = await ChemicalDatabase.fetchChemicals();
    notifyListeners();
  }

  void addChemical(Chemical chemical) async {
    await ChemicalDatabase.addChemical(chemical);
    fetchChemicals();
  }

  void updateChemical(int id, Chemical chemical) async {
    await ChemicalDatabase.updateChemical(id, chemical);
    fetchChemicals();
  }

  void deleteChemical(int id) async {
    await ChemicalDatabase.deleteChemical(id);
    fetchChemicals();
  }
}
