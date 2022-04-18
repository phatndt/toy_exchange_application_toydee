import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    required this.obscureText,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    required this.controller,
    this.focusNode,
    this.width = double.infinity,
    this.height = 50,
    this.maxLines = 1,
  }) : super(key: key);

  final FocusNode? focusNode;
  final String hintText;
  final Widget? prefixIconData;
  final Widget? suffixIconData;
  final bool obscureText;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final Function(String? value)? onFieldSubmitted;
  final TextInputType? inputType;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        focusNode: focusNode,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: inputType,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        style: S.textStyles.titleHeavy,
        decoration: InputDecoration(
          hintStyle: S.textStyles.titleLight,
          hintText: hintText,
          enabledBorder: S.inputBorders.inputBorderStyle,
          filled: true,
          fillColor: S.colors.background_2,
          focusedBorder: S.inputBorders.inputFocusedBorderStyle,
          focusedErrorBorder: S.inputBorders.inputFocusedErrorBorderStyle,
          errorBorder: S.inputBorders.inputErrorBorderStyle,
          prefixIcon: prefixIconData,
          suffixIcon: suffixIconData,
        ),
      ),
    );
  }
}
