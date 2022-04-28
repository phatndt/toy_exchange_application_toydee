import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class SwapWelcomeScreen extends StatelessWidget {
  const SwapWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SizedBox(
          height: ScreenUtil().screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              body(),
              const Expanded(child: SizedBox()),
              foooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
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
      );

  Widget body() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
        child: Column(
          children: [
            SizedBox(
              height: S.dimens.defaultPadding_16,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 350.h,
                child: Image.asset(
                  R.images.swapWelcome,
                ),
              ),
            ),
            SizedBox(
              width: 314.w,
              child: Text(
                T.swapTitleWelcome,
                style: S.textStyles.h5,
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_16,
            ),
            SizedBox(
              width: 314.w,
              child: Text(
                T.swapContentWelcome,
                style: S.textStyles.titleHeavy,
              ),
            ),
          ],
        ),
      );

  Widget foooter() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
        child: SizedBox(
          height: S.dimens.defaultPadding_88,
          child: Align(
            alignment: Alignment.topCenter,
            child: CustomButton(
              text: "Upload a toy",
              onPressed: () {
                NavigationService.push(
                  page: RoutePaths.swapScreenMain,
                  isNamed: true,
                );
              },
            ),
          ),
        ),
      );
}
