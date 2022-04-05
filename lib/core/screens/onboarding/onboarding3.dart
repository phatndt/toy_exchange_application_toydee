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
            const SizedBox(
              height: 50.0,
            ),
            Image.asset(
              T.onb3Image,
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
                    T.onb3Title,
                    style: S.textStyles.h5,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    T.onb3Content,
                    style: S.textStyles.titleHeavy,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
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
                      NavigationService.pushReplacement(
                          isNamed: true, page: RoutePaths.login);
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
