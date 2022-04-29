import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../models/user_model.dart';
import '../repos/auth_repo.dart';

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
  RegisterSettingNotifier(this.ref)
      : super(
          RegisterSetting(
            isVisiblePassword: true,
            isVisibleRepeatPassword: true,
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            repeatPasswordController: TextEditingController(),
            phoneController: TextEditingController(),
            usernameController: TextEditingController(),
          ),
        ) {
    _authRepo = ref.watch(authRepoProvider);
  }

  final Ref ref;
  late AuthRepo _authRepo;

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

  signUpWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String userName,
    required String password,
  }) async {
    NavigationService.removeAllFocus();
    final _result = await _authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (_result != null) {
      UserModel userModel = _result;
      await submitSignUp(context, userModel, email, userName);
    }
  }

  Future submitSignUp(
    BuildContext context,
    UserModel userModel,
    String email,
    String userName,
  ) async {
    final _result = await _authRepo.uploadUserProfileToFirestore(
      email: email,
      userName: userName,
      uuid: userModel.id,
    );

    log(_result.toString());

    if (_result != null) {
      if (_result) {
        navigationToMainScreen(context);
      }
    }
  }

  navigationToMainScreen(BuildContext context) {
    NavigationService.pushReplacementAll(
      isNamed: true,
      page: RoutePaths.mainScreen,
    );
  }

  checkExistUserInformation({
    required String email,
    required String userName,
  }) async {
    final _result = await _authRepo.checkExistUserInformation(email, userName);
    return _result;
  }

  String? phoneNumber(text) {
    if (!RegExp(r"(84|0[3|5|7|8|9])+([0-9]{8})").hasMatch(text)) {
      return 'Phone number must be 10 characters';
    }
    return null;
  }

  String? passwordValidationRegex(text) {
    if (!RegExp(r"([a-zA-Z0-9]{6})").hasMatch(text)) {
      return 'Passwords must be at least 6 characters';
    }
    return null;
  }

  String? checkUserEmpty(value) {
    if (value.isEmpty) return "Username must not be empty";
    return null;
  }
}

final registerSettingNotifierProvider =
    StateNotifierProvider<RegisterSettingNotifier, RegisterSetting>(
        ((ref) => RegisterSettingNotifier(ref)));
