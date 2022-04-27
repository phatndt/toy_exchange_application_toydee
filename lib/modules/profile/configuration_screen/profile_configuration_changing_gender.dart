import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';

class ProfileConfigurationGenderChanging extends StatefulWidget {
  final String label;
  const ProfileConfigurationGenderChanging({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<ProfileConfigurationGenderChanging> createState() =>
      _ProfileConfigurationGenderChangingState();
}

class _ProfileConfigurationGenderChangingState
    extends State<ProfileConfigurationGenderChanging> {
  String selectedGenderValue = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          Column(
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
              RadioListTile(
                selectedTileColor: S.colors.primary,
                activeColor: S.colors.primary,
                value: 'Male',
                title: Text(
                  'Male',
                  style: S.textStyles.titleHeavy,
                ),
                groupValue: selectedGenderValue,
                onChanged: (value) {
                  setState(() {
                    selectedGenderValue = 'Male';
                  });
                },
              ),
              RadioListTile(
                selectedTileColor: S.colors.primary,
                //tileColor: S.colors.textColor_1,
                activeColor: S.colors.primary,
                value: 'Femle',
                title: Text(
                  'Femle',
                  style: S.textStyles.titleHeavy,
                ),
                groupValue: selectedGenderValue,
                onChanged: (value) {
                  setState(() {
                    selectedGenderValue = 'Femle';
                  });
                },
              ),
              RadioListTile(
                selectedTileColor: S.colors.primary,
                //tileColor: S.colors.textColor_1,
                activeColor: S.colors.primary,
                value: 'Other',
                title: Text(
                  'Other',
                  style: S.textStyles.titleHeavy,
                ),
                groupValue: selectedGenderValue,
                onChanged: (value) {
                  setState(() {
                    selectedGenderValue = 'Other';
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CustomButton(
                  text: T.proConfigurationSave,
                  onPressed: () {
                    Navigator.of(context).pop(selectedGenderValue);
                  },
                  width: 350,
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
