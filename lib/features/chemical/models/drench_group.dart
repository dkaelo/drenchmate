import 'package:cloud_firestore/cloud_firestore.dart';
import 'chemical.dart';

class DrenchGroup {
  final String id;
  final String name;
  final List<Chemical> chemicals;

  DrenchGroup({
    required this.id,
    required this.name,
    required this.chemicals,
  });

  factory DrenchGroup.fromMap(Map<String, dynamic>? data, String id) {
    if (data == null) {
      throw Exception('Data is null');
    }
    return DrenchGroup(
      id: id,
      name: data['name'] ?? 'Unnamed',
      chemicals: (data['chemicals'] as List<dynamic>?)
          ?.map((chemicalData) => Chemical.fromFirestore(chemicalData as Map<String, dynamic>, ''))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'chemicals': chemicals.map((chemical) => chemical.toFirestore()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final DrenchGroup otherDrenchGroup = other as DrenchGroup;
    return id == otherDrenchGroup.id;
  }

  @override
  int get hashCode => id.hashCode;
}
