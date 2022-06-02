import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../authentication/repos/user_repo.dart';

class ConfigurationChangingNamesSetting {
  final TextEditingController firstNameEditingController;
  final TextEditingController lastNameEditingController;

  ConfigurationChangingNamesSetting({
    required this.firstNameEditingController,
    required this.lastNameEditingController,
  });

  ConfigurationChangingNamesSetting copy({
    TextEditingController? firstNameEditingController,
    TextEditingController? lastNameEditingController,
  }) =>
      ConfigurationChangingNamesSetting(
        firstNameEditingController: TextEditingController(),
        lastNameEditingController: TextEditingController(),
      );
}

class ConfigurationChangingNamesNotifier
    extends StateNotifier<ConfigurationChangingNamesSetting> {
  ConfigurationChangingNamesNotifier(this.ref)
      : super(
          ConfigurationChangingNamesSetting(
            firstNameEditingController: TextEditingController(),
            lastNameEditingController: TextEditingController(),
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;
  void saveChanges() {
    if (state.firstNameEditingController.text.isEmpty ||
        state.lastNameEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Fill up the blank field!");
    } else {
      _userRepo
          .updateUserNameToFireStore(state.firstNameEditingController.text,
              state.lastNameEditingController.text)
          .then((value) {
        if (value) {
          ref.watch(configurationNotifierProvider).firstname =
              state.firstNameEditingController.text;
          ref.watch(configurationNotifierProvider).lastname =
              state.lastNameEditingController.text;
          NavigationService.goBack();
        } else {
          Fluttertoast.showToast(msg: "Please try later!");
        }
      });
    }
  }

  void navigationBack() {
    state.firstNameEditingController.clear();
    state.lastNameEditingController.clear();
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

final configurationChangingNamesNotifierProvider = StateNotifierProvider<
        ConfigurationChangingNamesNotifier, ConfigurationChangingNamesSetting>(
    ((ref) => ConfigurationChangingNamesNotifier(ref)));
