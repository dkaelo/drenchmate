import 'package:cloud_firestore/cloud_firestore.dart';
import 'chemical.dart';

class ChemicalDatabase {
  static final CollectionReference chemicalsCollection =
      FirebaseFirestore.instance.collection('chemicals');

  static Future<List<Chemical>> fetchChemicals() async {
    final querySnapshot = await chemicalsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Chemical.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  static Future<void> addChemical(Chemical chemical) async {
    await chemicalsCollection.add(chemical.toFirestore());
  }

  static Future<void> updateChemical(String id, Chemical chemical) async {
    await chemicalsCollection.doc(id).update(chemical.toFirestore());
  }

  static Future<void> deleteChemical(String id) async {
    await chemicalsCollection.doc(id).delete();
  }
}
