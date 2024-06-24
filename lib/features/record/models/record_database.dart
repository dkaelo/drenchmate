import 'package:isar/isar.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:drenchmate/features/record/models/record.dart';
import 'package:file_picker/file_picker.dart';
import 'package:drenchmate/services/database_service.dart';

class RecordDatabase {
  static Future<List<Record>> fetchRecords() async {
    return await DatabaseService.isar.records.where().findAll();
  }

  static Future<void> addRecord(Record record) async {
    await DatabaseService.isar.writeTxn(() async {
      await DatabaseService.isar.records.put(record);
    });
  }

  static Future<void> updateRecord(int id, Record record) async {
    final existingRecord = await DatabaseService.isar.records.get(id);
    if (existingRecord != null) {
      existingRecord
        ..dateOfTreatment = record.dateOfTreatment
        ..numberOfAnimalsTreated = record.numberOfAnimalsTreated
        ..mobId = record.mobId
        ..animalDetails = record.animalDetails
        ..productName = record.productName
        ..activeIngredient = record.activeIngredient
        ..treatmentRate = record.treatmentRate
        ..esi = record.esi
        ..withholdingPeriod = record.withholdingPeriod
        ..batchNumber = record.batchNumber
        ..expiryDate = record.expiryDate
        ..personAdministering = record.personAdministering;

      await DatabaseService.isar.writeTxn(() => DatabaseService.isar.records.put(existingRecord));
    }
  }

  static Future<void> deleteRecord(int id) async {
    await DatabaseService.isar.writeTxn(() => DatabaseService.isar.records.delete(id));
  }

  static Future<void> exportRecordsToCSV(List<Record> records) async {
    // Convert records to CSV format
    List<List<dynamic>> csvData = [
      ['Date of Treatment', 'Number of Animals Treated', 'Mob ID', 'Animal Details', 'Product Name', 'Active Ingredient', 'Treatment Rate', 'ESI', 'Withholding Period', 'Batch Number', 'Expiry Date', 'Person Administering']
    ];
    csvData.addAll(records.map((record) => [
      record.dateOfTreatment,
      record.numberOfAnimalsTreated,
      record.mobId,
      record.animalDetails,
      record.productName,
      record.activeIngredient,
      record.treatmentRate,
      record.esi,
      record.withholdingPeriod,
      record.batchNumber,
      record.expiryDate,
      record.personAdministering,
    ]));

    // Allow the user to choose the directory to save the file
    String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath != null) {
      String filePath = '$directoryPath/records.csv';

      // Write CSV data to file
      final csvFile = File(filePath);
      try {
        await csvFile.writeAsString(const ListToCsvConverter().convert(csvData));
        print('Export completed. File saved to: $filePath');
      } catch (e) {
        print('Error writing CSV file: $e');
      }
    } else {
      print('Export canceled. No directory selected.');
    }
  }

  static Future<void> exportRecordsToTxt(List<Record> records) async {
    // Prepare the text content
    StringBuffer txtContent = StringBuffer();
    txtContent.writeln('Date of Treatment\tNumber of Animals Treated\tMob ID\tAnimal Details\tProduct Name\tActive Ingredient\tTreatment Rate\tESI\tWithholding Period\tBatch Number\tExpiry Date\tPerson Administering');
    for (var record in records) {
      txtContent.writeln('${record.dateOfTreatment}\t${record.numberOfAnimalsTreated}\t${record.mobId}\t${record.animalDetails}\t${record.productName}\t${record.activeIngredient}\t${record.treatmentRate}\t${record.esi}\t${record.withholdingPeriod}\t${record.batchNumber}\t${record.expiryDate}\t${record.personAdministering}');
    }

    // Allow the user to choose the directory to save the file
    String? directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath != null) {
      String filePath = '$directoryPath/records.txt';

      // Write text content to file
      final txtFile = File(filePath);
      try {
        await txtFile.writeAsString(txtContent.toString());
        print('Export completed. File saved to: $filePath');
      } catch (e) {
        print('Error writing TXT file: $e');
      }
    } else {
      print('Export canceled. No directory selected.');
    }
  }
}
