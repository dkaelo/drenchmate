import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/drench_group.dart';

class DrenchGroupDatabase {
  static final CollectionReference drenchGroupCollection =
      FirebaseFirestore.instance.collection('drench_groups');

  static Future<List<DrenchGroup>> fetchDrenchGroups() async {
    final querySnapshot = await drenchGroupCollection.get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return DrenchGroup.fromMap(data, doc.id);
    }).toList();
  }

  static Future<void> addDrenchGroup(DrenchGroup group) async {
    await drenchGroupCollection.add(group.toFirestore());
  }

  static Future<void> updateDrenchGroup(String id, DrenchGroup group) async {
    await drenchGroupCollection.doc(id).update(group.toFirestore());
  }

  static Future<void> deleteDrenchGroup(String id) async {
    await drenchGroupCollection.doc(id).delete();
  }
}
