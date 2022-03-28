import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(S.colors.primary),
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
