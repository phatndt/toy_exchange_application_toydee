import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/styles/styles.dart';
import 'package:toy_exchange_application_toydee/core/styles/text.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_form_field.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_outline_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/footer_screen.dart';
import 'package:toy_exchange_application_toydee/core/widgets/header_screen.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_main_view_model.dart';

class UploadToyEventsMain extends ConsumerWidget {
  const UploadToyEventsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderScreen(title: ""),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Text(
                  T.swapUploadPhotosOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_8,
                ),
                toyImage(
                  ref,
                  mainToyEventSettingNotifierProvider,
                  context,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                // SizedBox(
                //   height: S.dimens.defaultPadding_24,
                // ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Text(
                //     T.swapUploadPhotosDescriptionOne,
                //     style: S.textStyles.titleLightNoSpacing,
                //   ),
                // ),
                // SizedBox(
                //   height: S.dimens.defaultPadding_8,
                // ),
                // CustomTextOuntlineButton(
                //   text: T.swapUploadPhotoButtonOne,
                //   onPressed: () {},
                // ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Text(
                  T.swapUploadPhotosWarningWelcome,
                  style: S.textStyles.titleLightNoSpacing,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Text(
                  T.swapTitleOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_8,
                ),
                CustomTextFormField(
                  hintText: T.swapTitleContentOne,
                  obscureText: false,
                  controller: ref
                      .watch(mainToyEventSettingNotifierProvider)
                      .titleController,
                  suffixIconData: GestureDetector(
                    onTap: () {
                      ref
                          .watch(mainToyEventSettingNotifierProvider.notifier)
                          .clearTitle();
                    },
                    child: const Icon(FontAwesomeIcons.xmark),
                  ),
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Text(
                  T.swapFiltersOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_8,
                ),
                CustomTextFormField(
                  hintText: T.swapFiltersContentOne,
                  obscureText: false,
                  readOnly: true,
                  onTap: () {
                    NavigationService.push(
                      page: RoutePaths.uploadToyEventsFilter,
                      isNamed: true,
                    );
                  },
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Text(
                  T.swapDescriptionOne,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_8,
                ),
                CustomTextFormField(
                  hintText: T.swapDescriptionOne,
                  obscureText: false,
                  controller: ref
                      .watch(mainToyEventSettingNotifierProvider)
                      .descriptionController,
                  maxLines: 5,
                  suffixIconData: GestureDetector(
                    onTap: () {
                      ref
                          .watch(mainToyEventSettingNotifierProvider.notifier)
                          .clearDescription();
                    },
                    child: const Icon(FontAwesomeIcons.xmark),
                  ),
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Text(
                  T.swapLocationTitle,
                  style: S.textStyles.h4,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_8,
                ),
                CustomTextFormField(
                  hintText: T.swapLocationnContent,
                  obscureText: false,
                  controller: ref
                      .watch(mainToyEventSettingNotifierProvider)
                      .locationController,
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      T.swapCheckBoxTwoContent,
                      style: S.textStyles.titleHeavy,
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        side: BorderSide(
                          width: 2.2318840579710146.h,
                          color: S.colors.gray_3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.463768115942029.h),
                          ),
                        ),
                        value: true,
                        onChanged: (value) {
                          ref
                              .watch(
                                  mainToyEventSettingNotifierProvider.notifier)
                              .updateSwapAvailable(value);
                        },
                        checkColor: S.colors.background_1,
                        fillColor:
                            MaterialStateProperty.all<Color>(S.colors.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_24,
                ),
                FooterScreen(
                  buttonContent: T.swapButtonContent,
                  onPressed: () {
                    ref
                        .watch(mainToyEventSettingNotifierProvider.notifier)
                        .previewToyForEvent(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget toyImage(
    WidgetRef ref,
    StateNotifierProvider<MainToyEventSettingNotifier, MainToyEventSetting>
        mainToyEventSettingNotifierProvider,
    BuildContext context,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 115.95833333333333.w,
            height: 122.7536231884058.h,
            decoration: BoxDecoration(
              color: S.colors.lavender,
              borderRadius: BorderRadius.all(
                Radius.circular(S.dimens.defaultBorderRadius),
              ),
              image:
                  ref.watch(mainToyEventSettingNotifierProvider).imagePathOne !=
                          ""
                      ? DecorationImage(
                          image: FileImage(File(ref
                              .watch(mainToyEventSettingNotifierProvider)
                              .imagePathOne)),
                          fit: BoxFit.fill)
                      : null,
            ),
            child: TextButton(
              onPressed: () async {
                ref
                    .watch(mainToyEventSettingNotifierProvider.notifier)
                    .showImageSourceActionSheet(context, 1);
              },
              child:
                  ref.watch(mainToyEventSettingNotifierProvider).imagePathOne ==
                          ""
                      ? const Icon(FontAwesomeIcons.plus)
                      : const Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.transparent,
                        ),
            ),
          ),
          Container(
            width: 115.95833333333333.w,
            height: 122.7536231884058.h,
            decoration: BoxDecoration(
              color: S.colors.lavender,
              borderRadius: BorderRadius.all(
                Radius.circular(S.dimens.defaultBorderRadius),
              ),
              image:
                  ref.watch(mainToyEventSettingNotifierProvider).imagePathTwo !=
                          ""
                      ? DecorationImage(
                          image: FileImage(File(ref
                              .watch(mainToyEventSettingNotifierProvider)
                              .imagePathTwo)),
                          fit: BoxFit.fill)
                      : null,
            ),
            child: TextButton(
              onPressed: () {
                ref
                    .watch(mainToyEventSettingNotifierProvider.notifier)
                    .showImageSourceActionSheet(context, 2);
              },
              child:
                  ref.watch(mainToyEventSettingNotifierProvider).imagePathTwo ==
                          ""
                      ? const Icon(FontAwesomeIcons.plus)
                      : const Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.transparent,
                        ),
            ),
          ),
          Container(
            width: 115.95833333333333.w,
            height: 122.7536231884058.h,
            decoration: BoxDecoration(
              color: S.colors.lavender,
              borderRadius: BorderRadius.all(
                Radius.circular(S.dimens.defaultBorderRadius),
              ),
              image: ref
                          .watch(mainToyEventSettingNotifierProvider)
                          .imagePathThree !=
                      ""
                  ? DecorationImage(
                      image: FileImage(File(ref
                          .watch(mainToyEventSettingNotifierProvider)
                          .imagePathThree)),
                      fit: BoxFit.fill)
                  : null,
            ),
            child: TextButton(
              onPressed: () {
                ref
                    .watch(mainToyEventSettingNotifierProvider.notifier)
                    .showImageSourceActionSheet(context, 3);
              },
              child: ref
                          .watch(mainToyEventSettingNotifierProvider)
                          .imagePathThree ==
                      ""
                  ? const Icon(FontAwesomeIcons.plus)
                  : const Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.transparent,
                    ),
            ),
          ),
        ],
      );
}
