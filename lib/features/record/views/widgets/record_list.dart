import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/record/models/record.dart';
import 'package:drenchmate/features/record/views/record_form.dart';

class RecordList extends StatelessWidget {
  const RecordList({super.key});

  void _confirmDelete(BuildContext context, Record record) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this record?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<RecordController>(context, listen: false).deleteRecord(record.id);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _editRecord(BuildContext context, Record record) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordForm(record: record),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recordController = Provider.of<RecordController>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Product Name')),
          DataColumn(label: Text('Date of Treatment')),
          DataColumn(label: Text('Number of Animals Treated')),
          DataColumn(label: Text('Mob ID')),
          DataColumn(label: Text('Animal Details')),
          DataColumn(label: Text('Active Ingredient')),
          DataColumn(label: Text('Treatment Rate')),
          DataColumn(label: Text('ESI')),
          DataColumn(label: Text('Withholding Period')),
          DataColumn(label: Text('Batch Number')),
          DataColumn(label: Text('Expiry Date')),
          DataColumn(label: Text('Person Administering')),
          DataColumn(label: Text('Actions')),
        ],
        rows: recordController.currentRecords.map((record) {
          return DataRow(cells: [
            DataCell(Text(record.productName)),
            DataCell(Text(record.dateOfTreatment.toLocal().toString().split(' ')[0])),
            DataCell(Text(record.numberOfAnimalsTreated.toString())),
            DataCell(Text(record.mobId)),
            DataCell(Text(record.animalDetails)),
            DataCell(Text(record.activeIngredient)),
            DataCell(Text(record.treatmentRate.toString())),
            DataCell(Text(record.esi.toString())),
            DataCell(Text(record.withholdingPeriod.toString())),
            DataCell(Text(record.batchNumber ?? '')),
            DataCell(Text(record.expiryDate?.toLocal().toString().split(' ')[0] ?? '')),
            DataCell(Text(record.personAdministering ?? '')),
            DataCell(Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editRecord(context, record),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _confirmDelete(context, record),
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}
