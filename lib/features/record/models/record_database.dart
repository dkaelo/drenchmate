import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/record.dart';

class RecordDatabase {
  static final CollectionReference recordsCollection =
      FirebaseFirestore.instance.collection('records');

  static Future<List<Record>> fetchRecords() async {
    final querySnapshot = await recordsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Record.fromFirestore(doc);
    }).toList();
  }

  static Future<void> addRecord(Record record) async {
    await recordsCollection.add(record.toFirestore());
  }

  static Future<void> updateRecord(String id, Record record) async {
    await recordsCollection.doc(id).update(record.toFirestore());
  }

  static Future<void> deleteRecord(String id) async {
    await recordsCollection.doc(id).delete();
  }
}
