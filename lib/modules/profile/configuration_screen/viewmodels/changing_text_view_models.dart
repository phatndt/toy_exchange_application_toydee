import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../authentication/models/address.dart';
import '../../../authentication/repos/user_repo.dart';

class ConfigurationChangingTextSetting {
  final TextEditingController textEditingController;
  final TextEditingController passwordEditingController;
  final TextEditingController emailEditingController;
  final TextEditingController phoneEditingController;
  final TextEditingController addressEditingController;

  ConfigurationChangingTextSetting({
    required this.passwordEditingController,
    required this.emailEditingController,
    required this.phoneEditingController,
    required this.addressEditingController,
    required this.textEditingController,
  });

  ConfigurationChangingTextSetting copy({
    TextEditingController? textEditingController,
    TextEditingController? passwordEditingController,
    TextEditingController? emailEditingController,
    TextEditingController? phoneEditingController,
    TextEditingController? addressEditingController,
  }) =>
      ConfigurationChangingTextSetting(
        textEditingController:
            textEditingController ?? this.textEditingController,
        passwordEditingController:
            passwordEditingController ?? this.passwordEditingController,
        phoneEditingController:
            phoneEditingController ?? this.phoneEditingController,
        emailEditingController:
            emailEditingController ?? this.emailEditingController,
        addressEditingController:
            addressEditingController ?? this.addressEditingController,
      );
}

class ConfigurationChangingTextNotifier
    extends StateNotifier<ConfigurationChangingTextSetting> {
  ConfigurationChangingTextNotifier(this.ref)
      : super(
          ConfigurationChangingTextSetting(
            textEditingController: TextEditingController(),
            passwordEditingController: TextEditingController(),
            emailEditingController: TextEditingController(),
            phoneEditingController: TextEditingController(),
            addressEditingController: TextEditingController(),
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;

  void clearTextPassword() {
    state.passwordEditingController.clear();
  }

  void clearTextEmail() {
    state.emailEditingController.clear();
  }

  void clearTextPhone() {
    state.phoneEditingController.clear();
  }

  void clearTextAddress() {
    state.addressEditingController.clear();
  }

  // void saveChangesPassword() {
  //   NavigationService.goBack(result: state.passwordEditingController.text);
  //   ref.watch(configurationNotifierProvider).password =
  //       state.passwordEditingController.text;
  // }

  // void navigationBackPassword() {
  //   NavigationService.goBack(result: state.passwordEditingController.text);
  // }

  void saveChangesEmail() {
    if (state.emailEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Fill up the blank field");
    } else {
      NavigationService.goBack();
      ref.watch(configurationNotifierProvider).email =
          state.emailEditingController.text;
    }
  }

  void navigationBackEmail() {
    state.emailEditingController.clear();
    NavigationService.goBack(result: state.emailEditingController.text);
  }

  void saveChangesPhone() {
    if (state.phoneEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Fill up the blank field");
    } else {
      _userRepo
          .updateUserPhoneToFireStore(state.phoneEditingController.text)
          .then((value) {
        if (value) {
          NavigationService.goBack();
          ref.watch(configurationNotifierProvider).phone =
              state.phoneEditingController.text;
          _userRepo.updateUserLastUpdateToFireStore().then((value) {
            if (value) {
            } else {
              Fluttertoast.showToast(msg: "Please try later!");
            }
          });
        } else {
          Fluttertoast.showToast(msg: "Please try later!");
        }
      });
      _userRepo.updateUserLastUpdateToFireStore().then((value) {
        if (value) {
        } else {
          Fluttertoast.showToast(msg: "Please try later!");
        }
      });
    }
  }

  void navigationBackPhone() {
    state.phoneEditingController.clear();
    NavigationService.goBack(result: state.phoneEditingController.text);
  }

  Future<void> saveChangesAddress() async {
    if (state.addressEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Fill up the blank field");
    } else {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      Address address = Address(
        address: place.administrativeArea! + ' ' + place.country!,
        detailAddress: state.addressEditingController.text,
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
      );
      _userRepo.updateUserAddressToFireStore(address).then((value) {
        if (value) {
          NavigationService.goBack();
          ref.watch(configurationNotifierProvider).address.detailAddress =
              state.addressEditingController.text;
          _userRepo.updateUserLastUpdateToFireStore().then((value) {
            if (value) {
            } else {
              Fluttertoast.showToast(msg: "Please try later!");
            }
          });
        } else {
          Fluttertoast.showToast(msg: "Please try later!");
        }
      });
    }
  }

  void navigationBackAddress() {
    state.addressEditingController.clear();
    NavigationService.goBack(result: state.addressEditingController.text);
  }

  navigationToLogin(BuildContext context) {
    NavigationService.pushAndRemoveUntil(
      isNamed: true,
      page: RoutePaths.login,
      predicate: (Route<dynamic> route) => false,
    );
  }
}

final configurationChangingTextNotifierProvider = StateNotifierProvider<
        ConfigurationChangingTextNotifier, ConfigurationChangingTextSetting>(
    ((ref) => ConfigurationChangingTextNotifier(ref)));
