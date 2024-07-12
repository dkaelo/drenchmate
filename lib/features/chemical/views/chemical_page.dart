import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/chemical_controller.dart';
import 'chemical_form.dart';
import '../views/widgets/chemical_list.dart';

class ChemicalPage extends StatefulWidget {
  const ChemicalPage({super.key});

  @override
  _ChemicalPageState createState() => _ChemicalPageState();
}

class _ChemicalPageState extends State<ChemicalPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChemicalController>(context, listen: false).fetchChemicals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChemicalForm()),
        ),
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ChemicalList(),
      ),
    );
  }
}
