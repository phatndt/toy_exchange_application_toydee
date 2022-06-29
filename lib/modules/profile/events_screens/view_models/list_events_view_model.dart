import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events_toy.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/repos/events_repo.dart';

class ListEventSetting {
  List<EventModel> listEvent;

  ListEventSetting({
    required this.listEvent,
  });

  ListEventSetting copy({
    List<EventModel>? listEvent,
  }) =>
      ListEventSetting(
        listEvent: listEvent ?? this.listEvent,
      );
}

class ListEventSettingNotifier extends StateNotifier<ListEventSetting> {
  ListEventSettingNotifier(this.ref)
      : super(ListEventSetting(
          listEvent: [],
        )) {
    _eventsRepo = ref.watch(eventsRepoProvider);
  }

  final Ref ref;
  late EventsRepo _eventsRepo;
}

final listEventSettingNotifier =
    StateNotifierProvider<ListEventSettingNotifier, ListEventSetting>(
        (ref) => ListEventSettingNotifier(ref));

final listEventProvider =
    StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) {
  return FirebaseFirestore.instance.collection('events').snapshots();
});

final listMyEventProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
        (ref, userId) {
  return FirebaseFirestore.instance
      .collection('events')
      .where('userId', isEqualTo: userId)
      .snapshots();
});

final listToyEventProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
        (ref, eventId) {
  return FirebaseFirestore.instance
      .collection('toyEvents')
      .where('eventId', isEqualTo: eventId)
      .snapshots();
});

final eventToyProvider = FutureProvider.family<EventsToy?, String>(
    (ref, uid) => ref.watch(eventsRepoProvider).getEventsToyByUid(uid));
