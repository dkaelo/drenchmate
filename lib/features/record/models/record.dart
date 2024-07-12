import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drenchmate/features/chemical/models/drench_group.dart';

class Record {
  final String id;
  final DateTime dateOfTreatment;
  final int numberOfAnimalsTreated;
  final String mobId;
  final String animalDetails;
  final DrenchGroup drenchGroup;
  final double treatmentRate;
  final String personAdministering;

  Record({
    required this.id,
    required this.dateOfTreatment,
    required this.numberOfAnimalsTreated,
    required this.mobId,
    required this.animalDetails,
    required this.drenchGroup,
    required this.treatmentRate,
    required this.personAdministering,
  });

  factory Record.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?; // Add null check here
    if (data == null) {
      throw Exception('Data is null');
    }
    return Record(
      id: doc.id,
      dateOfTreatment: (data['dateOfTreatment'] as Timestamp).toDate(),
      numberOfAnimalsTreated: data['numberOfAnimalsTreated'] ?? 0,
      mobId: data['mobId'] ?? '',
      animalDetails: data['animalDetails'] ?? '',
      drenchGroup: DrenchGroup.fromMap(data['drenchGroup'] as Map<String, dynamic>?, doc.id), // Add null check in DrenchGroup.fromMap
      treatmentRate: data['treatmentRate'] ?? 0.0,
      personAdministering: data['personAdministering'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'dateOfTreatment': dateOfTreatment,
      'numberOfAnimalsTreated': numberOfAnimalsTreated,
      'mobId': mobId,
      'animalDetails': animalDetails,
      'drenchGroup': drenchGroup.toFirestore(),
      'treatmentRate': treatmentRate,
      'personAdministering': personAdministering,
    };
  }
}
