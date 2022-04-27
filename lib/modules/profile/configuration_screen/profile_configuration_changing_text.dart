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

  const ProfileConfigurationTextChanging({
    Key? key,
    required this.label,
    required this.information,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: S.dimens.defaultPadding_16),
            child: Center(
              child: Text(
                T.proConScreenLabel,
                style: S.textStyles.h5,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CustomIconButton(
              text: FontAwesomeIcons.angleLeft,
              color: S.colors.primary,
              onPressed: () {
                NavigationService.goBack();
              },
              backgroundColor: S.colors.accent_5,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: S.dimens.defaultPadding_16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: S.dimens.defaultPadding_16,
                      horizontal: S.dimens.defaultPadding_16),
                  child: Text(
                    widget.label,
                    style: S.textStyles.titleHeavyPrimary,
                  ),
                ),
                Center(
                  child: CustomTextFormField(
                    width: 350,
                    hintText: widget.information,
                    obscureText: false,
                    controller: e,
                    suffixIconData: GestureDetector(
                      onTap: () {
                        e.text = '';
                      },
                      child: const Icon(FontAwesomeIcons.xmark),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomButton(
                    text: T.proConfigurationSave,
                    onPressed: () {
                      Navigator.of(context).pop(e.text.toString());
                    },
                    width: 350,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
