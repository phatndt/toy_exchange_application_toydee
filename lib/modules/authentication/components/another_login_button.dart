import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/styles/styles.dart';

class AnotherLoginButton extends StatelessWidget {
  const AnotherLoginButton({
    Key? key,
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(S.dimens.defaultBorderRadius),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(2),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(12)),
          backgroundColor:
              MaterialStateProperty.all<Color>(S.colors.background_2),
        ),
        child: Image.asset(
          text,
          scale: 0.2,
        ),
      ),
    );
  }
}
