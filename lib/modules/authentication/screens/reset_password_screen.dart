import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/reset_password_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends HookConsumerWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      ref.watch(resetPasswordNotifierProvider).emailFocusNode.unfocus();
    }
    return GestureDetector(
      onTap: () {
        ref.watch(resetPasswordNotifierProvider).emailFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                body(ref, resetPasswordNotifierProvider, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
        child: Column(
          children: [
            SizedBox(
              height: S.dimens.defaultPadding_48,
            ),
            CustomIconButton(
              text: FontAwesomeIcons.angleLeft,
              backgroundColor: S.colors.background_2,
              color: S.colors.primary,
              onPressed: () {
                NavigationService.goBack();
              },
            ),
          ],
        ),
      );

  Widget body(
    WidgetRef ref,
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordSetting>
        resetPasswordNotifierProvider,
    context,
  ) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: S.dimens.defaultPadding_16,
            ),
            SizedBox(
              width: 314.w,
              child: Text(
                T.resetPasswordTitle,
                style: S.textStyles.h3,
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_8,
            ),
            SizedBox(
              width: 314.w,
              child: Text(
                T.resetPasswordContent,
                style: S.textStyles.titleHeavy,
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_32,
            ),
            CustomTextFormField(
              hintText: T.resetPasswordHintext,
              prefixIconData: const Icon(FontAwesomeIcons.envelopeOpenText),
              suffixIconData: GestureDetector(
                onTap: () {
                  ref
                      .watch(resetPasswordNotifierProvider.notifier)
                      .clearEmail();
                },
                child: const Icon(FontAwesomeIcons.xmark),
              ),
              obscureText: false,
              validator: (value) {
                return ref
                    .watch(resetPasswordNotifierProvider.notifier)
                    .emailValidator(value);
              },
              inputType: TextInputType.emailAddress,
              controller:
                  ref.watch(resetPasswordNotifierProvider).emailController,
              focusNode:
                  ref.watch(resetPasswordNotifierProvider).emailFocusNode,
            ),
            SizedBox(
              height: S.dimens.defaultPadding_24,
            ),
            CustomButton(
              text: T.resetPasswordButton,
              onPressed: () async {
                ref
                    .watch(resetPasswordNotifierProvider)
                    .emailFocusNode
                    .unfocus();
                await ref
                    .watch(resetPasswordNotifierProvider.notifier)
                    .sendEmailResetPassword(
                      context,
                      email: ref
                          .watch(resetPasswordNotifierProvider)
                          .emailController
                          .text,
                    );
              },
            ),
          ],
        ),
      );
}
