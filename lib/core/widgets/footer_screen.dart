import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routing/navigation_service.dart';
import '../styles/styles.dart';
import 'custom_icon_button.dart';
import 'custom_text_elevated_button.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({
    Key? key,
    required this.buttonContent,
    required this.onPressed,
  }) : super(key: key);

  final String buttonContent;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: S.dimens.defaultPaddingVertical_88,
      padding: EdgeInsets.symmetric(
        horizontal: S.dimens.defaultPadding_16,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: CustomButton(
          text: buttonContent,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
