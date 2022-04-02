import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../components/another_login_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("aaaa");
    final phoneNumber = FocusNode();
    final email = FocusNode();
    final passwordFocus = FocusNode();
    final passwordRepeatFocus = FocusNode();
    TextEditingController e = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: S.dimens.defaultPadding_32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: S.dimens.defaultPadding_32,
                    ),
                    Text(
                      T.signUpTitle_1,
                      style: S.textStyles.h3,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Text(
                        T.signUpTitle_2,
                        style: S.textStyles.titleHeavy,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_32,
                    ),
                    CustomTextFormField(
                      hintText: "Full name",
                      prefixIconData: const Icon(FontAwesomeIcons.addressCard),
                      suffixIconData: GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      obscureText: true,
                      onFieldSubmitted: (value) {
                        phoneNumber.requestFocus();
                      },
                      inputType: TextInputType.emailAddress,
                      controller: e,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    CustomTextFormField(
                      hintText: "Phone Number",
                      prefixIconData: const Icon(FontAwesomeIcons.phone),
                      suffixIconData: GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      obscureText: true,
                      onChanged: (value) {},
                      validator: (value) {},
                      onFieldSubmitted: (value) {
                        email.requestFocus();
                      },
                      inputType: TextInputType.emailAddress,
                      controller: e,
                      focusNode: phoneNumber,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      prefixIconData:
                          const Icon(FontAwesomeIcons.envelopeOpenText),
                      suffixIconData: GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        print("");
                      },
                      validator: (value) {},
                      onFieldSubmitted: (value) {
                        passwordFocus.requestFocus();
                      },
                      inputType: TextInputType.emailAddress,
                      controller: e,
                      focusNode: email,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      prefixIconData: const Icon(FontAwesomeIcons.key),
                      suffixIconData: GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        print("");
                      },
                      validator: (value) {},
                      onFieldSubmitted: (value) {
                        passwordRepeatFocus.requestFocus();
                      },
                      inputType: TextInputType.emailAddress,
                      controller: e,
                      focusNode: passwordFocus,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    CustomTextFormField(
                      hintText: "Repeat password",
                      prefixIconData: const Icon(FontAwesomeIcons.key),
                      suffixIconData: GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        print("");
                      },
                      validator: (value) {},
                      inputType: TextInputType.emailAddress,
                      controller: e,
                      focusNode: passwordRepeatFocus,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_32,
                    ),
                    CustomButton(
                      text: T.signUpTextButton,
                      onPressed: () {},
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        T.wcOrConnectWith,
                        style: S.textStyles.titleHeavy,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(T.signUpAlreadyAMember,
                            style: S.textStyles.titleHeavy),
                        InkWell(
                          onTap: () {
                            NavigationService.push(
                                isNamed: true, page: RoutePaths.login);
                          },
                          child: Text(
                            T.signUpLogin,
                            style: S.textStyles.titleHeavyPrimary,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
