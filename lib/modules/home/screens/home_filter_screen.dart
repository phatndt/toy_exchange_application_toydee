import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';

import '../../../core/routing/route_paths.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

final _groupButtonController1 = GroupButtonController();
final _groupButtonController2 = GroupButtonController();
final _groupButtonController3 = GroupButtonController();
final _groupButtonController4 = GroupButtonController();

class HomeFilterScreen extends StatelessWidget {
  const HomeFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: S.colors.background_1,
          body: ListView(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: S.dimens.defaultPadding_8),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    T.filterTitle,
                    style: S.textStyles.h5,
                  )
                ]),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: S.dimens.defaultPadding_8),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: S.dimens.defaultPadding_8),
                      child: CustomIconButton(
                          backgroundColor: S.colors.accent_5,
                          color: S.colors.primary,
                          text: FontAwesomeIcons.angleLeft,
                          onPressed: () {
                            NavigationService.goBack();
                          }),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 315.0,
                      child: TextField(
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
                  ],
                ),
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
                      child: buildGroupButton(T.listCategories, 150, false,
                          _groupButtonController1),
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
                        child: buildGroupButton(T.listCondition, 150, true,
                            _groupButtonController2)),
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
                          T.listSuitable, 100, true, _groupButtonController3),
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
                        controller: _groupButtonController4,
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
                          unselectedColor: S.colors.background_1,
                          borderRadius: BorderRadius.all(
                              Radius.circular(S.dimens.defaultPadding_8)),
                          spacing: 15,
                          buttonWidth: 100,
                          buttonHeight: 50,
                        ),
                        onSelected: (index, isSelected) =>
                            print('$index button is selected'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.symmetric(
                          horizontal: S.dimens.defaultPadding_8,
                          vertical: S.dimens.defaultPadding_8),
                      child: TextButton(
                          onPressed: () => cleanFilters(),
                          child: Text(
                            T.filterClean,
                            style: S.textStyles.titleLight,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: S.dimens.defaultPadding_32,
                        right: S.dimens.defaultPadding_32,
                        bottom: S.dimens.defaultPadding_32,
                      ),
                      child: CustomButton(
                        text: T.filterApply,
                        width: 0,
                        onPressed: () {},
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
        buttonWidth: buttonwidth,
        buttonHeight: 50,
      ),
      isRadio: isradio,
      enableDeselect: true,
      buttons: list,
      onSelected: (index, isSelected) => print('$index button is selected'),
    );
  }

  void cleanFilters() {
    _groupButtonController1.unselectAll();
    _groupButtonController2.unselectAll();
    _groupButtonController3.unselectAll();
    _groupButtonController4.unselectAll();
  }
}
