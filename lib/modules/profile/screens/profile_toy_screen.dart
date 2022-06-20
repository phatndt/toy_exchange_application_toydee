import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/services/converter.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../home/view_models/home_view_model.dart';
import '../components/swap_profile_card.dart';
import 'viewmodels/profile_view_models.dart';

class ProfileToyScreen extends ConsumerWidget {
  const ProfileToyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final future = ref.watch(swapToyProvider(args));
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: S.colors.background_2,
        body: future.when(
            data: (data) {
              return Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().screenWidth - 20,
                    child: Stack(children: [
                      SizedBox(
                        child: Swiper(
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      S.dimens.defaultPaddingVertical_4),
                              child: Container(
                                height: ScreenUtil().scaleHeight * 180,
                                decoration: BoxDecoration(
                                  color: S.colors.lavender,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        S.dimens.defaultBorderRadius),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(data!.image[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: S.dimens.defaultPadding_16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: S.dimens.defaultPadding_48,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomIconButton(
                                  text: FontAwesomeIcons.angleLeft,
                                  backgroundColor: S.colors.background_2,
                                  color: S.colors.primary,
                                  onPressed: () {
                                    NavigationService.goBack();
                                  },
                                ),
                                CustomIconButton(
                                  text: FontAwesomeIcons.trash,
                                  backgroundColor: S.colors.background_2,
                                  color: S.colors.primary,
                                  onPressed: () {
                                    ref
                                        .watch(profileNotifierProvider.notifier)
                                        .deleteToy(context, data!.id);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: S.colors.background_1,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(S.dimens.defaultBorderRadius),
                          topRight:
                              Radius.circular(S.dimens.defaultBorderRadius),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: S.dimens.defaultPadding_32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            Text(
                              data!.name,
                              style: S.textStyles.h3,
                            ),
                            SizedBox(
                              height: S.dimens.defaultPadding_8,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 80.h,
                              ),
                              child: Text(
                                data.description,
                                overflow: TextOverflow.ellipsis,
                                style: S.textStyles.titleLight,
                                maxLines: 4,
                              ),
                            ),
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            const SwapProductCard(),
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      data.toyType.condition == 0
                                          ? FontAwesomeIcons.faceGrin
                                          : FontAwesomeIcons.faceFrown,
                                      color: S.colors.primary,
                                    ),
                                    SizedBox(
                                      width: S.dimens.defaultPadding_8,
                                    ),
                                    Text(
                                      Converter.convertCondition(
                                          data.toyType.condition),
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
                                      Converter.convertGenderType(
                                          data.toyType.genderType),
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
                                      Converter.convertAgeGroup(
                                          data.toyType.ageGroup),
                                      style: S.textStyles.titleLight,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
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
                                    Converter.convertCategories(
                                        data.toyType.categories.toSet()),
                                    style: S.textStyles.titleLight,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error, stack) => Text(""),
            loading: () => Text("")),
      ),
    );
  }
}
