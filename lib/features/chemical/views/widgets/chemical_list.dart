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
        builder: (context) => ChemicalForm(chemical: chemical),
      ),
    );
  }

  void _showMoreOptions(BuildContext context, Chemical chemical, Offset offset) async {
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        offset.dx + 50.0,
        offset.dy + 50.0,
      ),
      items: [
        PopupMenuItem(
          value: 'edit',
          child: Row(
            children: const [
              Icon(Icons.edit),
              SizedBox(width: 8),
              Text('Edit'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: const [
              Icon(Icons.delete),
              SizedBox(width: 8),
              Text('Delete'),
            ],
          ),
        ),
      ],
    );

    if (result != null) {
      if (result == 'edit') {
        _editChemical(context, chemical);
      } else if (result == 'delete') {
        _confirmDelete(context, chemical);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final chemicalController = Provider.of<ChemicalController>(context);

    return ListView.builder(
      itemCount: chemicalController.currentChemicals.length,
      itemBuilder: (context, index) {
        final chemical = chemicalController.currentChemicals[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chemical.chemicalName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            final RenderBox button = context.findRenderObject() as RenderBox;
                            final Offset offset = button.localToGlobal(Offset.zero);
                            _showMoreOptions(context, chemical, offset);
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Active Ingredient: ${chemical.activeIngredient}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'ESI: ${chemical.esi} days',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Withholding Period: ${chemical.withholdingPeriod} days',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
