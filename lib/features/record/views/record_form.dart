import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate/features/record/controllers/record_controller.dart';
import 'package:drenchmate/features/record/models/record.dart';

class RecordForm extends StatefulWidget {
  const RecordForm({super.key});

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

    return Scaffold(
      appBar: AppBar(title: const Text('Create Record')),
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
              TextFormField(
                controller: productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: activeIngredientController,
                decoration: const InputDecoration(labelText: 'Active Ingredient'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the active ingredient';
                  }
                  return null;
                },
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
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ESI';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: withholdingPeriodController,
                decoration: const InputDecoration(labelText: 'Withholding Period'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the withholding period';
                  }
                  return null;
                },
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
                      ..personAdministering = personAdministeringController.text.isNotEmpty ? personAdministeringController.text : null;

                    recordController.addRecord(newRecord);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Create Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
