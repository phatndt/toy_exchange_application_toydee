import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';

import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_paths.dart';

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
        ) {}

  final Ref ref;

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

  void saveChangesPassword() {
    NavigationService.goBack(result: state.passwordEditingController.text);
    ref.watch(configurationNotifierProvider).password =
        state.passwordEditingController.text;
  }

  void navigationBackPassword() {
    NavigationService.goBack(result: state.passwordEditingController.text);
  }

  void saveChangesEmail() {
    NavigationService.goBack();
    ref.watch(configurationNotifierProvider).email =
        state.emailEditingController.text;
  }

  void navigationBackEmail() {
    NavigationService.goBack(result: state.emailEditingController.text);
  }

  void saveChangesPhone() {
    NavigationService.goBack();
    ref.watch(configurationNotifierProvider).phone =
        state.phoneEditingController.text;
  }

  void navigationBackPhone() {
    NavigationService.goBack(result: state.phoneEditingController.text);
  }

  void saveChangesAddress() {
    NavigationService.goBack();
    ref.watch(configurationNotifierProvider).address =
        state.addressEditingController.text;
  }

  void navigationBackAddress() {
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
