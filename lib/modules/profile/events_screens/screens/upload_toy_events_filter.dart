import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/styles/styles.dart';
import 'package:toy_exchange_application_toydee/core/styles/text.dart';
import 'package:toy_exchange_application_toydee/core/widgets/Toast.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/header_screen.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_main_view_model.dart';

class UploadToyEventsFilter extends ConsumerWidget {
  const UploadToyEventsFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: S.dimens.defaultPadding_16,
            ),
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: HeaderScreen(title: T.filterTitle),
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
                ),
                Container(
                  //height: MediaQuery.of(context).size.height,
                  color: S.colors.background_2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: S.dimens.defaultPadding_16,
                      ),
                      Text(
                        T.filterSelect,
                        style: S.textStyles.h4,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_8,
                      ),
                      Center(
                        child: buildGroupButton(
                          list: T.listCategories,
                          buttonWidth: 150,
                          isRadio: false,
                          controller: ref
                              .watch(mainToyEventSettingNotifierProvider)
                              .groupButtonControllerCategories,
                          onSelected: (index, isSelected) {
                            // if (isSelected) {
                            //   ref
                            //       .watch(
                            //           mainSwapSettingNotifierProvider.notifier)
                            //       .addCategories(index);
                            // } else {
                            //   ref
                            //       .watch(
                            //           mainSwapSettingNotifierProvider.notifier)
                            //       .removeCategories(index);
                            // }
                          },
                        ),
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_16,
                      ),
                      Text(
                        T.filterCondition,
                        style: S.textStyles.h4,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_8,
                      ),
                      Center(
                        child: buildGroupButton(
                          list: T.listCondition,
                          buttonWidth: 150,
                          isRadio: true,
                          controller: ref
                              .watch(mainToyEventSettingNotifierProvider)
                              .groupButtonControllerCondition,
                          onSelected: (index, isSelected) {
                            // ref
                            //     .watch(mainSwapSettingNotifierProvider.notifier)
                            //     .selectCondition(index);
                          },
                        ),
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_16,
                      ),
                      Text(
                        T.filterSuitable,
                        style: S.textStyles.h4,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_8,
                      ),
                      Center(
                        child: buildGroupButton(
                          list: T.listSuitable,
                          buttonWidth: 100,
                          isRadio: true,
                          controller: ref
                              .watch(mainToyEventSettingNotifierProvider)
                              .groupButtonControllerGenderType,
                          onSelected: (index, isSelected) {
                            // ref
                            //     .watch(mainSwapSettingNotifierProvider.notifier)
                            //     .selectGenderType(index);
                          },
                        ),
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_16,
                      ),
                      Text(
                        T.filterAge,
                        style: S.textStyles.h4,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GroupButton(
                          controller: ref
                              .watch(mainToyEventSettingNotifierProvider)
                              .groupButtonControllerAgeGroup,
                          isRadio: true,
                          buttons: T.listAge,
                          enableDeselect: true,
                          options: GroupButtonOptions(
                            selectedTextStyle: S.textStyles.titleLight,
                            unselectedTextStyle: S.textStyles.titleLight,
                            groupingType: GroupingType.row,
                            selectedShadow: const <BoxShadow>[
                              BoxShadow(color: Colors.transparent)
                            ],
                            unselectedShadow: const <BoxShadow>[
                              BoxShadow(color: Colors.transparent)
                            ],
                            selectedColor: S.colors.primary,
                            unselectedColor: S.colors.background_1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(S.dimens.defaultPadding_8)),
                            spacing: 15,
                            buttonWidth: 100,
                            buttonHeight: 50,
                          ),
                          onSelected: (index, isSelected) {
                            // ref
                            //     .watch(mainSwapSettingNotifierProvider.notifier)
                            //     .selectAgeGroup(index);
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: S.dimens.defaultPadding_16,
                      // ),
                      // Text(
                      //   T.filterPriceRange,
                      //   style: S.textStyles.h4,
                      // ),
                      // SizedBox(
                      //   height: S.dimens.defaultPadding_8,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(100)),
                      //     color: S.colors.background_1,
                      //   ),
                      //   padding: EdgeInsets.zero,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       ElevatedButton(
                      //         onPressed: minusIndex,
                      //         child: const Icon(FontAwesomeIcons.minus),
                      //         style: ElevatedButton.styleFrom(
                      //           elevation: 2.0,
                      //           shape: const CircleBorder(),
                      //           primary: S.colors.accent_5,
                      //           onPrimary: S.colors.primary,
                      //         ),
                      //       ),
                      //       Text(
                      //         '$_index',
                      //         style: S.textStyles.titleHeavy,
                      //       ),
                      //       ElevatedButton(
                      //         onPressed: plusIndex,
                      //         child: const Icon(FontAwesomeIcons.plus),
                      //         style: ElevatedButton.styleFrom(
                      //           elevation: 2.0,
                      //           shape: const CircleBorder(),
                      //           primary: S.colors.accent_5,
                      //           onPrimary: S.colors.primary,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.symmetric(
                            vertical: S.dimens.defaultPadding_8),
                        child: TextButton(
                            onPressed: () => ref
                                .watch(mainToyEventSettingNotifierProvider
                                    .notifier)
                                .clearFilters(),
                            child: Text(
                              T.filterClean,
                              style: S.textStyles.titleLight,
                            )),
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_88,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CustomButton(
                            text: T.filterApply,
                            onPressed: () {
                              if (ref
                                      .watch(
                                          mainToyEventSettingNotifierProvider)
                                      .groupButtonControllerCategories
                                      .selectedIndexes
                                      .isEmpty ||
                                  ref
                                          .watch(
                                              mainToyEventSettingNotifierProvider)
                                          .groupButtonControllerCondition
                                          .selectedIndex ==
                                      null ||
                                  ref
                                          .watch(
                                              mainToyEventSettingNotifierProvider)
                                          .groupButtonControllerGenderType
                                          .selectedIndex ==
                                      null ||
                                  ref
                                          .watch(
                                              mainToyEventSettingNotifierProvider)
                                          .groupButtonControllerAgeGroup
                                          .selectedIndex ==
                                      null) {
                                CustomToast.fToast.init(context);
                                CustomToast.fToast.showToast(
                                    gravity: ToastGravity.TOP,
                                    child: const CustomToastBuilder(
                                        msg: "Please select all filters",
                                        icon: FontAwesomeIcons.exclamation));
                              } else {
                                NavigationService.goBack();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GroupButton buildGroupButton({
    required List<String> list,
    required double buttonWidth,
    required bool isRadio,
    required GroupButtonController controller,
    required Function(int i, bool y) onSelected,
  }) {
    return GroupButton(
      controller: controller,
      options: GroupButtonOptions(
        selectedTextStyle: S.textStyles.titleLight,
        unselectedTextStyle: S.textStyles.titleLight,
        selectedShadow: const <BoxShadow>[BoxShadow(color: Colors.transparent)],
        unselectedShadow: const <BoxShadow>[
          BoxShadow(color: Colors.transparent)
        ],
        selectedColor: S.colors.primary,
        unselectedColor: S.colors.background_1,
        borderRadius:
            BorderRadius.all(Radius.circular(S.dimens.defaultPadding_8)),
        mainGroupAlignment: MainGroupAlignment.center,
        crossGroupAlignment: CrossGroupAlignment.center,
        groupRunAlignment: GroupRunAlignment.spaceEvenly,
        spacing: 15,
        buttonWidth: buttonWidth,
        buttonHeight: 50,
      ),
      isRadio: isRadio,
      enableDeselect: true,
      buttons: list,
      onSelected: onSelected,
    );
  }
}
