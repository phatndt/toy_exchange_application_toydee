import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';

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
            imageURL:
                "https://firebasestorage.googleapis.com/v0/b/toyexchangeapplication.appspot.com/o/avatarURL%2Fdefault%2F1.png?alt=media&token=c7989660-75d5-4c0b-8141-93938a299d8e",
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

  String setUserUserNameFromFireStore() {
    return _userRepo.userModel!.username!;
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
    log(pickedImage.name);
    uploadImageToStorage(pickedImage.path);
  }

  void uploadImageToStorage(String imagePath) {
    _userRepo.uploadAndGetImageStorage(imagePath).then((value) {
      if (value != '') {
        _userRepo.updateUserURLToFireStore(value).then((value2) {
          if (value2) {
          } else {
            Fluttertoast.showToast(msg: 'Try later!');
          }
        });
      } else {
        Fluttertoast.showToast(msg: 'Try later!');
      }
    });
  }

  void getImageFromStorage() {
    _userRepo.getUserURLFromFireStore().then((value) {
      if (value != '') {
        updateImageURL(value);
      } else {
        updateImageURL('');
      }
    });
  }

  deleteToy(BuildContext context, String uuid) {
    Dialogs.materialDialog(
        msg: 'Are you sure ? you can\'t undo this',
        title: "Delete",
        color: Colors.white,
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () {
              NavigationService.goBack();
            },
            text: 'Cancel',
            iconData: Icons.cancel_outlined,
            textStyle: const TextStyle(color: Colors.grey),
            iconColor: Colors.grey,
          ),
          IconsButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('swapToy')
                  .doc(uuid)
                  .update({'isValid': false});
              NavigationService.goBack();
              NavigationService.goBack();
            },
            text: 'Delete',
            iconData: Icons.delete,
            color: Colors.red,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileSetting>(
        ((ref) => ProfileNotifier(ref)));

final getSwapToyByUserProvider = StreamProvider.autoDispose(
  (ref) {
    log("getChattingMessageProvider");
    return FirebaseFirestore.instance
        .collection('swapToy')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isValid', isEqualTo: true)
        .snapshots();
  },
);

final profieNotificationProvider = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('swap')
      .where('requestedUserId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('status', isEqualTo: 'waiting')
      .snapshots();
});

final profieSwapAcceptProvider = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('swap')
      .where('requestedUserId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('status', isEqualTo: 'accept')
      .snapshots();
});

final profieDonatiedAcceptProvider = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('events')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
});
