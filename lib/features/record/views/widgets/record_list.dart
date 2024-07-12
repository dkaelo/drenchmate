import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/record/views/record_form.dart';
import 'package:drenchmate/features/record/models/record.dart';

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

  void _showMoreOptions(BuildContext context, Record record, Offset offset) async {
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
        _editRecord(context, record);
      } else if (result == 'delete') {
        _confirmDelete(context, record);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final recordController = Provider.of<RecordController>(context);

    return ListView.builder(
      itemCount: recordController.currentRecords.length,
      itemBuilder: (context, index) {
        final record = recordController.currentRecords[index];
        final activeIngredients = record.drenchGroup.chemicals
            .map((chemical) => chemical.activeIngredient)
            .join(', ');

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date of Treatment: ${record.dateOfTreatment.toLocal().toString().split(' ')[0]}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            final RenderBox button = context.findRenderObject() as RenderBox;
                            final Offset offset = button.localToGlobal(Offset.zero);
                            _showMoreOptions(context, record, offset);
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Number of Animals Treated: ${record.numberOfAnimalsTreated}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Mob ID: ${record.mobId}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Animal Details: ${record.animalDetails}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Drench Group: ${record.drenchGroup.name}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Active Ingredients: $activeIngredients',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Treatment Rate: ${record.treatmentRate}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Person Administering: ${record.personAdministering}',
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
