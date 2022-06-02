class ToyType {
  // final String id;
  // final String toyId;
  final List<int> categories;
  final int condition;
  final int genderType;
  final int ageGroup;

  ToyType({
    // required this.id,
    // required this.toyId,
    required this.categories,
    required this.condition,
    required this.genderType,
    required this.ageGroup,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      // 'toyId': toyId,
      'categories': categories,
      'condition': condition,
      'genderType': genderType,
      'ageGroup': ageGroup,
    }..removeWhere((key, value) => value == null);
  }

  factory ToyType.fromMap(Map<String, dynamic> map) {
    return ToyType(
      // id: map['id'] ?? '',
      // toyId: map['toyId'] ?? '',
      categories: List<int>.from(map['categories'] ?? '[]') ,
      condition: map['condition'] ?? '',
      genderType: map['genderType'] ?? '',
      ageGroup: map['ageGroup'] ?? '',
    );
  }
}
