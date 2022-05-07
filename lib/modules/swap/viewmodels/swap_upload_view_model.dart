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

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/styles.dart';
import '../../authentication/repos/auth_repo.dart';

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
    _authRepo = ref.watch(authRepoProvider);
  }

  final Ref ref;
  late AuthRepo _authRepo;
  late UserRepo _userRepo;

  String convertCategories(Set<int> indexes) {
    String _result = "";
    for (var index in indexes) {
      switch (index) {
        case 0:
          _result = _result + "Educational ";
          break;
        case 1:
          _result = _result + "Wooden ";
          break;
        case 2:
          _result = _result + "Board Games ";
          break;
        case 3:
          _result = _result + "Robot ";
          break;
        case 4:
          _result = _result + "Military ";
          break;
        case 5:
          _result = _result + "Beach ";
          break;
        case 6:
          _result = _result + "Kitchen ";
          break;
        case 7:
          _result = _result + "Slime ";
          break;
        case 8:
          _result = _result + "Doll ";
          break;
        case 9:
          _result = _result + "Teddy Bears ";
          break;
        case 10:
          _result = _result + "Food ";
          break;
        case 11:
          _result = _result + "Others ";
          break;
      }
    }
    return _result;
  }

  String convertCondition(int index) {
    String _result = "";
    switch (index) {
      case 0:
        _result = "New";
        break;
      case 1:
        _result = "Used";
        break;
    }
    return _result;
  }

  String convertGenderType(int index) {
    String _result = "";
    switch (index) {
      case 0:
        _result = "Boy";
        break;
      case 1:
        _result = "Girl";
        break;
      case 2:
        _result = "Both";
        break;
    }
    return _result;
  }

  String convertAgeGroup(int index) {
    String _result = "";
    switch (index) {
      case 0:
        _result = "0 - 5";
        break;
      case 1:
        _result = "6 - 10";
        break;
      case 2:
        _result = "11 - 15";
        break;
      case 3:
        _result = "16 - 20";
        break;
      case 4:
        _result = "21 - 30";
        break;
      case 5:
        _result = "31 - ...";
        break;
    }
    return _result;
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