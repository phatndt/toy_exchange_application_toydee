import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/changing_names_view_models.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/custom_text_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileConfigurationNamesChanging extends ConsumerWidget {
  final String label1, label2;
  final String information1, information2;
  final TextInputType? textInputType;
  final String firstName;
  final String lastName;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  ProfileConfigurationNamesChanging({
    Key? key,
    this.textInputType,
    required this.firstName,
    required this.lastName,
    required this.label1,
    required this.label2,
    required this.information1,
    required this.information2,
    required this.lastNameController,
    required this.firstNameController,
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
                onPressed: () {
                  ref
                      .watch(
                          configurationChangingNamesNotifierProvider.notifier)
                      .navigationBack();
                },
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
                      hintText: information1,
                      obscureText: false,
                      controller: firstNameController,
                      suffixIconData: GestureDetector(
                        onTap: () {
                          firstNameController.clear();
                        },
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      inputType: textInputType,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
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
                      hintText: information2,
                      obscureText: false,
                      controller: lastNameController,
                      suffixIconData: GestureDetector(
                        onTap: () {
                          lastNameController.clear();
                        },
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
                      onPressed: () {
                        ref
                            .watch(configurationChangingNamesNotifierProvider
                                .notifier)
                            .saveChanges();
                      },
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
