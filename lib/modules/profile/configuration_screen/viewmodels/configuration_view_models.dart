import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';

class ConfigurationSetting {
  String email;
  String password;
  String phone;
  String address;
  String gender;
  String firstname;
  String lastname;
  String datetime;
  DateTime initialDateTime;

  ConfigurationSetting({
    required this.gender,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.firstname,
    required this.lastname,
    required this.datetime,
    required this.initialDateTime,
  });

  ConfigurationSetting copy({
    String? email,
    String? password,
    String? phone,
    String? address,
    String? datetime,
    String? gender,
    DateTime? initialDateTime,
    String? lastname,
    String? firstname,
  }) =>
      ConfigurationSetting(
        email: email ?? this.email,
        gender: gender ?? this.gender,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        datetime: datetime ?? this.datetime,
        initialDateTime: initialDateTime ?? this.initialDateTime,
      );
}

class ConfigurationNotifier extends StateNotifier<ConfigurationSetting> {
  ConfigurationNotifier(this.ref)
      : super(
          ConfigurationSetting(
            gender: '',
            email: '',
            password: '',
            phone: '',
            address: '',
            firstname: '',
            lastname: '',
            datetime: '',
            initialDateTime: DateTime.now(),
          ),
        ) {}

  final Ref ref;

  //   void updatePasswordVisible() {
  //   final newState = state.copy(isVisiblePassword: !state.isVisiblePassword);
  //   state = newState;
  // }

  void updateDate(String a) {
    final newState = state.copy(datetime: a);
    state = newState;
  }

  void updateFirstNames(String a) {
    final newState = state.copy(firstname: a);
    state = newState;
  }

  void updateLastNames(String a) {
    final newState = state.copy(lastname: a);
    state = newState;
  }

  // void saveChanges() {
  //   if (state.groupButtonController.selectedIndex == null) {
  //     return;
  //   } else {
  //     NavigationService.goBack(
  //         result: state.groupButtonController.selectedIndex);
  //   }
  // }

  // void navigationBack() {
  //   state.groupButtonController.unselectAll();
  //   NavigationService.goBack();
  // }

  // navigationToDone(BuildContext context) {
  //   NavigationService.push(
  //     page: RoutePaths.home,
  //     isNamed: true,
  //   );
  // }

  // navigationToLogin(BuildContext context) {
  //   NavigationService.pushAndRemoveUntil(
  //     isNamed: true,
  //     page: RoutePaths.login,
  //     predicate: (Route<dynamic> route) => false,
  //   );
  // }
}

final configurationNotifierProvider =
    StateNotifierProvider<ConfigurationNotifier, ConfigurationSetting>(
        ((ref) => ConfigurationNotifier(ref)));
