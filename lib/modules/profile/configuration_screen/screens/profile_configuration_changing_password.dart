import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/changing_text_view_models.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileConfigurationPasswordChanging extends ConsumerWidget {
  final String label1, label2, label3;
  final String oldPassword;
  final String newPasswordConfirm;
  final String newPassword;
  final TextInputType? textInputType;
  final TextEditingController oldPasswordEditingController;
  final TextEditingController newPasswordConfirmEditingController;
  final TextEditingController newPasswordEditingController;
  final VoidCallback backPress;
  final VoidCallback savePress;
  final VoidCallback oldPasswordClearPress;
  final VoidCallback newPasswordConfirmClearPress;
  final VoidCallback newPasswordClearPress;
  ProfileConfigurationPasswordChanging({
    Key? key,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.newPassword,
    required this.oldPassword,
    required this.newPasswordConfirm,
    required this.newPasswordEditingController,
    required this.oldPasswordEditingController,
    required this.newPasswordConfirmEditingController,
    required this.backPress,
    required this.savePress,
    required this.oldPasswordClearPress,
    required this.newPasswordConfirmClearPress,
    required this.newPasswordClearPress,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: S.colors.background_1,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: S.dimens.defaultPadding_48,
              child: Center(
                child: Text(
                  T.proConScreenLabel,
                  style: S.textStyles.h5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: S.dimens.defaultPadding_16,
              ),
              child: CustomIconButton(
                text: FontAwesomeIcons.angleLeft,
                color: S.colors.primary,
                onPressed: backPress,
                backgroundColor: S.colors.accent_5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: S.dimens.defaultPadding_16,
                horizontal: S.dimens.defaultPadding_32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label1,
                    style: S.textStyles.h4,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Center(
                    child: CustomTextFormField(
                      height: 60,
                      hintText: '',
                      obscureText: true,
                      controller: oldPasswordEditingController,
                      suffixIconData: GestureDetector(
                        onTap: oldPasswordClearPress,
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      inputType: textInputType,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_32,
                  ),
                  Text(
                    label2,
                    style: S.textStyles.h4,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Center(
                    child: CustomTextFormField(
                      height: 60,
                      hintText: '',
                      obscureText: true,
                      controller: newPasswordEditingController,
                      suffixIconData: GestureDetector(
                        onTap: newPasswordClearPress,
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      inputType: textInputType,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_32,
                  ),
                  Text(
                    label3,
                    style: S.textStyles.h4,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Center(
                    child: CustomTextFormField(
                      height: 60,
                      hintText: '',
                      obscureText: true,
                      controller: newPasswordConfirmEditingController,
                      suffixIconData: GestureDetector(
                        onTap: newPasswordConfirmClearPress,
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      inputType: textInputType,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_32,
                  ),
                  Center(
                    child: CustomButton(
                      text: T.proConfigurationSave,
                      onPressed: savePress,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
