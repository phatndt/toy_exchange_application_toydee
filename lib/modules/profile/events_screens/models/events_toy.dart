import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';

class EventsToy {
  final String id;
  final String userId;
  final String eventId;
  final String name;
  final String description;
  final Address location;
  final ToyType toyType;
  List<String> image;
  final DateTime createDate;
  final bool isSwapped;
  final bool isValid;

  EventsToy({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.name,
    required this.description,
    required this.location,
    required this.toyType,
    required this.image,
    required this.createDate,
    required this.isSwapped,
    required this.isValid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'eventId': eventId,
      'name': name,
      'description': description,
      'location': location.toMap(),
      'toyType': toyType.toMap(),
      'image': image,
      'createDate': DateFormat("dd-MM-yyyy HH:mm:ss").format(createDate),
      'isSwapped': isSwapped,
      'isValid': isValid,
    }..removeWhere((key, value) => value == null);
  }

  factory EventsToy.fromMap(Map<String, dynamic> map) {
    return EventsToy(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      eventId: map['eventId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      location: Address.fromMap(map['location'] ?? ''),
      toyType: ToyType.fromMap(map['toyType'] ?? ''),
      image: List<String>.from(map['image']),
      createDate: map['createDate'] != ""
          ? DateFormat("dd-MM-yyyy HH:mm:ss").parse(map['createDate'])
          : DateTime.now(),
      isSwapped: map['isSwapped'] ?? '',
      isValid: map['isValid'] ?? '',
    );
  }
}
