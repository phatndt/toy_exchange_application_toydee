import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/screens/events_item.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/list_events_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_events_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_view_model.dart';

import '../../../../core/routing/route_paths.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';

class ListMyEvents extends ConsumerWidget {
  const ListMyEvents({Key? key}) : super(key: key);

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
                    T.eventMyListTitle,
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
                    text: FontAwesomeIcons.plus,
                    onPressed: () {
                      NavigationService.push(
                          isNamed: true, page: RoutePaths.uploadEvents);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ref
                  .watch(listMyEventProvider(
                      FirebaseAuth.instance.currentUser!.uid))
                  .when(
                    data: (data) {
                      log(data.size.toString());
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            var doc = data.docs[index];

                            return EventsItem(
                              eventName: doc.data()['name'],
                              startDate: reFormatDate(doc.data()['startDate']),
                              endDate: reFormatDate(doc.data()['endDate']),
                              description: doc.data()['description'],
                              onPress: () {
                                ref
                                    .watch(
                                        uploadToyEventsSettingNotifierProvider
                                            .notifier)
                                    .updateEventId(doc.data()['id']);
                                NavigationService.push(
                                  page: RoutePaths.eventToyList,
                                  isNamed: true,
                                );
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => ListToyEvents(
                                //         eventId: doc.data()['id'])));
                              },
                              userId: doc.data()['userId'],
                              eventId: doc.data()['id'],
                            );
                          },
                        ),
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
            )
          ],
        ),
      ),
    );
  }
}

String reFormatDate(String date) {
  return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
}
