import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/login_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/reset_password_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class ResetPasswordDoneScreen extends HookConsumerWidget {
  const ResetPasswordDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: S.colors.background_1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: S.dimens.defaultPadding_48,
              ),
              LottieBuilder.asset(
                R.images.sendEmail,
                height: 240.h,
                width: 240.w,
              ),
              Text(
                T.resetPasswordDoneTitle,
                style: S.textStyles.h3,
              ),
              SizedBox(
                height: S.dimens.defaultPadding_8,
              ),
              Text(
                T.resetPasswordDoneContent,
                style: S.textStyles.titleHeavy,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: S.dimens.defaultPadding_32,
              ),
              CustomButton(
                text: T.resetPasswordDoneButton,
                onPressed: () async {
                  var result = await OpenMailApp.openMailApp();

                  // If no mail apps found, show error
                  if (!result.didOpen && !result.canOpen) {
                    showNoMailAppsDialog(context);

                    // iOS: if multiple mail apps found, show dialog to select.
                    // There is no native intent/default app system in iOS so
                    // you have to do it yourself.
                  } else if (!result.didOpen && result.canOpen) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return MailAppPickerDialog(
                          mailApps: result.options,
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(
                height: S.dimens.defaultPadding_24,
              ),
              InkWell(
                onTap: () {
                  ref
                      .watch(resetPasswordNotifierProvider.notifier)
                      .navigationToLogin(context);
                },
                child: Text(
                  T.resetPasswordDoneSkipp,
                  style: S.textStyles.titleHeavyNoSpacing,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    T.resetPasswordDoneReResend,
                    style: S.textStyles.titleLightBoldNoSpacing,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    T.resetPasswordDoneOr,
                    style: S.textStyles.titleLightBoldNoSpacing,
                  ),
                  InkWell(
                    onTap: () {
                      NavigationService.goBack();
                    },
                    child: Text(
                      T.resetPasswordDoneTryAnother,
                      style: S.textStyles.titleLightBoldNoSpacingPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: S.dimens.defaultPadding_24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
