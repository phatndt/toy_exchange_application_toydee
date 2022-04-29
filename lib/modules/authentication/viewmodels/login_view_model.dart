import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/navigation_service.dart';
import '../repos/auth_repo.dart';

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
  LoginSettingNotifier(this.ref)
      : super(
          LoginSetting(
            emailClear: false,
            isVisible: true,
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
          ),
        ) {
    _authRepo = ref.watch(authRepoProvider);
  }

  final Ref ref;
  late AuthRepo _authRepo;

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

  String? emailValidator(text) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) return 'Invalid email';
    return null;
  }

  signInWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    NavigationService.removeAllFocus();
    final _result = await _authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

final loginSettingNotifierProvider =
    StateNotifierProvider<LoginSettingNotifier, LoginSetting>(
        ((ref) => LoginSettingNotifier(ref)));
