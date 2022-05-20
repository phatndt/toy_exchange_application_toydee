import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';

class SwappScreenThree extends StatelessWidget {
  const SwappScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            header(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: S.dimens.defaultPadding_32),
                child: Column(
                  children: [
                    Text(
                      "Your unique toy has been uploaded",
                      style: S.textStyles.h5,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPaddingVertical_8,
                    ),
                    Text(
                      "Thank you for supporting our causes! Your item will be visible soon",
                      style: S.textStyles.titleHeavy,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    bottomButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget header() => SizedBox(
        height: 500.h,
        child: Stack(
          children: [
            SizedBox(
              height: 440.h,
              child: Image.asset(R.images.swapUpload),
            ),
            Positioned(
              top: 350.h,
              left: 0,
              right: 0,
              child: LottieBuilder.asset(
                R.images.swapDone,
                height: 180.h,
                width: 180.w,
              ),
            )
          ],
        ),
      );

  Widget bottomButton() => SizedBox(
        height: S.dimens.defaultPaddingVertical_88,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Show my items",
                  onPressed: () {
                    NavigationService.push(
                      page: RoutePaths.swapScreenDone,
                      isNamed: true,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: S.dimens.defaultPadding_8),
                child: CustomIconButton(
                  text: FontAwesomeIcons.house,
                  onPressed: () {
                    NavigationService.pushAndRemoveUntil(
                        isNamed: true,
                        page: RoutePaths.mainScreen,
                        predicate: (Route<dynamic> route) => false);
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
