import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_shape.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_outline_button.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/components/another_login_button.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/login_view_model.dart';

import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../viewmodels/tesst.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("object");
    //final isVisible = ref.watch(loginSettingNotifierProvider).isVisible;

    //final loginSetting = ref.watch(loginSettingNotifierProvider.notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: S.colors.background_1,
                child: ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 120,
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
                      height: S.dimens.defaultPadding_64,
                    ),
                    Text(
                      T.loginTitle_1,
                      style: S.textStyles.h3,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Text(
                        T.loginTitle_2,
                        style: S.textStyles.titleHeavy,
                      ),
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_48,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      prefixIconData:
                          const Icon(FontAwesomeIcons.envelopeOpenText),
                      suffixIconData: GestureDetector(
                        onTap: () {},
                        child: const Icon(FontAwesomeIcons.xmark),
                      ),
                      obscureText: false,
                      onChanged: (value) {},
                      validator: (value) {},
                      onFieldSubmitted: (value) {
                        // passwordFocus.requestFocus();
                      },
                      inputType: TextInputType.emailAddress,
                      controller: Tesst.e,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    CustomTextFormField(
                      hintText: "Password",
                      prefixIconData: const Icon(FontAwesomeIcons.key),
                      suffixIconData: GestureDetector(
                        onTap: () {
                          ref
                              .watch(loginSettingNotifierProvider.notifier)
                              .updatePasswordVisible();
                        },
                        child: ref.watch(loginSettingNotifierProvider).isVisible
                            ? const Icon(FontAwesomeIcons.eyeSlash)
                            : const Icon(FontAwesomeIcons.eye),
                      ),
                      obscureText:
                          ref.watch(loginSettingNotifierProvider).isVisible,
                      onChanged: (value) {
                        print("");
                      },
                      validator: (value) {},
                      onFieldSubmitted: (value) {},
                      inputType: TextInputType.emailAddress,
                      controller: Tesst.f,
                      focusNode: Tesst.passwordFocus,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_8,
                    ),
                    Text(
                      T.loginForgotPassword,
                      style: S.textStyles.titleHeavy,
                    ),
                    SizedBox(
                      height: S.dimens.defaultPadding_24,
                    ),
                    CustomButton(
                      text: T.login,
                      onPressed: () {
                        NavigationService.push(isNamed: true,page: RoutePaths.mainScreen);
                      },
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
                        Text(T.loginNotMember, style: S.textStyles.titleHeavy),
                        InkWell(
                          onTap: () {
                            NavigationService.push(
                                isNamed: true, page: RoutePaths.signUp);
                          },
                          child: Text(
                            T.loginSignUp,
                            style: S.textStyles.titleHeavyPrimary,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
