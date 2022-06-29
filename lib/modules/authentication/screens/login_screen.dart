import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_shape.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/components/another_login_button.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/login_view_model.dart';

import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print("object");
    //final isVisible = ref.watch(loginSettingNotifierProvider).isVisible;

    //final loginSetting = ref.watch(loginSettingNotifierProvider.notifier);

    // final _emailController = TextEditingController();
    // final _passwordController = TextEditingController();

    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      ref.watch(loginSettingNotifierProvider).emailFocusNode.unfocus();
      ref.watch(loginSettingNotifierProvider).passwordFocusNode.unfocus();
    }

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          ref.watch(loginSettingNotifierProvider).emailFocusNode.unfocus();
          ref.watch(loginSettingNotifierProvider).passwordFocusNode.unfocus();
        },
        child: Scaffold(
          backgroundColor: S.colors.background_1,
          body: ModalProgressHUD(
            inAsyncCall: ref.watch(loginSettingNotifierProvider).isLoadingLogin,
            opacity: 0.5,
            progressIndicator: const CircularProgressIndicator(),
            child: SingleChildScrollView(
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
                            onTap: () {
                              ref
                                  .watch(loginSettingNotifierProvider.notifier)
                                  .clearEmail();
                            },
                            child: const Icon(FontAwesomeIcons.xmark),
                          ),
                          obscureText: false,
                          onChanged: (value) {},
                          validator: (value) {
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            // passwordFocus.requestFocus();
                          },
                          inputType: TextInputType.emailAddress,
                          controller: ref
                              .watch(loginSettingNotifierProvider)
                              .emailController,
                          focusNode: ref
                              .watch(loginSettingNotifierProvider)
                              .emailFocusNode,
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
                            child: ref
                                    .watch(loginSettingNotifierProvider)
                                    .isVisible
                                ? const Icon(FontAwesomeIcons.eyeSlash)
                                : const Icon(FontAwesomeIcons.eye),
                          ),
                          obscureText:
                              ref.watch(loginSettingNotifierProvider).isVisible,
                          onChanged: (value) {
                            //print("");
                          },
                          validator: (value) {
                            return null;
                          },
                          onFieldSubmitted: (value) {},
                          inputType: TextInputType.emailAddress,
                          controller: ref
                              .watch(loginSettingNotifierProvider)
                              .passwordController,
                          focusNode: ref
                              .watch(loginSettingNotifierProvider)
                              .passwordFocusNode,
                        ),
                        SizedBox(
                          height: S.dimens.defaultPadding_8,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              NavigationService.push(
                                page: RoutePaths.resetPassword,
                                isNamed: true,
                              );
                            },
                            child: Text(
                              T.loginForgotPassword,
                              style: S.textStyles.titleHeavy,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: S.dimens.defaultPadding_24,
                        ),
                        CustomButton(
                          text: T.login,
                          onPressed: () {
                            ref
                                .watch(loginSettingNotifierProvider.notifier)
                                .signInWithEmailAndPassword(
                                  context,
                                  email: ref
                                      .watch(loginSettingNotifierProvider)
                                      .emailController
                                      .text,
                                  password: ref
                                      .watch(loginSettingNotifierProvider)
                                      .passwordController
                                      .text,
                                );
                            // print(object);
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
                        LoginGoogleButton(
                          text: "Google",
                          onPressed: () {
                            ref
                                .watch(loginSettingNotifierProvider.notifier)
                                .loginWithGoogle(context);
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     AnotherLoginButton(
                        //       text: R.images.ggLogin,
                        //       onPressed: () {},
                        //     ),
                        //     SizedBox(
                        //       width: S.dimens.defaultPadding_16,
                        //     ),
                        //     AnotherLoginButton(
                        //       text: R.images.fbLogin,
                        //       onPressed: () {},
                        //     ),
                        //     SizedBox(
                        //       width: S.dimens.defaultPadding_16,
                        //     ),
                        //     AnotherLoginButton(
                        //       text: R.images.appleLogin,
                        //       onPressed: () {},
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: S.dimens.defaultPadding_16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(T.loginNotMember,
                                style: S.textStyles.titleHeavy),
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
        ),
      ),
    );
  }
}

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({
    Key? key,
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (3850 / 69).h,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(S.colors.primary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.google,
              color: S.colors.textColor_1,
            ),
            SizedBox(
              width: S.dimens.defaultPaddingVertical_16,
            ),
            Text(
              text,
              style: S.textStyles.h4,
            ),
          ],
        ),
      ),
    );
  }
}
