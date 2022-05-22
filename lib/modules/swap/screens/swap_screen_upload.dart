import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/components/swap_profile_card.dart';
import 'package:toy_exchange_application_toydee/modules/swap/viewmodels/swap_main_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../viewmodels/swap_upload_view_model.dart';

class SwapScreenTwo extends ConsumerWidget {
  const SwapScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_2,
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().screenHeight / 2.2,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(S.dimens.defaultPaddingVertical_4),
                    child: Image.file(File(ref
                        .watch(mainSwapSettingNotifierProvider.notifier)
                        .getList()[index])),
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    activeColor: S.colors.primary,
                    color: S.colors.accent_5,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: ScreenUtil().screenHeight / 2.2,
            //   child: Image.asset(R.images.homeToy_1),
            // ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: S.colors.background_1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(S.dimens.defaultBorderRadius),
                    topRight: Radius.circular(S.dimens.defaultBorderRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_24,
                      ),
                      Text(
                        ref
                            .watch(mainSwapSettingNotifierProvider)
                            .titleController
                            .text,
                        style: S.textStyles.h3,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      Text(
                        ref
                            .watch(mainSwapSettingNotifierProvider)
                            .descriptionController
                            .text,
                        style: S.textStyles.titleLight,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      const SwapProductCard(),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      toyInfo(ref, uploadSwapSettingNotifierProvider),
                      SizedBox(
                        height: S.dimens.defaultPaddingVertical_16,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.typo3,
                            color: S.colors.primary,
                          ),
                          SizedBox(
                            width: S.dimens.defaultPadding_8,
                          ),
                          Expanded(
                            child: Text(
                              ref
                                  .watch(uploadSwapSettingNotifierProvider
                                      .notifier)
                                  .convertCategories(ref
                                      .watch(mainSwapSettingNotifierProvider)
                                      .groupButtonControllerCategories
                                      .selectedIndexes),
                              style: S.textStyles.titleLight,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      // SizedBox(
                      //   height: S.dimens.defaultPadding_16,
                      // ),
                      bottomButton(
                        ref,
                        uploadSwapSettingNotifierProvider,
                        mainSwapSettingNotifierProvider,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toyInfo(
          WidgetRef ref,
          StateNotifierProvider<UploadSwapSettingNotifier, UploadSwapSetting>
              uploadSwapSettingNotifierProvider) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.faceGrin,
                color: S.colors.primary,
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Text(
                ref
                    .watch(uploadSwapSettingNotifierProvider.notifier)
                    .convertCondition(ref
                        .watch(mainSwapSettingNotifierProvider)
                        .groupButtonControllerCondition
                        .selectedIndex!),
                style: S.textStyles.titleLight,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.child,
                color: S.colors.primary,
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Text(
                ref
                    .watch(uploadSwapSettingNotifierProvider.notifier)
                    .convertGenderType(ref
                        .watch(mainSwapSettingNotifierProvider)
                        .groupButtonControllerGenderType
                        .selectedIndex!),
                style: S.textStyles.titleLight,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.magento,
                color: S.colors.primary,
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Text(
                ref
                    .watch(uploadSwapSettingNotifierProvider.notifier)
                    .convertAgeGroup(ref
                        .watch(mainSwapSettingNotifierProvider)
                        .groupButtonControllerAgeGroup
                        .selectedIndex!),
                style: S.textStyles.titleLight,
              )
            ],
          ),
        ],
      );

  Widget bottomButton(
    WidgetRef ref,
    StateNotifierProvider<UploadSwapSettingNotifier, UploadSwapSetting>
        uploadSwapSettingNotifierProvider,
    StateNotifierProvider<MainSwapSettingNotifier, MainSwapSetting>
        mainSwapSettingNotifierProvider,
  ) =>
      SizedBox(
        height: S.dimens.defaultPaddingVertical_88,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Upload",
                  onPressed: () {
                    ref
                        .watch(uploadSwapSettingNotifierProvider.notifier)
                        .uploadToyToFirebase(
                            imagePathOne: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .imagePathOne,
                            imagePathTwo: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .imagePathTwo,
                            imagePathThree: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .imagePathThree,
                            title: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .titleController
                                .text,
                            description: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .descriptionController
                                .text,
                            categories: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .groupButtonControllerCategories
                                .selectedIndexes,
                            condition: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .groupButtonControllerCondition
                                .selectedIndex!,
                            genderType: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .groupButtonControllerGenderType
                                .selectedIndex!,
                            ageGroup: ref
                                .watch(mainSwapSettingNotifierProvider)
                                .groupButtonControllerAgeGroup
                                .selectedIndex!);
                    // NavigationService.push(
                    //   page: RoutePaths.swapScreenDone,
                    //   isNamed: true,
                    // );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: S.dimens.defaultPadding_8),
                child: CustomIconButton(
                  text: FontAwesomeIcons.pencil,
                  onPressed: () {
                    NavigationService.goBack();
                  },
                  backgroundColor: S.colors.accent_5,
                  color: S.colors.primary,
                ),
              )
            ],
          ),
        ),
      );
}
