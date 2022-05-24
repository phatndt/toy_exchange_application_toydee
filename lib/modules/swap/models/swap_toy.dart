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
      required bool isSwapped,
      required bool isValid})
      : super(
            id: id,
            userId: userId,
            name: name,
            description: description,
            location: location,
            toyType: toyType,
            isSwapped: isSwapped,
            isValid: isValid);
}
