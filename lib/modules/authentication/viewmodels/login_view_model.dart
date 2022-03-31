class LoginSetting {
  final bool emailClear;
  final bool isVisible;

  const LoginSetting({
    this.emailClear = false,
    this.isVisible = false,
  });

  LoginSetting copy({bool? emailClear, bool? isVisible}) => LoginSetting(
        emailClear: emailClear ?? this.emailClear,
        isVisible: isVisible ?? this.isVisible,
      );
}
