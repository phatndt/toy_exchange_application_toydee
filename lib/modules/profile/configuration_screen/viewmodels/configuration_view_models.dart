import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:group_button/group_button.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../authentication/repos/user_repo.dart';

class ConfigurationSetting {
  String email;
  String password;
  String phone;
  Address address;
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
    Address? address,
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
            address: Address(
                address: '', detailAddress: '', latitude: '', longitude: ''),
            firstname: '',
            lastname: '',
            datetime: '',
            initialDateTime: DateTime.now(),
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;

  //   void updatePasswordVisible() {
  //   final newState = state.copy(isVisiblePassword: !state.isVisiblePassword);
  //   state = newState;
  // }

  void updateDate(String a) {
    final newState = state.copy(datetime: a);
    state = newState;
  }

  void getFirstNameFromFireStore() {
    _userRepo.getUserFirstNameFromFireStore().then((value) {
      if (value != '') {
        updateFirstNames(value);
      } else {
        updateFirstNames('');
      }
    });
  }

  void updateLastUpdateDateBirthDate() {
    _userRepo.updateUserLastUpdateToFireStore().then((value) {
      if (value) {
      } else {
        Fluttertoast.showToast(msg: "Please try later!");
      }
    });
  }

  void getAddressFromFireStore() {
    _userRepo.getUserAdressFromFireStore().then((value) {
      if (value != null) {
        updateAdress(value);
      } else {
        updateAdress(Address(
          address: '',
          detailAddress: '',
          latitude: '',
          longitude: '',
        ));
      }
    });
  }

  void getLastNameFromFireStore() {
    _userRepo.getUserLastNameFromFireStore().then((value) {
      if (value != '') {
        updateLastNames(value);
      } else {
        updateLastNames('');
      }
    });
  }

  String setUserAddressFromFireStore() {
    return _userRepo.userModel!.address!.address;
  }

  String setUserEmailFromFireStore() {
    return _userRepo.userModel!.email;
  }

  void getPhoneFromFireStore() {
    _userRepo.getUserPhoneFromFireStore().then((value) {
      if (value != '') {
        updatePhone(value);
      } else {
        updatePhone('');
      }
    });
  }

  void getBirthDateFromFireStore() {
    _userRepo.getUserBirthDateFromFireStore().then((value) {
      if (value != '') {
        updateBirth(value);
      } else {
        updateBirth('');
      }
    });
  }

  void getGenderFromFireStore() {
    _userRepo.getUserGenderFromFireStore().then((value) {
      if (value != '') {
        updateGender(value);
      } else {
        updateGender('');
      }
    });
  }

  void datetoFireStore(String birth) {
    _userRepo.updateUserBirthDateToFireStore(birth).then((value) {
      if (value) {
      } else {
        Fluttertoast.showToast(msg: "Please try later!");
      }
    });
  }

  void updatePassword(String a) {
    final newState = state.copy(password: a);
    state = newState;
  }

  void updateAdress(Address a) {
    final newState = state.copy(address: a);
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

  void logOut() {
    _userRepo.logOut().then((value) {
      NavigationService.pushReplacementAll(
          isNamed: true, page: RoutePaths.login);
    });
  }
}

final configurationNotifierProvider =
    StateNotifierProvider<ConfigurationNotifier, ConfigurationSetting>(
        ((ref) => ConfigurationNotifier(ref)));
