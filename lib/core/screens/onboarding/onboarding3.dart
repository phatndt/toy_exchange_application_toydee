import 'package:flutter/material.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import '../../routing/navigation_service.dart';
import '../../routing/route_paths.dart';
import '../../styles/styles.dart';
import '../../styles/text.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(T.onb3_image),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: S.dimens.defaultPadding_32),
                  Text(
                    T.onb3_title,
                    style: S.textStyles.h2,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    T.onb3_content,
                    style: S.textStyles.titleHeavy,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 70.0,
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
                    onPressed: () {},
                    child: const Text(
                      T.onb_skip,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  CustomButton(
                    text: T.onb_next,
                    onPressed: () {
                      NavigationService.pushReplacement(
                          isNamed: true, page: RoutePaths.onboarding1);
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
