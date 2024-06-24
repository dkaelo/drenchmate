import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/chemical/controllers/chemical_controller.dart';
import 'package:drenchmate/features/user/controllers/user_controller.dart';
import 'package:drenchmate/features/record/models/record.dart';
import 'package:drenchmate/features/chemical/models/chemical.dart';

class RecordForm extends StatefulWidget {
  final Record? record;

  const RecordForm({super.key, this.record});

  @override
  _RecordFormState createState() => _RecordFormState();
}

class _RecordFormState extends State<RecordForm> {
  final _formKey = GlobalKey<FormState>();
  final dateOfTreatmentController = TextEditingController();
  final numberOfAnimalsTreatedController = TextEditingController();
  final mobIdController = TextEditingController();
  final animalDetailsController = TextEditingController();
  final productNameController = TextEditingController();
  final activeIngredientController = TextEditingController();
  final treatmentRateController = TextEditingController();
  final esiController = TextEditingController();
  final withholdingPeriodController = TextEditingController();
  final batchNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final personAdministeringController = TextEditingController();

  Chemical? _selectedChemical;

  @override
  void initState() {
    super.initState();
    final chemicalController = Provider.of<ChemicalController>(context, listen: false);
    chemicalController.fetchChemicals();

    final userController = Provider.of<UserController>(context, listen: false);
    personAdministeringController.text = userController.username ?? '';

    if (widget.record != null) {
      dateOfTreatmentController.text = widget.record!.dateOfTreatment.toLocal().toString().split('T')[0];
      numberOfAnimalsTreatedController.text = widget.record!.numberOfAnimalsTreated.toString();
      mobIdController.text = widget.record!.mobId;
      animalDetailsController.text = widget.record!.animalDetails;
      productNameController.text = widget.record!.productName;
      activeIngredientController.text = widget.record!.activeIngredient;
      treatmentRateController.text = widget.record!.treatmentRate.toString();
      esiController.text = widget.record!.esi.toString();
      withholdingPeriodController.text = widget.record!.withholdingPeriod.toString();
      batchNumberController.text = widget.record!.batchNumber ?? '';
      expiryDateController.text = widget.record!.expiryDate?.toLocal().toString().split('T')[0] ?? '';
      personAdministeringController.text = widget.record!.personAdministering ?? userController.username ?? '';
    }
  }

  @override
  void dispose() {
    dateOfTreatmentController.dispose();
    numberOfAnimalsTreatedController.dispose();
    mobIdController.dispose();
    animalDetailsController.dispose();
    productNameController.dispose();
    activeIngredientController.dispose();
    treatmentRateController.dispose();
    esiController.dispose();
    withholdingPeriodController.dispose();
    batchNumberController.dispose();
    expiryDateController.dispose();
    personAdministeringController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toIso8601String().split('T')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final recordController = Provider.of<RecordController>(context);
    final chemicalController = Provider.of<ChemicalController>(context);
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.record == null ? 'Create Record' : 'Edit Record')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: dateOfTreatmentController,
                decoration: InputDecoration(
                  labelText: 'Date of Treatment',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, dateOfTreatmentController),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: numberOfAnimalsTreatedController,
                decoration: const InputDecoration(labelText: 'Number of Animals Treated'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of animals treated';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: mobIdController,
                decoration: const InputDecoration(labelText: 'Mob ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the mob ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: animalDetailsController,
                decoration: const InputDecoration(labelText: 'Animal Details'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the animal details';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<Chemical>(
                decoration: const InputDecoration(labelText: 'Product Name'),
                items: chemicalController.currentChemicals.map((Chemical chemical) {
                  return DropdownMenuItem<Chemical>(
                    value: chemical,
                    child: Text(chemical.chemicalName),
                  );
                }).toList(),
                onChanged: (Chemical? newValue) {
                  setState(() {
                    _selectedChemical = newValue;
                    if (newValue != null) {
                      productNameController.text = newValue.chemicalName;
                      activeIngredientController.text = newValue.activeIngredient;
                      esiController.text = newValue.esi.toString();
                      withholdingPeriodController.text = newValue.withholdingPeriod.toString();
                    }
                  });
                },
                value: _selectedChemical,
              ),
              TextFormField(
                controller: activeIngredientController,
                decoration: const InputDecoration(labelText: 'Active Ingredient'),
                readOnly: true,
              ),
              TextFormField(
                controller: treatmentRateController,
                decoration: const InputDecoration(labelText: 'Treatment Rate'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the treatment rate';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: esiController,
                decoration: const InputDecoration(labelText: 'ESI'),
                readOnly: true,
              ),
              TextFormField(
                controller: withholdingPeriodController,
                decoration: const InputDecoration(labelText: 'Withholding Period'),
                readOnly: true,
              ),
              TextFormField(
                controller: batchNumberController,
                decoration: const InputDecoration(labelText: 'Batch Number'),
              ),
              TextFormField(
                controller: expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, expiryDateController),
                  ),
                ),
              ),
              TextFormField(
                controller: personAdministeringController,
                decoration: const InputDecoration(labelText: 'Person Administering'),
                readOnly: true,
                enabled: false,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newRecord = Record()
                      ..dateOfTreatment = DateTime.parse(dateOfTreatmentController.text)
                      ..numberOfAnimalsTreated = int.parse(numberOfAnimalsTreatedController.text)
                      ..mobId = mobIdController.text
                      ..animalDetails = animalDetailsController.text
                      ..productName = productNameController.text
                      ..activeIngredient = activeIngredientController.text
                      ..treatmentRate = double.parse(treatmentRateController.text)
                      ..esi = int.parse(esiController.text)
                      ..withholdingPeriod = int.parse(withholdingPeriodController.text)
                      ..batchNumber = batchNumberController.text.isNotEmpty ? batchNumberController.text : null
                      ..expiryDate = expiryDateController.text.isNotEmpty ? DateTime.parse(expiryDateController.text) : null
                      ..personAdministering = personAdministeringController.text;

                    if (widget.record == null) {
                      recordController.addRecord(newRecord);
                    } else {
                      recordController.updateRecord(widget.record!.id, newRecord);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.record == null ? 'Create Record' : 'Update Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
