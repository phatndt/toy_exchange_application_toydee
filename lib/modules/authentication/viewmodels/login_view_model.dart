import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class LoginSetting extends ChangeNotifier {
  final bool emailClear;
  bool isVisible;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  LoginSetting({
    required this.emailClear,
    required this.isVisible,
    required this.emailController,
    required this.passwordController,
  });

  LoginSetting copy({
    bool? emailClear,
    bool? isVisible,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) =>
      LoginSetting(
        emailClear: emailClear ?? !this.emailClear,
        isVisible: isVisible ?? this.isVisible,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
      );

  void clearEmail() {
    emailController.clear();
  }
}

class LoginSettingNotifier extends StateNotifier<LoginSetting> {
  LoginSettingNotifier()
      : super(LoginSetting(
          emailClear: false,
          isVisible: true,
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ));

  void updateEmailClear() {
    final newState = state.copy(emailClear: !state.emailClear);
    state = newState;
  }

  void updatePasswordVisible() {
    final newState = state.copy(isVisible: !state.isVisible);
    state = newState;
  }

  void clearEmail() {
    state.clearEmail();
  }
}

final loginSettingNotifierProvider =
    StateNotifierProvider<LoginSettingNotifier, LoginSetting>(
        ((ref) => LoginSettingNotifier()));



