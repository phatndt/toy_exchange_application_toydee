import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CustomTextOuntlineButton extends StatelessWidget {
  const CustomTextOuntlineButton({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
      child: SizedBox(
        height: 50,
        width: width,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(S.dimens.defaultBorderRadius),
              ),
            ),
            side: BorderSide(
              width: 2.0,
              color: S.colors.primary,
            ),
            primary: S.colors.gray_2,
          ),
          child: Center(
            child: Text(
              text,
              style: S.textStyles.h4,
            ),
          ),
        ),
      ),
    );
  }
}
