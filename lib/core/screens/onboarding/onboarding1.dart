import 'package:flutter/material.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import '../../routing/route_paths.dart';
import '../../styles/styles.dart';
import '../../styles/text.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: S.dimens.defaultPadding_48,
            ),
            Image.asset(
              T.onb1Image,
              scale: 1.45,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_32,
                  vertical: S.dimens.defaultPadding_16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: S.dimens.defaultPadding_8),
                  Text(
                    T.onb1Title,
                    style: S.textStyles.h5,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_8,
                  ),
                  Text(
                    T.onb1Content,
                    style: S.textStyles.titleHeavy,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_32 - 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        primary: S.colors.textColor_1,
                        textStyle: S.textStyles.h4),
                    onPressed: () {
                      NavigationService.push(
                          isNamed: true, page: RoutePaths.login);
                    },
                    child: const Text(
                      T.onbSkip,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CustomButton(
                    text: T.onbNext,
                    onPressed: () {
                      NavigationService.push(
                          isNamed: true, page: RoutePaths.onboarding2);
                    },
                    width: 120.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
