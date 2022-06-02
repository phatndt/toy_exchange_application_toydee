import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';

class SwapToy extends Toy {
  SwapToy(
      {required String id,
      required String userId,
      required String name,
      required String description,
      required Address location,
      required ToyType toyType,
      required List<String> image,
      required DateTime createDate,
      required bool isSwapped,
      required bool isValid})
      : super(
            id: id,
            userId: userId,
            name: name,
            description: description,
            location: location,
            toyType: toyType,
            image: image,
            createDate: createDate,
            isSwapped: isSwapped,
            isValid: isValid);

  factory SwapToy.fromMap(Map<String, dynamic> map) {
    return SwapToy(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
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
