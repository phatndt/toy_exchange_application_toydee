import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/styles.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.width,
    required this.text,
    required this.onPressed,
    this.color,
    required this.backgroundColor,
    this.elevation = 1,
  }) : super(key: key);

  final double? width;
  final IconData text;
  final VoidCallback onPressed;
  final Color? color;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //default size is 50 in pixel 4a, it will be change
      height: (3850 / 69).h,
      width: width ?? (1265 / 24).w,
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
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            elevation: MaterialStateProperty.all<double>(elevation),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          ),
          child: Center(
            child: Icon(
              text,
              color: color,
              size: (1.h / 1.w) * 24,
            ),
          ),
        ),
      ),
    );
  }
}
