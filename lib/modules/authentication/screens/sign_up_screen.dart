import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../components/another_login_button.dart';
import '../viewmodels/register_view_model.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController e = TextEditingController();

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
    return SafeArea(
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
          ref.watch(registerSettingNotifierProvider).phoneFocusNode.unfocus();
          ref
              .watch(registerSettingNotifierProvider)
              .usernameFocusNode
              .unfocus();
        },
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
                        hintText: "Email",
                        prefixIconData:
                            const Icon(FontAwesomeIcons.envelopeOpenText),
                        suffixIconData: GestureDetector(
                          onTap: () {
                            ref
                                .watch(registerSettingNotifierProvider.notifier)
                                .clearEmail();
                          },
                          child: const Icon(FontAwesomeIcons.xmark),
                        ),
                        obscureText: true,
                        onFieldSubmitted: (value) {
                          ref
                              .watch(registerSettingNotifierProvider)
                              .phoneFocusNode
                              .requestFocus();
                        },
                        inputType: TextInputType.emailAddress,
                        controller: ref
                            .watch(registerSettingNotifierProvider)
                            .emailController,
                        focusNode: ref
                            .watch(registerSettingNotifierProvider)
                            .emailFocusNode,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_24,
                      ),
                      CustomTextFormField(
                        hintText: "Phone Number",
                        prefixIconData: const Icon(FontAwesomeIcons.phone),
                        suffixIconData: GestureDetector(
                          onTap: () {
                            ref
                                .watch(registerSettingNotifierProvider.notifier)
                                .clearPhone();
                          },
                          child: const Icon(FontAwesomeIcons.xmark),
                        ),
                        obscureText: true,
                        onChanged: (value) {},
                        validator: (value) {
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          ref
                              .watch(registerSettingNotifierProvider)
                              .usernameFocusNode
                              .requestFocus();
                        },
                        inputType: TextInputType.emailAddress,
                        controller: ref
                            .watch(registerSettingNotifierProvider)
                            .phoneController,
                        focusNode: ref
                            .watch(registerSettingNotifierProvider)
                            .phoneFocusNode,
                      ),
                      SizedBox(
                        height: S.dimens.defaultPadding_24,
                      ),
                      CustomTextFormField(
                        hintText: "Username",
                        prefixIconData:
                            const Icon(FontAwesomeIcons.addressCard),
                        suffixIconData: GestureDetector(
                          onTap: () {
                            ref
                                .watch(registerSettingNotifierProvider.notifier)
                                .clearUsername();
                          },
                          child: const Icon(FontAwesomeIcons.xmark),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          //print("");
                        },
                        validator: (value) {
                          return null;
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
                                  .watch(
                                      registerSettingNotifierProvider.notifier)
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
                          onChanged: (value) {
                            //print("");
                          },
                          validator: (value) {
                            return null;
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
                                .watch(registerSettingNotifierProvider.notifier)
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
                          return null;
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
      ),
    );
  }
}
