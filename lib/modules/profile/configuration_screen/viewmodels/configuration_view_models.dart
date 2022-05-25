import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../authentication/repos/user_repo.dart';

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
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  UserRepo? _userRepo;

  //   void updatePasswordVisible() {
  //   final newState = state.copy(isVisiblePassword: !state.isVisiblePassword);
  //   state = newState;
  // }

  void updateDate(String a) {
    final newState = state.copy(datetime: a);
    state = newState;
  }

  void getFirstNameFromFireStore() {
    _userRepo!.getUserFirstNameFromFireStore().then((value) {
      if (value != '') {
        updateFirstNames(value);
      } else {
        updateFirstNames('');
      }
    });
  }

  void getLastNameFromFireStore() {
    _userRepo!.getUserLastNameFromFireStore().then((value) {
      if (value != '') {
        updateLastNames(value);
      } else {
        updateLastNames('');
      }
    });
  }

  void getPhoneFromFireStore() {
    _userRepo!.getUserPhoneFromFireStore().then((value) {
      if (value != '') {
        updatePhone(value);
      } else {
        updatePhone('');
      }
    });
  }

  void getBirthDateFromFireStore() {
    _userRepo!.getUserBirthDateFromFireStore().then((value) {
      if (value != '') {
        updateBirth(value);
      } else {
        updateBirth('');
      }
    });
  }

  void getGenderFromFireStore() {
    _userRepo!.getUserGenderFromFireStore().then((value) {
      if (value != '') {
        updateGender(value);
      } else {
        updateGender('');
      }
    });
  }

  void datetoFireStore(String birth) {
    _userRepo!.updateUserBirthDateToFireStore(birth).then((value) {
      if (value) {
      } else {
        Fluttertoast.showToast(msg: "Please try later!");
      }
    });
  }

  void updateFirstNames(String a) {
    final newState = state.copy(firstname: a);
    state = newState;
  }

  void updateLastNames(String a) {
    final newState = state.copy(lastname: a);
    state = newState;
  }

  void updatePhone(String a) {
    final newState = state.copy(phone: a);
    state = newState;
  }

  void updateBirth(String a) {
    final newState = state.copy(datetime: a);
    state = newState;
  }

  void updateGender(String a) {
    final newState = state.copy(gender: a);
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
