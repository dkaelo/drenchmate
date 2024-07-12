import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drenchmate/features/chemical/models/drench_group.dart';
import 'package:flutter/material.dart';
import '../models/record.dart';

class RecordController extends ChangeNotifier {
  List<Record> currentRecords = [];
  List<DrenchGroup> drenchGroups = [];

  Future<void> fetchRecords() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('records').get();
      currentRecords = snapshot.docs.map((doc) => Record.fromFirestore(doc)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching records: $e');
    }
  }

  Future<void> fetchDrenchGroups() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('drench_groups').get();
      drenchGroups = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?;
        if (data == null) {
          throw Exception('Data is null');
        }
        return DrenchGroup.fromMap(data, doc.id);
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching drench groups: $e');
    }
  }

  Future<void> addRecord(Record record) async {
    await FirebaseFirestore.instance.collection('records').add(record.toFirestore());
    fetchRecords();
  }

  Future<void> updateRecord(String id, Record record) async {
    await FirebaseFirestore.instance.collection('records').doc(id).update(record.toFirestore());
    fetchRecords();
  }

  Future<void> deleteRecord(String id) async {
    await FirebaseFirestore.instance.collection('records').doc(id).delete();
    fetchRecords();
  }
}
