import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';

class RecordList extends StatelessWidget {
  const RecordList({super.key});

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
          ]);
        }).toList(),
      ),
    );
  }
}
