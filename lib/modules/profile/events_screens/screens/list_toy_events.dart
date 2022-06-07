import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/modules/home/components/swap_top_item.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/list_events_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_events_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_view_model.dart';

import '../../../../core/routing/route_paths.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';
import '../../../swap/models/toy_type.dart';

class ListToyEvents extends ConsumerWidget {
  const ListToyEvents({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: S.dimens.defaultPadding_8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    T.eventToyListTitle,
                    style: S.textStyles.h3,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: S.dimens.defaultPadding_8,
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
                      NavigationService.goBack();
                    },
                  ),
                  CustomIconButton(
                    color: S.colors.primary,
                    backgroundColor: S.colors.accent_5,
                    text: FontAwesomeIcons.circleDollarToSlot,
                    onPressed: () {
                      NavigationService.push(
                        page: RoutePaths.uploadToyEventsMain,
                        isNamed: true,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: S.dimens.defaultPadding_8,
                  horizontal: S.dimens.defaultPadding_8,
                ),
                child: ref
                    .watch(listToyEventProvider(ref
                        .watch(uploadToyEventsSettingNotifierProvider)
                        .eventId))
                    .when(
                      data: (data) {
                        return GridView.builder(
                          itemCount: data.size,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: S.dimens.defaultPadding_4,
                            mainAxisSpacing: S.dimens.defaultPadding_4,
                            childAspectRatio: 0.725,
                          ),
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = data.docs[index];
                            return SwapToyCard(
                              name: doc['name'],
                              condition:
                                  ToyType.fromMap(doc['toyType']).condition,
                              showingImage:
                                  List<String>.from(doc['image']).first,
                              uid: doc['id'],
                            );
                          },
                        );
                      },
                      error: (error, stack) => Center(
                        child: Lottie.network(
                            'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
