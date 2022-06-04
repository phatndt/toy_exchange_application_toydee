import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/home/viewmodels/home_filter_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';

import '../../../core/routing/route_paths.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class HomeFilterScreen extends ConsumerWidget {
  const HomeFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: S.colors.background_1,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.defaultPadding_8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      T.filterTitle,
                      style: S.textStyles.h3,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.defaultPadding_8,
                  horizontal: S.dimens.defaultPadding_16,
                ),
                child: Row(
                  children: [
                    CustomIconButton(
                      backgroundColor: S.colors.accent_5,
                      color: S.colors.primary,
                      elevation: 0.5,
                      text: FontAwesomeIcons.arrowLeft,
                      onPressed: () {
                        ref
                            .watch(homeFilterNotifierProvider.notifier)
                            .navigationBack(context);
                      },
                    ),
                    SizedBox(
                      width: S.dimens.defaultPadding_8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 55.79710144927537.h,
                        child: TextFormField(
                          style: S.textStyles.titleLight,
                          textAlignVertical: TextAlignVertical.bottom,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: S.colors.background_2,
                            hintText: T.filterSearch,
                            hintStyle: S.textStyles.titleLight,
                            prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: S.dimens.defaultPadding_8,
                                    vertical: S.dimens.defaultPadding_8),
                                child: const Icon(Icons.search)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(S.dimens.defaultPadding_8)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: S.colors.background_2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(S.dimens.defaultBorderRadius),
                    topRight: Radius.circular(S.dimens.defaultBorderRadius),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: S.dimens.defaultPadding_16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: S.dimens.defaultPadding_16),
                      child: Text(
                        T.filterSelect,
                        style: S.textStyles.h4,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_8,
                    ),
                    Center(
                      child: buildGroupButton(
                        T.listCategories,
                        150,
                        false,
                        ref
                            .watch(homeFilterNotifierProvider)
                            .groupButtonControllerCategories,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_16,
                      ),
                      child: Text(
                        T.filterCondition,
                        style: S.textStyles.h4,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_8,
                    ),
                    Center(
                      child: buildGroupButton(
                          T.listCondition,
                          150,
                          true,
                          ref
                              .watch(homeFilterNotifierProvider)
                              .groupButtonControllerCondition),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_16,
                      ),
                      child: Text(
                        T.filterSuitable,
                        style: S.textStyles.h4,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_8,
                    ),
                    Center(
                      child: buildGroupButton(
                          T.listSuitable,
                          100,
                          true,
                          ref
                              .watch(homeFilterNotifierProvider)
                              .groupButtonControllerGenderType),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_16,
                      ),
                      child: Text(
                        T.filterAge,
                        style: S.textStyles.h4,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_8,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GroupButton(
                          controller: ref
                              .watch(homeFilterNotifierProvider)
                              .groupButtonControllerAgeGroup,
                          isRadio: true,
                          buttons: T.listAge,
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
                            unselectedColor: S.colors.gray_5,
                            borderRadius: BorderRadius.all(
                                Radius.circular(S.dimens.defaultPadding_8)),
                            spacing: 15,
                            buttonWidth: 100,
                            buttonHeight: 50,
                          ),
                          onSelected: (index, isSelected) {}
                          //print('$index button is selected'),
                          ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.symmetric(
                          horizontal: S.dimens.defaultPadding_16,
                          vertical: S.dimens.defaultPadding_8),
                      child: TextButton(
                          onPressed: ref
                              .watch(homeFilterNotifierProvider.notifier)
                              .clearFilter,
                          child: Text(
                            T.filterClean,
                            style: S.textStyles.titleLight,
                          )),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_88,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: S.dimens.defaultPadding_32),
                          child: CustomButton(
                            text: T.filterApply,
                            onPressed: () => NavigationService.push(
                              page: RoutePaths.homeFilterResultScreen,
                              isNamed: true,
                              arguments: ToyType(
                                categories: ref
                                    .watch(homeFilterNotifierProvider)
                                    .groupButtonControllerCategories
                                    .selectedIndexes
                                    .toList(),
                                condition: ref
                                    .watch(homeFilterNotifierProvider)
                                    .groupButtonControllerCondition
                                    .selectedIndex ?? -1,
                                genderType: ref
                                    .watch(homeFilterNotifierProvider)
                                    .groupButtonControllerGenderType
                                    .selectedIndex?? -1,
                                ageGroup: ref
                                    .watch(homeFilterNotifierProvider)
                                    .groupButtonControllerAgeGroup
                                    .selectedIndex?? -1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  GroupButton buildGroupButton(List<String> list, double buttonwidth,
      bool isradio, GroupButtonController control) {
    return GroupButton(
        controller: control,
        options: GroupButtonOptions(
          selectedTextStyle: S.textStyles.titleLight,
          unselectedTextStyle: S.textStyles.titleLight,
          selectedShadow: const <BoxShadow>[
            BoxShadow(color: Colors.transparent)
          ],
          unselectedShadow: const <BoxShadow>[
            BoxShadow(color: Colors.transparent)
          ],
          selectedColor: S.colors.primary,
          unselectedColor: S.colors.gray_5,
          borderRadius:
              BorderRadius.all(Radius.circular(S.dimens.defaultPadding_8)),
          mainGroupAlignment: MainGroupAlignment.center,
          crossGroupAlignment: CrossGroupAlignment.center,
          groupRunAlignment: GroupRunAlignment.spaceEvenly,
          spacing: 15,
          buttonWidth: buttonwidth,
          buttonHeight: 50,
        ),
        isRadio: isradio,
        enableDeselect: true,
        buttons: list,
        onSelected: (index, isSelected) {});
  }
}
