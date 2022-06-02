import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/changing_gender_view_models.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';

class ProfileConfigurationGenderChanging extends ConsumerWidget {
  final String label;
  final String information;
  ProfileConfigurationGenderChanging({
    Key? key,
    required this.label,
    required this.information,
  }) : super(key: key);

  final groupButtonController = GroupButtonController();
  String selectedGenderValue = '0';
  bool _isButtonDisabled = true;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    ref
                        .watch(configurationChangingGenderNotifierProvider
                            .notifier)
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: S.dimens.defaultPadding_16,
                          horizontal: S.dimens.defaultPadding_16),
                      child: Text(
                        label,
                        style: S.textStyles.h4,
                      ),
                    ),
                    Center(
                      child: GroupButton(
                          buttons: T.listGender,
                          isRadio: true,
                          controller: ref
                              .watch(
                                  configurationChangingGenderNotifierProvider)
                              .groupButtonController,
                          enableDeselect: true,
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
                          onSelected: (index, isSelected) {}),
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
                          ref
                              .watch(configurationChangingGenderNotifierProvider
                                  .notifier)
                              .saveChanges();
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
