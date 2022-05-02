import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../repos/auth_repo.dart';

class ResetPasswordSetting {
  final TextEditingController emailController;

  FocusNode emailFocusNode = FocusNode();

  ResetPasswordSetting({
    required this.emailController,
  });

  ResetPasswordSetting copy({
    TextEditingController? emailController,
  }) =>
      ResetPasswordSetting(
        emailController: emailController ?? this.emailController,
      );

  void clearEmail() {
    emailController.clear();
  }
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordSetting> {
  ResetPasswordNotifier(this.ref)
      : super(
          ResetPasswordSetting(
            emailController: TextEditingController(),
          ),
        ) {
    _authRepo = ref.watch(authRepoProvider);
  }

  final Ref ref;
  late AuthRepo _authRepo;

  void clearEmail() {
    state.clearEmail();
  }

  String? emailValidator(text) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) return 'Invalid email';
    return null;
  }

  sendEmailResetPassword(
    BuildContext context, {
    required String email,
  }) async {
    final _result = await _authRepo.sendPasswordResetEmail(
      email: email,
    );

    if (_result != null) {
      if (_result) {
        navigationToDone(context);
        clearEmail();
      }
    }
  }
  navigationToDone(BuildContext context) {
                    NavigationService.push(
                  page: RoutePaths.resetPasswordDone,
                  isNamed: true,
                );
  }

  navigationToLogin(BuildContext context) {
    NavigationService.pushAndRemoveUntil(
      isNamed: true,
      page: RoutePaths.login,
      predicate: (Route<dynamic> route) => false,
    );
  }
}

final resetPasswordNotifierProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordSetting>(
        ((ref) => ResetPasswordNotifier(ref)));
