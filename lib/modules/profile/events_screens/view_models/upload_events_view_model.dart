import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/repos/user_repo.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/repos/events_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/widgets/Toast.dart';

class UploadEventsSetting {
  TextEditingController nameController;
  TextEditingController descriptionController;
  String startDate;
  String endDate;
  bool finished;
  DateTime dateTime;
  DateTime dateTime2;

  UploadEventsSetting({
    required this.nameController,
    required this.descriptionController,
    required this.startDate,
    required this.endDate,
    required this.finished,
    required this.dateTime,
    required this.dateTime2,
  });

  UploadEventsSetting copy({
    TextEditingController? nameController,
    TextEditingController? descriptionController,
    String? startDate,
    String? endDate,
    bool? finished,
    DateTime? dateTime,
    DateTime? dateTime2,
  }) =>
      UploadEventsSetting(
        nameController: nameController ?? this.nameController,
        descriptionController:
            descriptionController ?? this.descriptionController,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        finished: finished ?? this.finished,
        dateTime: dateTime ?? this.dateTime,
        dateTime2: dateTime2 ?? this.dateTime2,
      );
}

class UploadEventsNotifier extends StateNotifier<UploadEventsSetting> {
  UploadEventsNotifier(this.ref)
      : super(
          UploadEventsSetting(
            nameController: TextEditingController(),
            descriptionController: TextEditingController(),
            startDate: '',
            endDate: '',
            finished: false,
            dateTime: DateTime.now(),
            dateTime2: DateTime.now(),
          ),
        ) {
    _eventsRepo = ref.watch(eventsRepoProvider);
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late EventsRepo _eventsRepo;
  late UserRepo _userRepo;

  void clearPress(TextEditingController controller) {
    controller.clear();
  }

  void updateFinished(bool a) {
    final newState = state.copy(finished: a);
    state = newState;
  }

  void updateDateTime(DateTime a) {
    final newState = state.copy(dateTime: a);
    state = newState;
  }

  void updateDateTime2(DateTime a) {
    final newState = state.copy(dateTime2: a);
    state = newState;
  }

  void updateStartDate(String a) {
    final newState = state.copy(startDate: a);
    state = newState;
  }

  void updateEndDate(String a) {
    final newState = state.copy(endDate: a);
    state = newState;
  }

  bool compareDateAfter(DateTime a) {
    bool result = false;
    if (a.isAfter(state.dateTime)) {
      result = true;
    } else {
      Fluttertoast.showToast(msg: 'Invalid date');
      result = false;
    }
    return result;
  }

  bool compareDate(DateTime a) {
    bool result = false;
    if (a.isBefore(state.dateTime)) {
      Fluttertoast.showToast(msg: 'Invalid date');
      result = false;
    } else {
      result = true;
    }
    return result;
  }

  bool checkEvent(String name, String startDate, String endDate) {
    bool result = false;
    if (name.isEmpty || startDate.isEmpty || endDate.isEmpty) {
      return result;
    } else {
      result = true;
    }
    return result;
  }

  void goBack() {
    state.nameController.clear();
    state.descriptionController.clear();
    state.startDate = '';
    state.endDate = '';
    NavigationService.goBack();
  }

  Future<void> upload(
      String name, String description, String startDate, String endDate) async {
    if (!compareDateAfter(state.dateTime2)) {
      Fluttertoast.showToast(msg: 'Invalid Date!');
    } else if (checkEvent(name, startDate, endDate)) {
      final eventNameChecked = await checkExistEventName(name);
      if (eventNameChecked != null) {
        {
          if (!eventNameChecked) {
            uploadToyToFirebase(
                name: name,
                description: description,
                startDate: startDate,
                endDate: endDate,
                finished: false);
            goBack();
            Fluttertoast.showToast(msg: 'Success');
          } else {
            Fluttertoast.showToast(msg: "Event's name is already exists!");
          }
        }
      }
    } else {
      Fluttertoast.showToast(msg: 'Fill up the blank!');
    }
  }

  Future uploadToyToFirebase({
    required String name,
    String? description,
    required String startDate,
    required String endDate,
    required bool finished,
  }) async {
    EventModel eventModel = EventModel(
      endDate: endDate,
      finished: false,
      description: description,
      id: '',
      name: name,
      startDate: startDate,
      userId: _userRepo.userModel!.id,
    );

    _eventsRepo.uploadEventsToFireStore(eventModel: eventModel);
  }

  Future<bool?> checkExistEventName(String eventname) async {
    bool? _result = false;
    try {
      await FirebaseFirestore.instance.collection('events').get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            if (doc["name"].toString() == eventname) {
              _result = true;
            }
          }
        },
      );
      _result ??= false;
      return _result;
    } catch (e) {
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }
}

final uploadEventsNotifierProvider =
    StateNotifierProvider<UploadEventsNotifier, UploadEventsSetting>(
        ((ref) => UploadEventsNotifier(ref)));
