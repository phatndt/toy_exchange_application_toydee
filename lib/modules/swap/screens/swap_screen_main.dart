import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_form_field.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_outline_button.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';

class SwapScreenOne extends StatelessWidget {
  const SwapScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController e = TextEditingController();
    TextEditingController f = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: S.dimens.defaultPadding_48,
                ),
                CustomIconButton(
                  text: FontAwesomeIcons.angleLeft,
                  backgroundColor: S.colors.background_2,
                  onPressed: () {
                    NavigationService.goBack();
                  },
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Text(
                  T.swapUploadPhotosOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: S.colors.lavender,
                        borderRadius: BorderRadius.all(
                          Radius.circular(S.dimens.defaultBorderRadius),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Icon(FontAwesomeIcons.plus),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: S.colors.lavender,
                        borderRadius: BorderRadius.all(
                          Radius.circular(S.dimens.defaultBorderRadius),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Icon(FontAwesomeIcons.plus),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: S.colors.lavender,
                        borderRadius: BorderRadius.all(
                          Radius.circular(S.dimens.defaultBorderRadius),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Icon(FontAwesomeIcons.plus),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_24,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    T.swapUploadPhotosDescriptionOne,
                    style: S.textStyles.titleLightNoSpacing,
                  ),
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                CustomTextOuntlineButton(
                  text: T.swapUploadPhotoButtonOne,
                  onPressed: () {},
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Text(
                  T.swapUploadPhotosWarningWelcome,
                  style: S.textStyles.titleLightNoSpacing,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Text(
                  T.swapTitleOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                CustomTextFormField(
                    hintText: T.swapTitleContentOne,
                    obscureText: false,
                    controller: e),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Text(
                  T.swapFiltersOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                CustomTextFormField(
                    hintText: T.swapFiltersContentOne,
                    obscureText: false,
                    controller: e),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Text(
                  T.swapDescriptionOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                CustomTextFormField(
                  hintText: "Search",
                  obscureText: false,
                  controller: f,
                  maxLines: 5,
                  height: 150,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Text(
                  T.swapLocationTitle,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                CustomTextFormField(
                  hintText: T.swapLocationnContent,
                  obscureText: false,
                  controller: f,
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      T.swapCheckBoxOneContent,
                      style: S.textStyles.titleHeavy,
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        side: BorderSide(width: 2, color: S.colors.gray_3),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        value: false,
                        onChanged: (value) {},
                        checkColor: S.colors.background_1,
                        fillColor:
                            MaterialStateProperty.all<Color>(S.colors.primary),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      T.swapCheckBoxOneContent,
                      style: S.textStyles.titleHeavy,
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        side: BorderSide(width: 2, color: S.colors.gray_3),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        value: false,
                        onChanged: (value) {},
                        checkColor: S.colors.background_1,
                        fillColor:
                            MaterialStateProperty.all<Color>(S.colors.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_24,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_16),
                  child: CustomButton(
                    text: T.swapButtonContent,
                    onPressed: () {
                      NavigationService.push(
                        page: RoutePaths.swapScreenUpload,
                        isNamed: true,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
