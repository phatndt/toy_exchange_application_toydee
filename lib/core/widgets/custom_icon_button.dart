import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/styles/styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.width = 45,
    required this.text,
    required this.onPressed,
    this.color,
    required this.backgroundColor,
  }) : super(key: key);

  final double width;
  final IconData text;
  final VoidCallback onPressed;
  final Color? color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: width,
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(S.dimens.defaultBorderRadius),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(1),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(12)),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          ),
          child: Icon(
            text,
            color: color,
          ),
        ),
      ),
    );
  }
}
