import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_form_field.dart';

import '../../../../core/routing/route_paths.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';
import '../../../../core/widgets/custom_text_outline_button.dart';
import '../view_models/upload_events_view_model.dart';

class UploadEvents extends ConsumerWidget {
  const UploadEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.defaultPadding_8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      T.uploadEventsTitle,
                      style: S.textStyles.h3,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.defaultPadding_16,
                  horizontal: S.dimens.defaultPadding_16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      color: S.colors.primary,
                      backgroundColor: S.colors.accent_5,
                      text: FontAwesomeIcons.arrowLeft,
                      onPressed: () {
                        ref
                            .watch(uploadEventsNotifierProvider.notifier)
                            .goBack();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: S.dimens.defaultPadding_16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: S.dimens.defaultPadding_16),
                child: Text(
                  'Event Name',
                  style: S.textStyles.titleHeavy,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                  vertical: S.dimens.defaultPadding_8,
                ),
                child: CustomTextFormField(
                  controller:
                      ref.watch(uploadEventsNotifierProvider).nameController,
                  hintText: 'Name',
                  obscureText: false,
                  suffixIconData: GestureDetector(
                    onTap: () {
                      ref
                          .watch(uploadEventsNotifierProvider.notifier)
                          .clearPress(ref
                              .watch(uploadEventsNotifierProvider)
                              .nameController);
                    },
                    child: const Icon(FontAwesomeIcons.xmark),
                  ),
                ),
              ),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                ),
                child: Text(
                  'Description',
                  style: S.textStyles.titleHeavy,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                  vertical: S.dimens.defaultPadding_8,
                ),
                child: CustomTextFormField(
                  maxLines: 6,
                  hintText: 'Description',
                  controller: ref
                      .watch(uploadEventsNotifierProvider)
                      .descriptionController,
                  obscureText: false,
                  suffixIconData: GestureDetector(
                    onTap: () {
                      ref
                          .watch(uploadEventsNotifierProvider.notifier)
                          .clearPress(ref
                              .watch(uploadEventsNotifierProvider)
                              .descriptionController);
                    },
                    child: const Icon(
                      FontAwesomeIcons.xmark,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                ),
                child: Text(
                  'Pick Start Date',
                  style: S.textStyles.titleHeavy,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                  vertical: S.dimens.defaultPadding_8,
                ),
                child: CustomTextOuntlineButton(
                  text: ref.watch(uploadEventsNotifierProvider).startDate,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025),
                    ).then((value) {
                      if (value != null) {
                        ref.watch(uploadEventsNotifierProvider).startDate =
                            DateFormat('dd/MM/yyyy').format(value);
                        ref
                            .watch(uploadEventsNotifierProvider.notifier)
                            .updateStartDate(
                                DateFormat('dd/MM/yyyy').format(value));
                        ref
                            .watch(uploadEventsNotifierProvider.notifier)
                            .updateDateTime(value);
                      } else {}
                    });
                  },
                ),
              ),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                ),
                child: Text(
                  'Pick Start Date',
                  style: S.textStyles.titleHeavy,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                  vertical: S.dimens.defaultPadding_8,
                ),
                child: CustomTextOuntlineButton(
                  text: ref.watch(uploadEventsNotifierProvider).endDate,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2025),
                    ).then((value) {
                      if (value != null) {
                        if (ref
                            .watch(uploadEventsNotifierProvider.notifier)
                            .compareDate(value)) {
                          ref.watch(uploadEventsNotifierProvider).endDate =
                              DateFormat('dd/MM/yyyy').format(value);
                          ref
                              .watch(uploadEventsNotifierProvider.notifier)
                              .updateEndDate(
                                  DateFormat('dd/MM/yyyy').format(value));
                          ref
                              .watch(uploadEventsNotifierProvider.notifier)
                              .updateDateTime2(value);
                        } else {}
                      } else {}
                    });
                  },
                ),
              ),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                ),
                child: CustomButton(
                  text: 'Upload',
                  onPressed: () {
                    ref.watch(uploadEventsNotifierProvider.notifier).upload(
                          ref
                              .watch(uploadEventsNotifierProvider)
                              .nameController
                              .text,
                          ref
                              .watch(uploadEventsNotifierProvider)
                              .descriptionController
                              .text,
                          ref.watch(uploadEventsNotifierProvider).startDate,
                          ref.watch(uploadEventsNotifierProvider).endDate,
                        );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
