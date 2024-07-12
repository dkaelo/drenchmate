import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/chemical_controller.dart';
import '../models/chemical.dart';

class ChemicalForm extends StatefulWidget {
  final Chemical? chemical;

  const ChemicalForm({super.key, this.chemical});

  @override
  _ChemicalFormState createState() => _ChemicalFormState();
}

class _ChemicalFormState extends State<ChemicalForm> {
  final _formKey = GlobalKey<FormState>();
  final chemicalNameController = TextEditingController();
  final activeIngredientController = TextEditingController();
  final esiController = TextEditingController();
  final withholdingPeriodController = TextEditingController();
  bool _isUniqueName = true;

  @override
  void initState() {
    super.initState();
    if (widget.chemical != null) {
      chemicalNameController.text = widget.chemical!.chemicalName;
      activeIngredientController.text = widget.chemical!.activeIngredient;
      esiController.text = widget.chemical!.esi.toString();
      withholdingPeriodController.text = widget.chemical!.withholdingPeriod.toString();
    }
  }

  @override
  void dispose() {
    chemicalNameController.dispose();
    activeIngredientController.dispose();
    esiController.dispose();
    withholdingPeriodController.dispose();
    super.dispose();
  }

  Future<bool> _checkUniqueName(String name) async {
    final chemicalController = Provider.of<ChemicalController>(context, listen: false);
    await chemicalController.fetchChemicals();
    return !chemicalController.currentChemicals.any((chemical) => chemical.chemicalName.toLowerCase() == name.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    final chemicalController = Provider.of<ChemicalController>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.chemical == null ? 'Add Chemical' : 'Edit Chemical')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: chemicalNameController,
                decoration: const InputDecoration(labelText: 'Chemical Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a chemical name';
                  }
                  if (!_isUniqueName) {
                    return 'Chemical name must be unique';
                  }
                  return null;
                },
                onChanged: (value) async {
                  if (widget.chemical == null || widget.chemical!.chemicalName.toLowerCase() != value.toLowerCase()) {
                    _isUniqueName = await _checkUniqueName(value);
                  } else {
                    _isUniqueName = true;
                  }
                  setState(() {});
                },
              ),
              TextFormField(
                controller: activeIngredientController,
                decoration: const InputDecoration(labelText: 'Active Ingredient'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an active ingredient';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: esiController,
                decoration: const InputDecoration(labelText: 'ESI (days)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ESI in days';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: withholdingPeriodController,
                decoration: const InputDecoration(labelText: 'Withholding Period (days)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the withholding period in days';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newChemical = Chemical(
                      id: widget.chemical?.id ?? '',
                      chemicalName: chemicalNameController.text,
                      activeIngredient: activeIngredientController.text,
                      esi: int.parse(esiController.text),
                      withholdingPeriod: int.parse(withholdingPeriodController.text),
                    );

                    if (widget.chemical == null) {
                      chemicalController.addChemical(newChemical);
                    } else {
                      chemicalController.updateChemical(newChemical.id, newChemical);
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text(widget.chemical == null ? 'Add Chemical' : 'Update Chemical'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
