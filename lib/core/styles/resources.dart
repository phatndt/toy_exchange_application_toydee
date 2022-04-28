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
  //static const path = 'assets/icons';
  //final logo = '$path/';

  static const logoPath = 'assets/images/logo';
  final logoText = '$logoPath/logo_text.png';
  final logo = '$logoPath/logo.png';

  static const loginPath = 'assets/images/login';

  final fbLogin = '$loginPath/logos_facebook.png';
  final ggLogin = '$loginPath/flat-color-icons_google.png';
  final appleLogin = '$loginPath/ant-design_apple-filled.png';

  static const homePath = 'assets/images/home';

  final homeSwiper_1 = '$homePath/swiper_1.png';
  final homeSwiper_2 = '$homePath/swiper_2.png';
  final homeSwiper_3 = '$homePath/swiper_3.png';
  final homeToy_1 = '$homePath/toy_1.png';
  final homeToy_2 = '$homePath/toy_2.png';
  final homeToy_3 = '$homePath/toy_3.png';
  final homeToy_4 = '$homePath/toy_4.png';

  static const swapPath = 'assets/images/swap';

  final swapWelcome = '$swapPath/swap_welcome.png';
  final swapUpload = '$swapPath/swap_upload_done.png';
  final swapDone = '$swapPath/swap_done.json';
}
