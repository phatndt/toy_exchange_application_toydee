import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class RegisterSetting extends ChangeNotifier {
  final bool isVisiblePassword;
  final bool isVisibleRepeatPassword;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;
  final TextEditingController phoneController;
  final TextEditingController usernameController;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode repeatPasswordFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();

  RegisterSetting({
    required this.isVisiblePassword,
    required this.isVisibleRepeatPassword,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
    required this.phoneController,
    required this.usernameController,
  });

  RegisterSetting copy({
    bool? isVisiblePassword,
    bool? isVisibleRepeatPassword,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? repeatPasswordController,
    TextEditingController? phoneController,
    TextEditingController? usernameController,
  }) =>
      RegisterSetting(
        isVisiblePassword: isVisiblePassword ?? !this.isVisiblePassword,
        isVisibleRepeatPassword:
            isVisibleRepeatPassword ?? this.isVisibleRepeatPassword,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
        repeatPasswordController:
            repeatPasswordController ?? this.repeatPasswordController,
        phoneController: phoneController ?? this.phoneController,
        usernameController: usernameController ?? this.usernameController,
      );

  void clearEmail() {
    emailController.clear();
  }

  void clearPhone() {
    phoneController.clear();
  }

  void clearUsername() {
    usernameController.clear();
  }
}

class RegisterSettingNotifier extends StateNotifier<RegisterSetting> {
  RegisterSettingNotifier()
      : super(RegisterSetting(
          isVisiblePassword: true,
          isVisibleRepeatPassword: true,
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          repeatPasswordController: TextEditingController(),
          phoneController: TextEditingController(),
          usernameController: TextEditingController(),
        ));

  void updatePasswordVisible() {
    final newState = state.copy(isVisiblePassword: !state.isVisiblePassword);
    state = newState;
  }

  void updateRepeatPasswordVisible() {
    final newState =
        state.copy(isVisibleRepeatPassword: !state.isVisibleRepeatPassword);
    state = newState;
  }

  void clearEmail() {
    state.clearEmail();
  }

  void clearPhone() {
    state.clearPhone();
  }

  void clearUsername() {
    state.clearUsername();
  }
}

final registerSettingNotifierProvider =
    StateNotifierProvider<RegisterSettingNotifier, RegisterSetting>(
        ((ref) => RegisterSettingNotifier()));
