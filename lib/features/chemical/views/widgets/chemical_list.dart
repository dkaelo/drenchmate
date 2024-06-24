import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/chemical/controllers/chemical_controller.dart';
import 'package:drenchmate/features/chemical/models/chemical.dart';
import 'package:drenchmate/features/chemical/views/chemical_form.dart';

class ChemicalList extends StatelessWidget {
  const ChemicalList({super.key});

  void _confirmDelete(BuildContext context, Chemical chemical) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this chemical?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<ChemicalController>(context, listen: false).deleteChemical(chemical.id);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _editChemical(BuildContext context, Chemical chemical) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChemicalForm(
          chemical: chemical,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chemicalController = Provider.of<ChemicalController>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Chemical Name')),
          DataColumn(label: Text('Exterminator')),
          DataColumn(label: Text('Active Ingredient')),
          DataColumn(label: Text('ESI')),
          DataColumn(label: Text('Withholding Period')),
          DataColumn(label: Text('Actions')),
        ],
        rows: chemicalController.currentChemicals.map((chemical) {
          return DataRow(cells: [
            DataCell(Text(chemical.chemicalName)),
            DataCell(Text(chemical.exterminator)),
            DataCell(Text(chemical.activeIngredient)),
            DataCell(Text(chemical.esi.toString())),
            DataCell(Text(chemical.withholdingPeriod.toString())),
            DataCell(Row(
              children: [
                FloatingActionButton(
                  heroTag: 'edit-${chemical.id}',
                  mini: true,
                  onPressed: () => _editChemical(context, chemical),
                  child: const Icon(Icons.edit, size: 16),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: 'delete-${chemical.id}',
                  mini: true,
                  onPressed: () => _confirmDelete(context, chemical),
                  child: const Icon(Icons.delete, size: 16),
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}
