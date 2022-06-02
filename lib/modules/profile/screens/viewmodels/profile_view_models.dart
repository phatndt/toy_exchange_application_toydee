import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../authentication/repos/user_repo.dart';

class ProfileSetting {
  final String imageURL;

  ProfileSetting({
    required this.imageURL,
  });

  ProfileSetting copy({
    String? imageUrl,
  }) =>
      ProfileSetting(
        imageURL: imageUrl ?? this.imageURL,
      );
}

class ProfileNotifier extends StateNotifier<ProfileSetting> {
  ProfileNotifier(this.ref)
      : super(
          ProfileSetting(
            imageURL: "",
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;

  void updateImageURL(String a) {
    final newState = state.copy(imageUrl: a);
    state = newState;
  }

  void upDateImageURLToFireStorage() {}

  String setUserEmailFromFireStore() {
    return _userRepo.userModel!.email;
  }

  String setUserFirstNameFromFireStore() {
    return _userRepo.userModel!.firstName!;
  }

  void showImageSourceActionSheet(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Camera'),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Gallery'),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
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
              selectImageSource(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.gallery);
            },
          ),
        ]),
      );
    }
  }

  void selectImageSource(ImageSource imageSource) async {
    final _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(source: imageSource);

    if (pickedImage == null) {
      return;
    }

    updateImageURL(pickedImage.path);
  }

  void uploadImageToStorage(String imagePath, File imageFile) {}
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileSetting>(
        ((ref) => ProfileNotifier(ref)));
