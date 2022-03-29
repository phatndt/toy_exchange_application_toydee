class R {
  static final images = _Image();
  static final icons = _Icons();
}

class _Icons {
  static const path = 'assets/icons';
  final home = '$path/house_solid.svg';
  final profile = '$path/user_solid.svg';
  final add = '$path/plus_solid.svg';
}

class _Image {
  static const path = 'assets/icons';
  //final logo = '$path/';

  static const logoPath = 'assets/images/logo';
  final logoText = '$logoPath/logo_text.png';
  final logo = '$logoPath/logo.png';

  static const loginPath = 'assets/images/login';

  final fbLogin = '$loginPath/logos_facebook.png';
  final ggLogin = '$loginPath/flat-color-icons_google.png';
  final appleLogin = '$loginPath/ant-design_apple-filled.png';
}
