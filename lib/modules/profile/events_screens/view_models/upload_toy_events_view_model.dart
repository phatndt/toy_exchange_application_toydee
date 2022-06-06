import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/repos/user_repo.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events_toy.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/repos/events_repo.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/upload_toy_events_main_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';

import '../../../../core/routing/route_paths.dart';

class UploadToyEventsSetting {
  String imagePathOne;
  String imagePathTwo;
  String imagePathThree;
  List<int> categories;
  int condition;
  int gendertype;
  int agegroup;

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;

  final GroupButtonController groupButtonControllerCategories;
  final GroupButtonController groupButtonControllerCondition;
  final GroupButtonController groupButtonControllerGenderType;
  final GroupButtonController groupButtonControllerAgeGroup;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode locationFocusNode = FocusNode();

  bool phoneLocation;
  bool swapAvailable;

  UploadToyEventsSetting(
      {required this.imagePathOne,
      required this.imagePathTwo,
      required this.imagePathThree,
      required this.titleController,
      required this.descriptionController,
      required this.locationController,
      required this.categories,
      required this.condition,
      required this.gendertype,
      required this.agegroup,
      required this.groupButtonControllerCategories,
      required this.groupButtonControllerCondition,
      required this.groupButtonControllerGenderType,
      required this.groupButtonControllerAgeGroup,
      required this.phoneLocation,
      required this.swapAvailable});

  UploadToyEventsSetting copy({
    String? imagePathOne,
    String? imagePathTwo,
    String? imagePathThree,
    TextEditingController? titleController,
    TextEditingController? descriptionController,
    TextEditingController? locationController,
    List<int>? categories,
    int? condition,
    int? gendertype,
    int? agegroup,
    GroupButtonController? groupButtonControllerCategories,
    GroupButtonController? groupButtonControllerCondition,
    GroupButtonController? groupButtonControllerGenderType,
    GroupButtonController? groupButtonControllerAgeGroup,
    bool? phoneLocation,
    bool? swapAvailable,
  }) =>
      UploadToyEventsSetting(
        imagePathOne: imagePathOne ?? this.imagePathOne,
        imagePathTwo: imagePathTwo ?? this.imagePathTwo,
        imagePathThree: imagePathThree ?? this.imagePathThree,
        titleController: titleController ?? this.titleController,
        descriptionController:
            descriptionController ?? this.descriptionController,
        locationController: locationController ?? this.locationController,
        categories: categories ?? this.categories,
        condition: condition ?? this.condition,
        gendertype: gendertype ?? this.gendertype,
        agegroup: agegroup ?? this.agegroup,
        groupButtonControllerCategories: groupButtonControllerCategories ??
            this.groupButtonControllerCategories,
        groupButtonControllerCondition: groupButtonControllerCondition ??
            this.groupButtonControllerCondition,
        groupButtonControllerGenderType: groupButtonControllerGenderType ??
            this.groupButtonControllerGenderType,
        groupButtonControllerAgeGroup:
            groupButtonControllerAgeGroup ?? this.groupButtonControllerAgeGroup,
        phoneLocation: phoneLocation ?? this.phoneLocation,
        swapAvailable: swapAvailable ?? this.swapAvailable,
      );

  void clearTitle() {
    titleController.clear();
  }

  void clearDescription() {
    descriptionController.clear();
  }

  void addCategories(int index) {
    categories.add(index);
  }

  void removeCategories(int index) {
    categories.remove(index);
  }

  void selectCondition(int index) {
    condition = index;
  }

  void selectGenderType(int index) {
    gendertype = index;
  }

  void selectAgeGroup(int index) {
    agegroup = index;
  }

  void clearFilters() {
    categories.clear();
    condition = 0;
    gendertype = 0;
    agegroup = 0;
    groupButtonControllerCategories.unselectAll();
    groupButtonControllerCondition.unselectAll();
    groupButtonControllerGenderType.unselectAll();
    groupButtonControllerAgeGroup.unselectAll();
  }

  void updatePhoneLocation(value) {
    phoneLocation = value;
  }

  void updateSwapAvailable(value) {
    swapAvailable = value;
  }
}

class UploadToyEventsSettingNotifier
    extends StateNotifier<UploadToyEventsSetting> {
  UploadToyEventsSettingNotifier(this.ref)
      : super(
          UploadToyEventsSetting(
            imagePathOne: "",
            imagePathTwo: "",
            imagePathThree: "",
            titleController: TextEditingController(),
            descriptionController: TextEditingController(),
            locationController: TextEditingController(),
            categories: [],
            condition: 0,
            gendertype: 0,
            agegroup: 0,
            groupButtonControllerCategories: GroupButtonController(),
            groupButtonControllerCondition: GroupButtonController(),
            groupButtonControllerGenderType: GroupButtonController(),
            groupButtonControllerAgeGroup: GroupButtonController(),
            phoneLocation: false,
            swapAvailable: false,
          ),
        ) {
    _eventsRepo = ref.watch(eventsRepoProvider);
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late EventsRepo _eventsRepo;
  late UserRepo _userRepo;

  uploadToyEventsToFirebase({
    required String imagePathOne,
    required String imagePathTwo,
    required String imagePathThree,
    required String title,
    required String description,
    required Set<int> categories,
    required int condition,
    required int genderType,
    required int ageGroup,
    // required Address address,
  }) async {
    Address address = Address(
      address: "1",
      detailAddress: "2",
      latitude: "3",
      longitude: "3",
    );

    ToyType toyType = ToyType(
      categories: categories.toList(),
      condition: condition,
      genderType: genderType,
      ageGroup: ageGroup,
    );

    List<String> images = [imagePathOne, imagePathTwo, imagePathThree];

    EventsToy toyEvents = EventsToy(
      id: "",
      userId: _userRepo.userModel!.id,
      eventId: '',
      name: title,
      description: description,
      location: address,
      toyType: toyType,
      image: images,
      createDate: DateTime.now(),
      isSwapped: false,
      isValid: true,
    );

    final String toyEventsId =
        await _eventsRepo.uploadToyEventsToFireStore(eventsToy: toyEvents);

    if (toyEventsId.isNotEmpty) {
      final List<String> firebaseImagesPath =
          await _eventsRepo.uploadImageToStorage(images, toyEventsId);
      if (firebaseImagesPath.isNotEmpty) {
        _eventsRepo
            .updateToyEventsImages(toyEventsId, firebaseImagesPath)
            .then((value) {
          if (value) {
            NavigationService.push(
              page: RoutePaths.uploadToyEventsDone,
              isNamed: true,
            );
          } else {}
        });
      }
    } else {}
  }
}

final uploadToyEventsSettingNotifierProvider = StateNotifierProvider<
    UploadToyEventsSettingNotifier,
    UploadToyEventsSetting>(((ref) => UploadToyEventsSettingNotifier(ref)));


//  LocationPermission permission;

//                 permission = await Geolocator.checkPermission();

//                 if (permission == LocationPermission.denied) {
//                   permission = await Geolocator.requestPermission();
//                   if (permission == LocationPermission.denied) {
//                     return Future.error('Location Permissions are denied');
//                   }
//                 }
//                 Position position = await Geolocator.getCurrentPosition();
//                 log('1');
//                 List<Placemark> placemarks = await placemarkFromCoordinates(
//                     position.latitude, position.longitude);
//                 log(placemarks[0].toString());
//                 log('2');