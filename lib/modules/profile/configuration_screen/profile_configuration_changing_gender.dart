import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';

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
  final groupButtonController = GroupButtonController();
  String selectedGenderValue = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: S.colors.background_1,
          body: Column(
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
                      result: 'Adu',
                    );
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: S.dimens.defaultPadding_16,
                          horizontal: S.dimens.defaultPadding_16),
                      child: Text(
                        widget.label,
                        style: S.textStyles.h4,
                      ),
                    ),
                    Center(
                      child: GroupButton(
                        buttons: T.listGender,
                        controller: groupButtonController,
                        enableDeselect: false,
                        options: GroupButtonOptions(
                          selectedTextStyle: S.textStyles.titleLight,
                          unselectedTextStyle: S.textStyles.titleLight,
                          groupingType: GroupingType.column,
                          selectedShadow: const <BoxShadow>[
                            BoxShadow(color: Colors.transparent)
                          ],
                          unselectedShadow: const <BoxShadow>[
                            BoxShadow(color: Colors.transparent)
                          ],
                          selectedColor: S.colors.primary,
                          unselectedColor: S.colors.background_2,
                          borderRadius: BorderRadius.all(
                              Radius.circular(S.dimens.defaultPadding_8)),
                          spacing: 15,
                          buttonWidth: 120,
                          buttonHeight: 60,
                        ),
                        onSelected: (index, isSelected) =>
                            selectedGenderValue = '$index',
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_32,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_32,
                      ),
                      child: CustomButton(
                        text: T.proConfigurationSave,
                        onPressed: () {
                          Navigator.of(context)
                              .pop(int.parse(selectedGenderValue));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
