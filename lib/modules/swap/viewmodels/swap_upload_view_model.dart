import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/repos/user_repo.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';
import 'package:toy_exchange_application_toydee/modules/swap/repos/swap_repo.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/styles.dart';
import '../../authentication/repos/auth_repo.dart';
import '../models/swap_toy.dart';

class UploadSwapSetting {
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

  UploadSwapSetting(
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

  UploadSwapSetting copy({
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
      UploadSwapSetting(
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

class UploadSwapSettingNotifier extends StateNotifier<UploadSwapSetting> {
  UploadSwapSettingNotifier(this.ref)
      : super(
          UploadSwapSetting(
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
    _swapRepo = ref.watch(swapRepoRepoProvider);
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late SwapRepo _swapRepo;
  late UserRepo _userRepo;

  uploadToyToFirebase({
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
  }) {
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

    SwapToy swapToy = SwapToy(
      id: "",
      userId: _userRepo.userModel!.id,
      name: title,
      description: description,
      location: address,
      toyType: toyType,
      isSwapped: false,
      isValid: true,
    );
    _swapRepo.uploadSwapToyToFireStore(swapToy: swapToy);
  }
}

final uploadSwapSettingNotifierProvider =
    StateNotifierProvider<UploadSwapSettingNotifier, UploadSwapSetting>(
        ((ref) => UploadSwapSettingNotifier(ref)));


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