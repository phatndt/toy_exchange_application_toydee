import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/widgets/header_screen.dart';
import 'package:toy_exchange_application_toydee/modules/request/viewmodels/request_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';
import '../components/request_notification_done.dart';
import '../components/request_notification_model.dart';
import '../model/request.dart';

class RequestScreen extends ConsumerWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: S.dimens.defaultPaddingVertical_8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: S.dimens.defaultPadding_48,
                      child: Center(
                        child: Text(
                          "",
                          style: S.textStyles.h2Primary,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          text: FontAwesomeIcons.angleLeft,
                          backgroundColor: S.colors.background_2,
                          color: S.colors.primary,
                          onPressed: () {
                            NavigationService.goBack();
                          },
                        ),
                        CustomIconButton(
                          text: FontAwesomeIcons.message,
                          backgroundColor: S.colors.background_2,
                          color: S.colors.primary,
                          onPressed: () {
                            NavigationService.push(
                              page: RoutePaths.chattingScreen,
                              isNamed: true,
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_16,
              ),
              ref
                  .watch(requestNotificationProvider(
                      FirebaseAuth.instance.currentUser!.uid))
                  .when(
                    data: (data) {
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index) {
                              return RequestNotificationCard(
                                request:
                                    Request.fromMap(data.docs[index].data()),
                              );
                            }),
                      );
                    },
                    error: (error, stack) => const Center(
                      child: Text("Error"),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
