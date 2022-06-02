import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';

class ConfigurationChangingPasswordSetting {
  final TextEditingController oldPasswordEdittingController;
  final TextEditingController oldPasswordConfirmEdittingController;
  final TextEditingController newPasswordEditingController;

  ConfigurationChangingPasswordSetting({
    required this.oldPasswordEdittingController,
    required this.oldPasswordConfirmEdittingController,
    required this.newPasswordEditingController,
  });

  ConfigurationChangingPasswordSetting copy({
    TextEditingController? oldPasswordEdittingController,
    TextEditingController? oldPasswordConfirmEdittingController,
    TextEditingController? newPasswordEditingController,
  }) =>
      ConfigurationChangingPasswordSetting(
        oldPasswordEdittingController: TextEditingController(),
        oldPasswordConfirmEdittingController: TextEditingController(),
        newPasswordEditingController: TextEditingController(),
      );
}

class ConfigurationChangingPasswordNotifier
    extends StateNotifier<ConfigurationChangingPasswordSetting> {
  ConfigurationChangingPasswordNotifier(this.ref)
      : super(
          ConfigurationChangingPasswordSetting(
            oldPasswordConfirmEdittingController: TextEditingController(),
            oldPasswordEdittingController: TextEditingController(),
            newPasswordEditingController: TextEditingController(),
          ),
        ) {}

  final Ref ref;

  void saveChanges() {
    if (checkPasswordIsEmty(state.newPasswordEditingController)) {
      Fluttertoast.showToast(msg: "Type in your new password!");
    }
    if (checkPasswordIsEmty(state.oldPasswordEdittingController)) {
      Fluttertoast.showToast(msg: "Type in your old password!");
    }
    if (checkPasswordIsEmty(state.oldPasswordConfirmEdittingController)) {
      Fluttertoast.showToast(msg: "Type in your old password one more time!");
    }
    if (!checkPasswordIsEmty(state.newPasswordEditingController) &&
        !checkPasswordIsEmty(state.oldPasswordConfirmEdittingController) &&
        !checkPasswordIsEmty(state.oldPasswordConfirmEdittingController)) {
      if (state.oldPasswordEdittingController.text ==
          state.oldPasswordConfirmEdittingController.text) {
        ref.watch(configurationNotifierProvider).password =
            state.newPasswordEditingController.text;
        oldPassClear();
        oldPassConfirmClear();
        newPassClear();
        NavigationService.goBack();
      } else {
        Fluttertoast.showToast(msg: "Can't confirm your password!");
        log("Old password is wrong");
      }
    }
  }

  bool checkPasswordIsEmty(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void oldPassClear() {
    state.oldPasswordEdittingController.clear();
  }

  void oldPassConfirmClear() {
    state.oldPasswordConfirmEdittingController.clear();
  }

  void newPassClear() {
    state.newPasswordEditingController.clear();
  }

  void navigationBack() {
    oldPassClear();
    oldPassConfirmClear();
    newPassClear();
    NavigationService.goBack();
  }

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

final configurationChangingPasswordNotifierProvider = StateNotifierProvider<
        ConfigurationChangingPasswordNotifier,
        ConfigurationChangingPasswordSetting>(
    ((ref) => ConfigurationChangingPasswordNotifier(ref)));
