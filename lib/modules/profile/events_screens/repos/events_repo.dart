import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events_toy.dart';

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

  Future<void> updateEventFinished(String id, bool a) async {
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc(id)
          .update({
            "finished": a,
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

  Future<void> checkEventFinished() async {
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .where("finished")
          .get()
          .then((value) {
        for (var doc in value.docs) {
          final date = DateTime.parse(doc["endDate"].toString());
          if (date.isBefore(DateTime.now())) {
            updateEventFinished(doc.id, true);
          } else {
            updateEventFinished(doc.id, false);
          }
        }
      });
    } catch (e) {
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
  }

  //============================================================================

  Future<String> uploadToyEventsToFireStore({
    required EventsToy eventsToy,
  }) async {
    String _result = "";
    try {
      await FirebaseFirestore.instance
          .collection('toyEvents')
          .add(
            eventsToy.toMap(),
          )
          .then(
        (value) {
          updateToyEventID(value.id);
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

  Future<void> updateToyEventID(
    String id,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('toyEvents')
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

  Future<List<String>> uploadImageToStorage(
    List<String> images,
    String toyEventId,
  ) async {
    List<String> firebaseImagePath = [];
    int i = 1;
    for (var image in images) {
      try {
        File file = File(image);
        String imageName = "image" + i.toString();
        var ref = FirebaseStorage.instance
            .ref()
            .child('toyEvents/$toyEventId/')
            .child(imageName);
        await ref.putFile(file);
        String firebasePath = await ref.getDownloadURL();
        firebaseImagePath.add(firebasePath);
        i++;
      } catch (e) {
        log("uploadEventToyToFireStore" + e.toString());
        final _errorMessage = Exceptions.errorMessage(e);
        Fluttertoast.showToast(msg: _errorMessage);
      }
    }
    return firebaseImagePath;
  }

  Future<bool> updateToyEventsImages(
    String toyEventId,
    List<String> images,
  ) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('toyEvents')
          .doc(toyEventId)
          .update({
        "image": images,
      }).then((value) {
        _result = true;
        log("Images successfully updated!");
      });
    } catch (e) {
      log("update images to firestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<bool> getToyEventsListFromFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('toyEvents')
          .get()
          .then((value) {
        for (var doc in value.docs) {}
      });
    } catch (e) {
      log("upload Toy Events ToFireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return true;
  }
}
