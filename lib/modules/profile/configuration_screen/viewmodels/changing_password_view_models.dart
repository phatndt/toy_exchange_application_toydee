import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../authentication/repos/user_repo.dart';

class ConfigurationChangingPasswordSetting {
  final TextEditingController oldPasswordEdittingController;
  final TextEditingController newPasswordEditingController;
  final TextEditingController newPasswordConfirmEdittingController;

  ConfigurationChangingPasswordSetting({
    required this.oldPasswordEdittingController,
    required this.newPasswordEditingController,
    required this.newPasswordConfirmEdittingController,
  });

  ConfigurationChangingPasswordSetting copy({
    TextEditingController? oldPasswordEdittingController,
    TextEditingController? newPasswordEditingController,
    TextEditingController? newPasswordConfirmEdittingController,
  }) =>
      ConfigurationChangingPasswordSetting(
        oldPasswordEdittingController: TextEditingController(),
        newPasswordEditingController: TextEditingController(),
        newPasswordConfirmEdittingController: TextEditingController(),
      );
}

class ConfigurationChangingPasswordNotifier
    extends StateNotifier<ConfigurationChangingPasswordSetting> {
  ConfigurationChangingPasswordNotifier(this.ref)
      : super(
          ConfigurationChangingPasswordSetting(
            oldPasswordEdittingController: TextEditingController(),
            newPasswordEditingController: TextEditingController(),
            newPasswordConfirmEdittingController: TextEditingController(),
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;

  void saveChanges() {
    if (checkPasswordIsEmty(state.oldPasswordEdittingController)) {
      Fluttertoast.showToast(msg: "Type in your old password!");
    } else if (checkPasswordIsEmty(state.newPasswordEditingController)) {
      Fluttertoast.showToast(msg: "Type in your new password!");
    } else if (checkPasswordIsEmty(
        state.newPasswordConfirmEdittingController)) {
      Fluttertoast.showToast(msg: "Type in your new password one more time!");
    }
    if (!checkPasswordIsEmty(state.newPasswordEditingController) &&
        !checkPasswordIsEmty(state.newPasswordConfirmEdittingController) &&
        !checkPasswordIsEmty(state.oldPasswordEdittingController)) {
      if (state.newPasswordEditingController.text ==
          state.newPasswordConfirmEdittingController.text) {
        ref.watch(configurationNotifierProvider).password =
            state.newPasswordEditingController.text;
        _userRepo.changePassword(state.newPasswordEditingController.text,
            state.oldPasswordEdittingController.text);
        oldPassClear();
        newPassClear();
        newPassConfirmClear();

        _userRepo.updateUserLastUpdateToFireStore().then((value) {
          if (value) {
          } else {
            Fluttertoast.showToast(msg: "Please try later!");
          }
        });
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

  void newPassConfirmClear() {
    state.newPasswordConfirmEdittingController.clear();
  }

  void newPassClear() {
    state.newPasswordEditingController.clear();
  }

  void navigationBack() {
    oldPassClear();
    newPassClear();
    newPassConfirmClear();
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
