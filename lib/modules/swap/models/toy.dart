import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';

class Toy {
  final String id;
  final String userId;
  final String name;
  final String description;
  final Address location;
  final ToyType toyType;
  final bool isSwapped;

  Toy({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.location,
    required this.toyType,
    required this.isSwapped,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'description': description,
      'location': location.toMap(),
      'toyType': toyType.toMap(),
      'isSwapped': isSwapped,
    }..removeWhere((key, value) => value == null);
  }

  factory Toy.fromMap(Map<String, dynamic> map) {
    return Toy(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      location: Address.fromMap(map['location'] ?? ''),
      toyType: ToyType.fromMap(map['toyType'] ?? ''),
      isSwapped: map['isSwapped'] ?? '',
    );
  }
}
