import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/drench_group_controller.dart';
import '../controllers/chemical_controller.dart';
import '../models/drench_group.dart';
import '../models/chemical.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrenchGroupForm extends StatefulWidget {
  final DrenchGroup? drenchGroup;

  const DrenchGroupForm({super.key, this.drenchGroup});

  @override
  _DrenchGroupFormState createState() => _DrenchGroupFormState();
}

class _DrenchGroupFormState extends State<DrenchGroupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final List<Chemical> _chemicals = [];
  final List<TextEditingController> _activeIngredientControllers = [];
  final List<TextEditingController> _esiControllers = [];
  final List<TextEditingController> _withholdingPeriodControllers = [];
  final List<bool> _isExistingChemical = [];

  @override
  void initState() {
    super.initState();
    if (widget.drenchGroup != null) {
      _nameController.text = widget.drenchGroup!.name;
      _chemicals.addAll(widget.drenchGroup!.chemicals);
      for (var chemical in widget.drenchGroup!.chemicals) {
        _activeIngredientControllers.add(TextEditingController(text: chemical.activeIngredient));
        _esiControllers.add(TextEditingController(text: chemical.esi.toString()));
        _withholdingPeriodControllers.add(TextEditingController(text: chemical.withholdingPeriod.toString()));
        _isExistingChemical.add(true);
      }
    }
  }

  void _addChemical() {
    setState(() {
      _chemicals.add(Chemical(
        id: '',
        chemicalName: '',
        activeIngredient: '',
        esi: 0,
        withholdingPeriod: 0,
      ));
      _activeIngredientControllers.add(TextEditingController());
      _esiControllers.add(TextEditingController());
      _withholdingPeriodControllers.add(TextEditingController());
      _isExistingChemical.add(false);
    });
  }

  void _removeChemical(int index) {
    setState(() {
      _chemicals.removeAt(index);
      _activeIngredientControllers.removeAt(index);
      _esiControllers.removeAt(index);
      _withholdingPeriodControllers.removeAt(index);
      _isExistingChemical.removeAt(index);
    });
  }

 Future<void> _saveDrenchGroup(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    final newDrenchGroup = DrenchGroup(
      id: widget.drenchGroup?.id ?? '',
      name: _nameController.text,
      chemicals: _chemicals,
    );

    final drenchGroupController = Provider.of<DrenchGroupController>(context, listen: false);
    final chemicalController = Provider.of<ChemicalController>(context, listen: false);

    // Check if the name already exists
    final existingGroups = drenchGroupController.drenchGroups;
    if (existingGroups.any((group) => group.name == newDrenchGroup.name && group.id != newDrenchGroup.id)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('A drench group with this name already exists.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return; // Exit function without saving
    }

    // Proceed with saving or updating
    if (widget.drenchGroup == null) {
      await drenchGroupController.addDrenchGroup(newDrenchGroup);
    } else {
      await drenchGroupController.updateDrenchGroup(newDrenchGroup.id, newDrenchGroup);
    }

    // Save each chemical to the chemicals collection if it does not exist
    for (var chemical in _chemicals) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('chemicals')
          .where('chemicalName', isEqualTo: chemical.chemicalName)
          .get();

      if (querySnapshot.docs.isEmpty) {
        chemicalController.addChemical(chemical);
      }
    }

    Navigator.pop(context);
  }
}

  @override
  Widget build(BuildContext context) {
    final chemicalController = Provider.of<ChemicalController>(context);
    final chemicals = chemicalController.currentChemicals;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Drench Group'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Drench Group Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ..._chemicals.asMap().entries.map((entry) {
                int index = entry.key;
                return Column(
                  key: UniqueKey(),
                  children: [
                    Autocomplete<String>(
                      initialValue: TextEditingValue(text: _chemicals[index].chemicalName),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        return chemicals
                            .map((chemical) => chemical.chemicalName)
                            .where((name) => name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                      },
                      onSelected: (String selection) {
                        setState(() {
                          final selectedChemical = chemicals.firstWhere((chemical) => chemical.chemicalName == selection);
                          _chemicals[index] = selectedChemical;
                          _activeIngredientControllers[index].text = selectedChemical.activeIngredient;
                          _esiControllers[index].text = selectedChemical.esi.toString();
                          _withholdingPeriodControllers[index].text = selectedChemical.withholdingPeriod.toString();
                          _isExistingChemical[index] = true;
                        });
                      },
                      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                        fieldTextEditingController.text = _chemicals[index].chemicalName;
                        return TextFormField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          decoration: const InputDecoration(labelText: 'Chemical Name'),
                          onChanged: (value) {
                            _chemicals[index] = _chemicals[index].copyWith(chemicalName: value);
                            _isExistingChemical[index] = false;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a chemical name';
                            }
                            return null;
                          },
                        );
                      },
                      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            child: Container(
                              width: 300,
                              child: ListView.builder(
                                padding: EdgeInsets.all(8.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option = options.elementAt(index);
                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      title: Text(option),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    TextFormField(
                      controller: _activeIngredientControllers[index],
                      decoration: const InputDecoration(labelText: 'Active Ingredient'),
                      onChanged: (value) {
                        _chemicals[index] = _chemicals[index].copyWith(activeIngredient: value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an active ingredient';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _esiControllers[index],
                      decoration: const InputDecoration(labelText: 'ESI (days)'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _chemicals[index] = _chemicals[index].copyWith(esi: int.tryParse(value) ?? 0);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the ESI in days';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _withholdingPeriodControllers[index],
                      decoration: const InputDecoration(labelText: 'Withholding Period (days)'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _chemicals[index] = _chemicals[index].copyWith(withholdingPeriod: int.tryParse(value) ?? 0);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the withholding period in days';
                        }
                        return null;
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () => _removeChemical(index),
                    ),
                  ],
                );
              }).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addChemical,
                child: const Text('Add Chemical'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveDrenchGroup(context),
                child: Text(widget.drenchGroup == null ? 'Save Drench Group' : 'Update Drench Group'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
