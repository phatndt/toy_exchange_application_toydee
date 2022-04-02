import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginSetting {
  final bool emailClear;
  final bool isVisible;

  const LoginSetting({
    this.emailClear = false,
    this.isVisible = true,
  });

  LoginSetting copy({bool? emailClear, bool? isVisible}) => LoginSetting(
        emailClear: emailClear ?? !this.emailClear,
        isVisible: isVisible ?? this.isVisible,
      );
}

class LoginSettingNotifier extends StateNotifier<LoginSetting> {
  LoginSettingNotifier() : super(const LoginSetting());

  void updateEmailClear() {
    final newState = state.copy(emailClear: !state.emailClear);
    state = newState;
  }

  void updatePasswordVisible() {
    final newState = state.copy(isVisible: !state.isVisible);
    state = newState;
  }
}

final loginSettingNotifierProvider =
    StateNotifierProvider<LoginSettingNotifier, LoginSetting>(
        ((ref) => LoginSettingNotifier()));
