import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../../profile/components/swap_profile_card.dart';

class HomeToyDetailScreen extends StatelessWidget {
  const HomeToyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: S.colors.background_2,
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().screenWidth - 10,
              child: Stack(children: [
                Image.asset(R.images.homeToy_1),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: S.dimens.defaultPadding_48,
                      ),
                      CustomIconButton(
                        text: FontAwesomeIcons.angleLeft,
                        backgroundColor: S.colors.background_2,
                        color: S.colors.primary,
                        onPressed: () {
                          NavigationService.goBack();
                        },
                      ),
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
                        height: S.dimens.defaultPadding_32,
                      ),
                      Text(
                        "Tobbie the futuristic Robot",
                        style: S.textStyles.h3,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_8,
                      ),
                      SizedBox(
                        width: 323.6231884057971.h,
                        child: Text(
                          "A huggable plush Bear in the height of 25 cm, durable, resistant to stains, and easy to maintain. Made with the finest ultra-soft plush materials and premium stuffing.",
                          style: S.textStyles.titleLight,
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
                                FontAwesomeIcons.faceGrin,
                                color: S.colors.primary,
                              ),
                              SizedBox(
                                width: S.dimens.defaultPadding_8,
                              ),
                              Text(
                                "New",
                                style: S.textStyles.titleLight,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.retweet,
                                color: S.colors.primary,
                              ),
                              SizedBox(
                                width: S.dimens.defaultPadding_8,
                              ),
                              Text(
                                "Swap",
                                style: S.textStyles.titleLight,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.eye,
                                color: S.colors.primary,
                              ),
                              SizedBox(
                                width: S.dimens.defaultPadding_8,
                              ),
                              Text(
                                "New",
                                style: S.textStyles.titleLight,
                              )
                            ],
                          )
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_88,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CustomButton(
                            text: "Request swap",
                            onPressed: () {
                              NavigationService.push(
                                page: RoutePaths.swapScreenDone,
                                isNamed: true,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
