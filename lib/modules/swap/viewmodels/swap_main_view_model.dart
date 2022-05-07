import 'dart:developer';
import 'dart:io';

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

class MainSwapSetting {
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

  MainSwapSetting(
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

  MainSwapSetting copy({
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
      MainSwapSetting(
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

class MainSwapSettingNotifier extends StateNotifier<MainSwapSetting> {
  MainSwapSettingNotifier(this.ref)
      : super(
          MainSwapSetting(
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

  void updateImagePathOne(String path) {
    final newState = state.copy(imagePathOne: path);
    state = newState;
  }

  void updateImagePathTwo(String path) {
    final newState = state.copy(imagePathTwo: path);
    state = newState;
  }

  void updateImagePathThree(String path) {
    final newState = state.copy(imagePathThree: path);
    state = newState;
  }

  void clearTitle() {
    state.clearTitle();
  }

  void clearDescription() {
    state.clearDescription();
  }

  // getImagePathOne() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     updateImagePathOne(pickedFile.path);
  //     //File imageFile = File(pickedFile.path);
  //     //return pickedFile.path;
  //   }
  // }

  // getImagePathTwo() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     // maxWidth: 1800,
  //     // maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     updateImagePathTwo(pickedFile.path);
  //     //File imageFile = File(pickedFile.path);
  //     //return pickedFile.path;
  //   }
  // }

  // getImagePathThree() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     // maxWidth: 1800,
  //     // maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     updateImagePathThree(pickedFile.path);
  //     //File imageFile = File(pickedFile.path);
  //     //return pickedFile.path;
  //   }
  // }

  void showImageSourceActionSheet(BuildContext context, int index) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Camera'),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera, index);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Gallery'),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery, index);
              },
            )
          ],
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Wrap(children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.camera, index);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.gallery, index);
            },
          ),
        ]),
      );
    }
  }

  void selectImageSource(ImageSource imageSource, int index) async {
    final _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(source: imageSource);

    if (pickedImage == null) {
      return;
    }
    switch (index) {
      case 1:
        updateImagePathOne(pickedImage.path);
        break;
      case 2:
        updateImagePathTwo(pickedImage.path);
        break;
      case 3:
        updateImagePathThree(pickedImage.path);
        break;
    }
    //_pathAvatar = pickedImage.path;

    //await uploadImageToFirebase(pickedImage.path, context);
  }

  void addCategories(int index) {
    state.addCategories(index);
  }

  void removeCategories(int index) {
    state.removeCategories(index);
  }

  void selectCondition(int index) {
    state.selectCondition(index);
  }

  void selectGenderType(int index) {
    state.selectGenderType(index);
  }

  void selectAgeGroup(int index) {
    state.selectAgeGroup(index);
  }

  void clearFilters() {
    state.clearFilters();
  }

  void updatePhoneLocation(value) {
    final newState = state.copy(phoneLocation: value);
    state = newState;
  }

  void updateSwapAvailable(value) {
    final newState = state.copy(swapAvailable: value);
    state = newState;
  }

  void getLocation() {
    if (_userRepo.userModel != null) {
      if (_userRepo.userModel!.address == null) {}
    }
  }

  void previewToy() {
    if (checkFilters() || checkFilters() || checkRestOfCondition()) {
      log("message");
      NavigationService.push(
        page: RoutePaths.swapScreenUpload,
        isNamed: true,
      );
    } else {
      Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: "Please enter full information!",
        backgroundColor: S.colors.primary,
        textColor: S.colors.textColor_1,
      );
    }
  }

  checkimagePath() {
    if (state.imagePathOne.isEmpty ||
        state.imagePathTwo.isEmpty ||
        state.imagePathThree.isEmpty) {
      return false;
    }
    return true;
  }

  checkFilters() {
    if (state.groupButtonControllerCategories.selectedIndexes.isEmpty ||
        state.groupButtonControllerCondition.selectedIndexes.isEmpty ||
        state.groupButtonControllerGenderType.selectedIndexes.isEmpty ||
        state.groupButtonControllerAgeGroup.selectedIndexes.isEmpty) {
      return false;
    }
    return true;
  }

  checkRestOfCondition() {
    if (state.titleController.text.isEmpty ||
        state.descriptionController.text.isEmpty ||
        state.locationController.text.isEmpty) {
      return false;
    }
    return true;
  }

  List<String> getList() {
    List<String> lists = [];
    lists.add(state.imagePathOne);
    lists.add(state.imagePathTwo);
    lists.add(state.imagePathThree);
    return lists;
  }
}

final mainSwapSettingNotifierProvider =
    StateNotifierProvider<MainSwapSettingNotifier, MainSwapSetting>(
        ((ref) => MainSwapSettingNotifier(ref)));


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