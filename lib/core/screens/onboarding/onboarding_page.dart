import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:riverpod/riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';

import '../../routing/navigation_service.dart';
import '../../styles/styles.dart';
import '../../styles/text.dart';
import '../../widgets/custom_text_elevated_button.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: buildTitle(T.onb1Title),
            bodyWidget: buidBody(T.onb1Content),
            image: buildImage(T.onb1Image),
            decoration: buildDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle(T.onb2Title),
            bodyWidget: buidBody(T.onb2Content),
            image: buildImage(T.onb2Image),
            decoration: buildDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle(T.onb3Title),
            bodyWidget: buidBody(T.onb3Content),
            image: buildImage(T.onb3Image),
            decoration: buildDecoration(),
          ),
        ],
        done: Text(
          T.onbDone,
          style: S.textStyles.h4,
        ),
        onDone: () {
          NavigationService.push(isNamed: true, page: RoutePaths.login);
        },
        nextStyle: TextButton.styleFrom(
          // textStyle: S.textStyles.h4, ///////////// Error
          backgroundColor: S.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        doneStyle: TextButton.styleFrom(
          //textStyle: S.textStyles.h4, ///////////// Error
          backgroundColor: S.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        next: Text(
          T.onbNext,
          style: S.textStyles.h4,
        ),
        skip: Text(
          T.onbSkip,
          style: S.textStyles.h4,
        ),
        onSkip: () {
          NavigationService.pushReplacement(
              isNamed: true, page: RoutePaths.login);
        },
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        dotsDecorator: buildDotsShape(),
        isProgressTap: false,
        freeze: false,
      ),
    );
  }

  buildImage(String path) {
    return Center(
      child: Image.asset(
        path,
        width: 350,
      ),
    );
  }

  buildDecoration() {
    return PageDecoration(
      // bodyAlignment: Alignment.centerLeft,
      // imageAlignment: Alignment.center,
      // titleTextStyle: S.textStyles.h5,
      // bodyTextStyle: S.textStyles.titleHeavy,
      titlePadding:
          EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
      imagePadding:
          EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
      bodyPadding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
    );
  }

  buildDotsShape() {
    return DotsDecorator(
        color: S.colors.gray_1,
        activeColor: S.colors.primary,
        size: const Size(10, 10),
        activeSize: const Size(20, 10),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }

  buidBody(String content) {
    return Text(
      content,
      textAlign: TextAlign.left,
      style: S.textStyles.titleHeavy,
    );
  }

  buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: S.textStyles.h5,
    );
  }
}
