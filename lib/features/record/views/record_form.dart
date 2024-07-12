import 'package:drenchmate/features/chemical/controllers/drench_group_controller.dart';
import 'package:drenchmate/features/chemical/models/drench_group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/record_controller.dart';
import '../models/record.dart';
import '../../user/controllers/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordForm extends StatefulWidget {
  final Record? record;

  const RecordForm({Key? key, this.record}) : super(key: key);

  @override
  _RecordFormState createState() => _RecordFormState();
}

class _RecordFormState extends State<RecordForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateOfTreatmentController = TextEditingController();
  final _numberOfAnimalsTreatedController = TextEditingController();
  final _mobIdController = TextEditingController();
  final _animalDetailsController = TextEditingController();
  final _treatmentRateController = TextEditingController();
  final _personAdministeringController = TextEditingController();

  DrenchGroup? _selectedDrenchGroup;

  @override
  void initState() {
    super.initState();
    final userController = Provider.of<UserController>(context, listen: false);
    if (widget.record != null) {
      _dateOfTreatmentController.text = widget.record!.dateOfTreatment.toIso8601String().split('T').first;
      _numberOfAnimalsTreatedController.text = widget.record!.numberOfAnimalsTreated.toString();
      _mobIdController.text = widget.record!.mobId;
      _animalDetailsController.text = widget.record!.animalDetails;
      _treatmentRateController.text = widget.record!.treatmentRate.toString();
      _personAdministeringController.text = widget.record!.personAdministering;
      _selectedDrenchGroup = widget.record!.drenchGroup;
    } else {
      _fetchDisplayName(userController.username);
    }
    _fetchDrenchGroups();
  }

  Future<void> _fetchDisplayName(String? email) async {
    if (email != null) {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(email).get();
      if (userDoc.exists) {
        final userData = userDoc.data()!;
        setState(() {
          _personAdministeringController.text = userData['displayName'] as String;
        });
      }
    }
  }

  Future<void> _fetchDrenchGroups() async {
    final drenchGroupController = Provider.of<DrenchGroupController>(context, listen: false);
    await drenchGroupController.fetchDrenchGroups();
    if (_selectedDrenchGroup != null) {
      // Ensure the selected drench group is in the list of fetched groups
      if (!drenchGroupController.drenchGroups.contains(_selectedDrenchGroup)) {
        setState(() {
          _selectedDrenchGroup = null;
        });
      }
    }
    setState(() {}); // Force rebuild to update dropdown items
  }

  @override
  Widget build(BuildContext context) {
    final drenchGroupController = Provider.of<DrenchGroupController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Record'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateOfTreatmentController.text = pickedDate.toIso8601String().split('T').first;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateOfTreatmentController,
                    decoration: const InputDecoration(labelText: 'Date of Treatment'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date of treatment';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _numberOfAnimalsTreatedController,
                decoration: const InputDecoration(labelText: 'Number of Animals Treated'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of animals treated';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _mobIdController,
                decoration: const InputDecoration(labelText: 'Mob ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a mob ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<DrenchGroup>(
                value: _selectedDrenchGroup,
                decoration: const InputDecoration(labelText: 'Drench Group'),
                items: drenchGroupController.drenchGroups.map((drenchGroup) {
                  return DropdownMenuItem<DrenchGroup>(
                    value: drenchGroup,
                    child: Text(drenchGroup.name),
                  );
                }).toList(),
                onChanged: (DrenchGroup? newValue) {
                  setState(() {
                    _selectedDrenchGroup = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a drench group';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              if (_selectedDrenchGroup != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _selectedDrenchGroup!.chemicals.map((chemical) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        'Chemical: ${chemical.chemicalName}, Active Ingredient: ${chemical.activeIngredient}, ESI: ${chemical.esi} days, Withholding Period: ${chemical.withholdingPeriod} days',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _animalDetailsController,
                decoration: const InputDecoration(labelText: 'Animal Details'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter animal details';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _treatmentRateController,
                decoration: const InputDecoration(labelText: 'Treatment Rate'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the treatment rate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _personAdministeringController,
                decoration: const InputDecoration(labelText: 'Person Administering'),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the person administering';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newRecord = Record(
                      id: widget.record?.id ?? '',
                      dateOfTreatment: DateTime.parse(_dateOfTreatmentController.text),
                      numberOfAnimalsTreated: int.parse(_numberOfAnimalsTreatedController.text),
                      mobId: _mobIdController.text,
                      animalDetails: _animalDetailsController.text,
                      drenchGroup: _selectedDrenchGroup!,
                      treatmentRate: double.parse(_treatmentRateController.text),
                      personAdministering: _personAdministeringController.text,
                    );
                    final recordController = Provider.of<RecordController>(context, listen: false);
                    if (widget.record == null) {
                      recordController.addRecord(newRecord);
                    } else {
                      recordController.updateRecord(newRecord.id, newRecord);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.record == null ? 'Save Record' : 'Update Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
