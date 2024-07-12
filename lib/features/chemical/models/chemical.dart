class Chemical {
  final String id;
  final String chemicalName;
  final String activeIngredient;
  final int esi;
  final int withholdingPeriod;

  Chemical({
    required this.id,
    required this.chemicalName,
    required this.activeIngredient,
    required this.esi,
    required this.withholdingPeriod,
  });

  factory Chemical.fromFirestore(Map<String, dynamic> data, String id) {
    return Chemical(
      id: id,
      chemicalName: data['chemicalName'] ?? 'Unnamed Chemical',
      activeIngredient: data['activeIngredient'] ?? 'Unknown Ingredient',
      esi: data['esi'] ?? 0,
      withholdingPeriod: data['withholdingPeriod'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'chemicalName': chemicalName,
      'activeIngredient': activeIngredient,
      'esi': esi,
      'withholdingPeriod': withholdingPeriod,
    };
  }

  Chemical copyWith({
    String? id,
    String? chemicalName,
    String? activeIngredient,
    int? esi,
    int? withholdingPeriod,
  }) {
    return Chemical(
      id: id ?? this.id,
      chemicalName: chemicalName ?? this.chemicalName,
      activeIngredient: activeIngredient ?? this.activeIngredient,
      esi: esi ?? this.esi,
      withholdingPeriod: withholdingPeriod ?? this.withholdingPeriod,
    );
  }
}
