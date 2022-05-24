import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/styles.dart';

class CustomToast {
  static FToast fToast = FToast();
}

class CustomToastBuilder extends StatelessWidget {
  const CustomToastBuilder({
    Key? key,
    required this.msg,
    required this.icon,
  }) : super(key: key);
  final String msg;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.defaultPaddingVertical_16,
          vertical: S.dimens.defaultPaddingVertical_12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(S.dimens.defaultBorderRadius),
        color: S.colors.primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: S.dimens.defaultPaddingVertical_24,
          ),
          Text(
            msg,
            style: S.textStyles.toastStyle,
          ),
        ],
      ),
    );
  }
}
