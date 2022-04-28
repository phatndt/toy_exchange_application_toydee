import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class ProfileConfigurationTextChanging extends StatefulWidget {
  final String label;
  final String information;
  final TextInputType? textInputType;
  const ProfileConfigurationTextChanging({
    Key? key,
    required this.label,
    required this.information,
    this.textInputType,
  }) : super(key: key);

  @override
  State<ProfileConfigurationTextChanging> createState() =>
      _ProfileConfigurationTextChangingState();
}

class _ProfileConfigurationTextChangingState
    extends State<ProfileConfigurationTextChanging> {
  TextEditingController e = TextEditingController();
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
                  NavigationService.goBack(result: widget.information);
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
                    widget.label,
                    style: S.textStyles.h4,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Center(
                    child: CustomTextFormField(
                      height: 60,
                      hintText: widget.information,
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
                    height: S.dimens.defaultPadding_32,
                  ),
                  Center(
                    child: CustomButton(
                      text: T.proConfigurationSave,
                      onPressed: () {
                        Navigator.of(context).pop(e.text.toString());
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
