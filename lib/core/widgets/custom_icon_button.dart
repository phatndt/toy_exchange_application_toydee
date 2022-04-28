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
      height: ScreenUtil().scaleHeight * 55.79710144927537,
      width: width ?? ScreenUtil().scaleHeight * 55.79710144927537,
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
            elevation: MaterialStateProperty.all<double>(elevation),
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
