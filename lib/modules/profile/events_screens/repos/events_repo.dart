import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events.dart';

import '../../../../core/errors/exceptions.dart';

final eventsRepoProvider = Provider<EventsRepo>((ref) => EventsRepo());

class EventsRepo {
  Future<String> uploadEventsToFireStore({
    required EventModel eventModel,
  }) async {
    String _result = "";
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .add(
            eventModel.toMap(),
          )
          .then(
        (value) {
          updateEventID(value.id);
          _result = value.id;
        },
      );
    } catch (e) {
      log("upload Event To FireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<void> updateEventID(
    String id,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc(id)
          .update({
            "id": id,
          })
          .then((value) => log("Event successfully updated!"))
          .onError((error, stackTrace) =>
              log("Event failed updated: " + error.toString()));
    } catch (e) {
      log("upload Event To FireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
  }
}
