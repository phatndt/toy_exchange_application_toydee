import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/styles/styles.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/repos/user_repo.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/widgets/Toast.dart';
import '../repos/auth_repo.dart';

class LoginSetting {
  final bool emailClear;
  bool isVisible;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool isLoadingLogin = false;

  LoginSetting({
    required this.emailClear,
    required this.isVisible,
    required this.emailController,
    required this.passwordController,
    this.isLoadingLogin = false,
  });

  LoginSetting copy({
    bool? emailClear,
    bool? isVisible,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isLoadingLogin,
  }) =>
      LoginSetting(
        emailClear: emailClear ?? !this.emailClear,
        isVisible: isVisible ?? this.isVisible,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
        isLoadingLogin: isLoadingLogin ?? this.isLoadingLogin,
      );

  void clearEmail() {
    emailController.clear();
  }

  //LoginSetting copyWith({}) {return LoginSetting(emailClear: emailClear, isVisible: isVisible, emailController: emailController, passwordController: passwordController)}
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
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late AuthRepo _authRepo;
  late UserRepo _userRepo;

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

  void updateLoadingLogin() {
    final newState = state.copy(isLoadingLogin: !state.isLoadingLogin);
    state = newState;
  }

  signInWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    updateLoadingLogin();
    NavigationService.removeAllFocus();
    CustomToast.fToast.init(context);
    // CustomToast.fToast.showToast(
    //     gravity: ToastGravity.TOP,
    //     child: const CustomToastBuilder(
    //         msg: "Here", icon: FontAwesomeIcons.exclamation));
    await _authRepo
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        if (value != null) {
          if (value.user != null && !value.user!.emailVerified) {
            _authRepo.sendEmailVerification(value).then(
              (value) {
                if (value) {
                  updateLoadingLogin();
                  Fluttertoast.showToast(
                    msg: "Please verify your mail!",
                    backgroundColor: S.colors.primary,
                    textColor: S.colors.textColor_1,
                  );
                } else {
                  updateLoadingLogin();
                  Fluttertoast.showToast(
                    msg: "Please try later!",
                    backgroundColor: S.colors.primary,
                    textColor: S.colors.textColor_1,
                  );
                }
              },
            );
          } else {
            _userRepo.getUserProfileToFireStore().then((value) {
              if (value) {
                updateLoadingLogin();
                navigationToMainScreen(context);
                log(_userRepo.userModel.toString());
              } else {
                updateLoadingLogin();
                Fluttertoast.showToast(msg: "Please try later!");
              }
            });
          }
        } else {
          updateLoadingLogin();
        }
      },
    );
  }

  navigationToMainScreen(BuildContext context) {
    NavigationService.pushReplacementAll(
      isNamed: true,
      page: RoutePaths.mainScreen,
    );
  }
}

final loginSettingNotifierProvider =
    StateNotifierProvider<LoginSettingNotifier, LoginSetting>(
        ((ref) => LoginSettingNotifier(ref)));
