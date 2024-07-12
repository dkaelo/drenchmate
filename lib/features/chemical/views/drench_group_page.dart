import 'package:drenchmate/features/chemical/views/widgets/drench_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/drench_group_controller.dart';
import 'drench_group_form.dart';

class DrenchGroupPage extends StatefulWidget {
  const DrenchGroupPage({Key? key}) : super(key: key);

  @override
  _DrenchGroupPageState createState() => _DrenchGroupPageState();
}

class _DrenchGroupPageState extends State<DrenchGroupPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DrenchGroupController>(context, listen: false).fetchDrenchGroups();
  }

  void _addDrenchGroup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DrenchGroupForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drench Groups'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addDrenchGroup(context),
        child: const Icon(Icons.add),
      ),
      body: DrenchList(),
    );
  }
}
