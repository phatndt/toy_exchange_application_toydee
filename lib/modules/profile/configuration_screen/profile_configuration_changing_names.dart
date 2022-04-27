import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class ProfileConfigurationNamesChanging extends StatefulWidget {
  final String label1, label2;
  final String information1, information2;
  final TextInputType? textInputType;
  final List names;
  const ProfileConfigurationNamesChanging({
    Key? key,
    this.textInputType,
    required this.names,
    required this.label1,
    required this.label2,
    required this.information1,
    required this.information2,
  }) : super(key: key);

  @override
  State<ProfileConfigurationNamesChanging> createState() =>
      _ProfileConfigurationNamesChangingState();
}

class _ProfileConfigurationNamesChangingState
    extends State<ProfileConfigurationNamesChanging> {
  TextEditingController e = TextEditingController();
  TextEditingController f = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  NavigationService.goBack(
                      result: [widget.information1, widget.information2]);
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
                    widget.label1,
                    style: S.textStyles.h4,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Center(
                    child: CustomTextFormField(
                      height: 60,
                      hintText: widget.information1,
                      obscureText: false,
                      controller: e,
                      suffixIconData: GestureDetector(
                        onTap: () {
                          e.text = '';
                        },
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      inputType: widget.textInputType,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Text(
                    widget.label2,
                    style: S.textStyles.h4,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Center(
                    child: CustomTextFormField(
                      height: 60,
                      hintText: widget.information2,
                      obscureText: false,
                      controller: f,
                      suffixIconData: GestureDetector(
                        onTap: () {
                          f.text = '';
                        },
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      inputType: widget.textInputType,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_32,
                  ),
                  Center(
                    child: CustomButton(
                      text: T.proConfigurationSave,
                      onPressed: () {
                        Navigator.of(context)
                            .pop([e.text.toString(), f.text.toString()]);
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
