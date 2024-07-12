import 'package:drenchmate/features/chemical/controllers/drench_group_controller.dart';
import 'package:drenchmate/features/chemical/models/drench_group.dart';
import 'package:drenchmate/features/chemical/views/drench_group_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrenchList extends StatelessWidget {
  const DrenchList({Key? key}) : super(key: key);

  void _confirmDelete(BuildContext context, DrenchGroup drenchGroup) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this drench group?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<DrenchGroupController>(context, listen: false)
                  .deleteDrenchGroup(drenchGroup.id);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _editDrenchGroup(BuildContext context, DrenchGroup drenchGroup) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrenchGroupForm(drenchGroup: drenchGroup),
      ),
    );
  }

  void _showMoreOptions(BuildContext context, DrenchGroup drenchGroup, Offset offset) async {
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy,
        offset.dx + 50.0, // Adjust width as needed
        offset.dy + 50.0, // Adjust height as needed
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
        _editDrenchGroup(context, drenchGroup);
      } else if (result == 'delete') {
        _confirmDelete(context, drenchGroup);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final drenchGroupController = Provider.of<DrenchGroupController>(context);

    return ListView.builder(
      itemCount: drenchGroupController.drenchGroups.length,
      itemBuilder: (context, index) {
        final drenchGroup = drenchGroupController.drenchGroups[index];
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
                      drenchGroup.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            final RenderBox button = context.findRenderObject() as RenderBox;
                            final Offset offset = button.localToGlobal(Offset.zero);
                            _showMoreOptions(context, drenchGroup, offset);
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: drenchGroup.chemicals.map((chemical) {
                    return Text(
                      'Chemical: ${chemical.chemicalName}, Active Ingredient: ${chemical.activeIngredient}, ESI: ${chemical.esi} days, Withholding Period: ${chemical.withholdingPeriod} days',
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
