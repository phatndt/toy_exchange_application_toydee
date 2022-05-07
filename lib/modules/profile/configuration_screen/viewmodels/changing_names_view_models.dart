import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';

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
        ) {}

  final Ref ref;

  void saveChanges() {
    ref.watch(configurationNotifierProvider).firstname =
        state.firstNameEditingController.text;
    ref.watch(configurationNotifierProvider).lastname =
        state.lastNameEditingController.text;
    NavigationService.goBack();
  }

  void navigationBack() {
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
