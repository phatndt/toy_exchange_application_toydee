import 'package:flutter/material.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_outline_button.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/components/another_login_button.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: S.colors.background_1,
              child: ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  color: S.colors.background_2,
                  child: Center(
                    child: SizedBox(
                        height: 40,
                        width: 160,
                        child: Image.asset(R.images.logoText)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: S.dimens.defaultPadding_32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: S.dimens.defaultPadding_100,
                  ),
                  Text(
                    T.wcOnboarding,
                    style: S.textStyles.h3,
                  ),
                  Text(
                    T.wcBegin,
                    style: S.textStyles.titleLight,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_80,
                  ),
                  Text(
                    T.wcDontHaveAnAccout,
                    style: S.textStyles.titleLight,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_4,
                  ),
                  CustomButton(
                    text: T.wcCreateAccount,
                    onPressed: () {},
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_32,
                  ),
                  Text(
                    T.wcAlreadyAMember,
                    style: S.textStyles.titleLight,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_4,
                  ),
                  CustomTextOuntlineButton(
                    text: T.wcLogin,
                    onPressed: () {},
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_48,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      T.wcOrConnectWith,
                      style: S.textStyles.titleLight,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnotherLoginButton(
                        text: R.images.ggLogin,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: S.dimens.defaultPadding_16,
                      ),
                      AnotherLoginButton(
                        text: R.images.fbLogin,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: S.dimens.defaultPadding_16,
                      ),
                      AnotherLoginButton(
                        text: R.images.appleLogin,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      T.wcTerm_1,
                      style: S.textStyles.titleLight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        T.wcTerm_2,
                        style: S.textStyles.titleLightPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height + 50;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
