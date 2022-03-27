import 'package:flutter/material.dart';

class S {
  static final colors = _Colors();
  static final textStyles = _TextStyles();
  static final dimens = _Dimens();

  static final TextStyle h2 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: S.colors.textColor_1,
  );
}

class _Colors {
  final primary = const Color(0xFFF8956F);

  //Accent
  final accent_1 = const Color(0xFFFF6263); // Bitter sweet
  final accent_2 = const Color(0xFFFF936B); // Atomic Tangerine
  final accent_3 = const Color(0xFFFFB3B3); // Meion
  final accent_4 = const Color(0xFFFFDD66); // Dandelion

  //Logo
  final logo1 = const Color(0xFFFF6263); // red
  final logo2 = const Color(0xFF6455AB); // blue purple

  //Background
  final background_1 = const Color(0xFFF4F5F9); // background
  final background_2 = const Color(0xFFFFFFFF); // background text field

  //Grays
  final gray_1 = const Color(0xFF5D6178); // Dark Electric Blue
  final gray_2 = const Color(0xFF898C9F); // Cool Grey
  final gray_3 = const Color(0xFFBBBCC9); // Lavender Gray
  final gray_4 = const Color(0xFFDFE0E7); // Platinum
  final gray_5 = const Color(0xFFF5F6F8); // Cultured

  //Text color
  final textColor_1 = const Color(0xFF261F41);
}

class _TextStyles {
  final h2 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: S.colors.textColor_1,
  );
  final h3 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
  );
  final TextStyle h4 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: S.colors.textColor_1,
  );
  final titleHeavy = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: S.colors.textColor_1,
  );
  final titleLight = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: S.colors.textColor_1,
  );
}

class _Dimens {
  final defaultPadding_8 = 8.0;
  final defaultPadding_16 = 16.0;
  final defaultPadding_24 = 24.0;
  final defaultPadding_32 = 32.0;
  final defaultPadding_40 = 40.0;
  final defaultPadding_64 = 64.0;

  final defaultBorderRadius = 8.0;
}