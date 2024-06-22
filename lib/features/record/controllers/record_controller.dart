import 'package:flutter/material.dart';
import 'package:drenchmate/features/record/models/record_database.dart';
import 'package:drenchmate/features/record/models/record.dart';

class RecordController extends ChangeNotifier {
  List<Record> currentRecords = [];

  void fetchRecords() async {
    currentRecords = await RecordDatabase.fetchRecords();
    notifyListeners();
  }

  void addRecord(Record record) async {
    await RecordDatabase.addRecord(record);
    fetchRecords();
  }

  void updateRecord(int id, Record record) async {
    await RecordDatabase.updateRecord(id, record);
    fetchRecords();
  }

  void deleteRecord(int id) async {
    await RecordDatabase.deleteRecord(id);
    fetchRecords();
  }
}
