import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/drench_group.dart';
import '../models/chemical.dart';

class DrenchGroupController extends ChangeNotifier {
  List<DrenchGroup> drenchGroups = [];

  Future<void> fetchDrenchGroups() async {
    final snapshot = await FirebaseFirestore.instance.collection('drench_groups').get();
    drenchGroups = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return DrenchGroup.fromMap(data, doc.id);
    }).toList();
    notifyListeners();
  }

  Future<void> addDrenchGroup(DrenchGroup drenchGroup) async {
    await FirebaseFirestore.instance.collection('drench_groups').add(drenchGroup.toFirestore());
    await fetchDrenchGroups();
    await synchronizeChemicals(drenchGroup);
  }

  Future<void> updateDrenchGroup(String id, DrenchGroup drenchGroup) async {
    await FirebaseFirestore.instance.collection('drench_groups').doc(id).update(drenchGroup.toFirestore());
    await fetchDrenchGroups();
    await synchronizeChemicals(drenchGroup);
  }

  Future<void> deleteDrenchGroup(String id) async {
    await FirebaseFirestore.instance.collection('drench_groups').doc(id).delete();
    await fetchDrenchGroups();
  }

  Future<void> synchronizeChemicals(DrenchGroup drenchGroup) async {
    final chemicalsCollection = FirebaseFirestore.instance.collection('chemicals');
    for (var chemical in drenchGroup.chemicals) {
      final querySnapshot = await chemicalsCollection
          .where('chemicalName', isEqualTo: chemical.chemicalName)
          .where('activeIngredient', isEqualTo: chemical.activeIngredient)
          .get();

      if (querySnapshot.docs.isEmpty) {
        await chemicalsCollection.add(chemical.toFirestore());
      } else {
        // Optionally update the existing chemical if there are changes
        final existingChemicalDoc = querySnapshot.docs.first;
        await chemicalsCollection.doc(existingChemicalDoc.id).update(chemical.toFirestore());
      }
    }
  }
}
