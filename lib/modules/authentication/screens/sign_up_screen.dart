import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/login_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../components/another_login_button.dart';
import '../viewmodels/register_view_model.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _loginFormKey = useMemoized(() => GlobalKey<FormState>());

    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      ref.watch(registerSettingNotifierProvider).emailFocusNode.unfocus();
      ref.watch(registerSettingNotifierProvider).passwordFocusNode.unfocus();
      ref
          .watch(registerSettingNotifierProvider)
          .repeatPasswordFocusNode
          .unfocus();
      ref.watch(registerSettingNotifierProvider).phoneFocusNode.unfocus();
      ref.watch(registerSettingNotifierProvider).usernameFocusNode.unfocus();
    }
    return Form(
      key: _loginFormKey,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            ref.watch(registerSettingNotifierProvider).emailFocusNode.unfocus();
            ref
                .watch(registerSettingNotifierProvider)
                .passwordFocusNode
                .unfocus();
            ref
                .watch(registerSettingNotifierProvider)
                .repeatPasswordFocusNode
                .unfocus();
            ref
                .watch(registerSettingNotifierProvider)
                .usernameFocusNode
                .unfocus();
          },
          child: Scaffold(
            backgroundColor: S.colors.background_1,
            body: ModalProgressHUD(
              inAsyncCall:
                  ref.watch(registerSettingNotifierProvider).isLoadingSignUp,
              child: SingleChildScrollView(
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
                            height: S.dimens.defaultPadding_48,
                          ),
                          Text(
                            T.signUpTitle_1,
                            style: S.textStyles.h3,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 30800 / 69 * ScreenUtil().scaleWidth),
                            child: Text(
                              T.signUpTitle_2,
                              style: S.textStyles.titleHeavy,
                            ),
                          ),
                          SizedBox(
                            height: S.dimens.defaultPadding_40,
                          ),
                          CustomTextFormField(
                            hintText: "Email",
                            prefixIconData:
                                const Icon(FontAwesomeIcons.envelopeOpenText),
                            obscureText: false,
                            maxLength: 50,
                            suffixIconData: GestureDetector(
                              onTap: () {
                                ref
                                    .watch(registerSettingNotifierProvider
                                        .notifier)
                                    .clearEmail();
                              },
                              child: const Icon(FontAwesomeIcons.xmark),
                            ),
                            onFieldSubmitted: (value) {
                              ref
                                  .watch(registerSettingNotifierProvider)
                                  .usernameFocusNode
                                  .requestFocus();
                            },
                            inputType: TextInputType.emailAddress,
                            controller: ref
                                .watch(registerSettingNotifierProvider)
                                .emailController,
                            focusNode: ref
                                .watch(registerSettingNotifierProvider)
                                .emailFocusNode,
                            validator: (value) {
                              return ref
                                  .watch(loginSettingNotifierProvider.notifier)
                                  .emailValidator(value);
                            },
                          ),
                          // SizedBox(
                          //   height: S.dimens.defaultPadding_24,
                          // ),
                          // CustomTextFormField(
                          //   hintText: "Phone Number",
                          //   prefixIconData: const Icon(FontAwesomeIcons.phone),
                          //   obscureText: false,
                          //   maxLength: 10,
                          //   suffixIconData: GestureDetector(
                          //     onTap: () {
                          //       ref
                          //           .watch(
                          //               registerSettingNotifierProvider.notifier)
                          //           .clearPhone();
                          //     },
                          //     child: const Icon(FontAwesomeIcons.xmark),
                          //   ),
                          //   onChanged: (value) {},
                          //   validator: (value) {
                          //     return ref
                          //         .watch(registerSettingNotifierProvider.notifier)
                          //         .phoneNumber(value);
                          //   },
                          //   onFieldSubmitted: (value) {
                          //     ref
                          //         .watch(registerSettingNotifierProvider)
                          //         .usernameFocusNode
                          //         .requestFocus();
                          //   },
                          //   inputType: TextInputType.emailAddress,
                          //   controller: ref
                          //       .watch(registerSettingNotifierProvider)
                          //       .phoneController,
                          //   focusNode: ref
                          //       .watch(registerSettingNotifierProvider)
                          //       .phoneFocusNode,
                          // ),
                          SizedBox(
                            height: S.dimens.defaultPadding_24,
                          ),
                          CustomTextFormField(
                            hintText: "Username",
                            prefixIconData:
                                const Icon(FontAwesomeIcons.addressCard),
                            obscureText: false,
                            maxLength: 50,
                            suffixIconData: GestureDetector(
                              onTap: () {
                                ref
                                    .watch(registerSettingNotifierProvider
                                        .notifier)
                                    .clearUsername();
                              },
                              child: const Icon(FontAwesomeIcons.xmark),
                            ),
                            onChanged: (value) {
                              //print("");
                            },
                            validator: (value) {
                              return ref
                                  .watch(
                                      registerSettingNotifierProvider.notifier)
                                  .checkUserEmpty(value);
                            },
                            onFieldSubmitted: (value) {
                              ref
                                  .watch(registerSettingNotifierProvider)
                                  .passwordFocusNode
                                  .requestFocus();
                            },
                            inputType: TextInputType.emailAddress,
                            controller: ref
                                .watch(registerSettingNotifierProvider)
                                .usernameController,
                            focusNode: ref
                                .watch(registerSettingNotifierProvider)
                                .usernameFocusNode,
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
                                      .watch(registerSettingNotifierProvider
                                          .notifier)
                                      .updatePasswordVisible();
                                },
                                child: ref
                                        .watch(registerSettingNotifierProvider)
                                        .isVisiblePassword
                                    ? const Icon(FontAwesomeIcons.eyeSlash)
                                    : const Icon(FontAwesomeIcons.eye),
                              ),
                              obscureText: ref
                                  .watch(registerSettingNotifierProvider)
                                  .isVisiblePassword,
                              validator: (value) {
                                return ref
                                    .watch(registerSettingNotifierProvider
                                        .notifier)
                                    .passwordValidationRegex(value);
                              },
                              onFieldSubmitted: (value) {
                                ref
                                    .watch(registerSettingNotifierProvider)
                                    .repeatPasswordFocusNode
                                    .requestFocus();
                              },
                              inputType: TextInputType.emailAddress,
                              controller: ref
                                  .watch(registerSettingNotifierProvider)
                                  .passwordController,
                              focusNode: ref
                                  .watch(registerSettingNotifierProvider)
                                  .passwordFocusNode),
                          SizedBox(
                            height: S.dimens.defaultPadding_24,
                          ),
                          CustomTextFormField(
                            hintText: "Repeat password",
                            prefixIconData: const Icon(FontAwesomeIcons.key),
                            suffixIconData: GestureDetector(
                              onTap: () {
                                ref
                                    .watch(registerSettingNotifierProvider
                                        .notifier)
                                    .updateRepeatPasswordVisible();
                              },
                              child: ref
                                      .watch(registerSettingNotifierProvider)
                                      .isVisibleRepeatPassword
                                  ? const Icon(FontAwesomeIcons.eyeSlash)
                                  : const Icon(FontAwesomeIcons.eye),
                            ),
                            obscureText: ref
                                .watch(registerSettingNotifierProvider)
                                .isVisibleRepeatPassword,
                            onChanged: (value) {
                              //print("");
                            },
                            validator: (value) {
                              return ref
                                  .watch(
                                      registerSettingNotifierProvider.notifier)
                                  .passwordValidationRegex(value);
                            },
                            inputType: TextInputType.emailAddress,
                            controller: ref
                                .watch(registerSettingNotifierProvider)
                                .repeatPasswordController,
                            focusNode: ref
                                .watch(registerSettingNotifierProvider)
                                .repeatPasswordFocusNode,
                          ),
                          SizedBox(
                            height: S.dimens.defaultPadding_40,
                          ),
                          CustomButton(
                            text: T.signUpTextButton,
                            onPressed: () {
                              if (_loginFormKey.currentState!.validate()) {
                                ref
                                    .watch(registerSettingNotifierProvider
                                        .notifier)
                                    .checkExistUserInformation(
                                      context,
                                      email: ref
                                          .watch(
                                              registerSettingNotifierProvider)
                                          .emailController
                                          .text,
                                      userName: ref
                                          .watch(
                                              registerSettingNotifierProvider)
                                          .usernameController
                                          .text,
                                      password: ref
                                          .watch(
                                              registerSettingNotifierProvider)
                                          .passwordController
                                          .text,
                                    );
                              }
                            },
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(
                            height: S.dimens.defaultPadding_16,
                          ),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     T.wcOrConnectWith,
                          //     style: S.textStyles.titleHeavy,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: S.dimens.defaultPadding_16,
                          // ),
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
                          SizedBox(
                            height: S.dimens.defaultPadding_16,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
