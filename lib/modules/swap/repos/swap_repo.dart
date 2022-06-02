import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/swap_toy.dart';

import '../../../core/errors/exceptions.dart';

final swapRepoRepoProvider = Provider<SwapRepo>((ref) => SwapRepo());

class SwapRepo {
  Future<String> uploadSwapToyToFireStore({
    required SwapToy swapToy,
  }) async {
    String _result = "";
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .add(
            swapToy.toMap(),
          )
          .then(
        (value) {
          updateToyId(value.id);
          _result = value.id;
        },
      );
    } catch (e) {
      log("uploadSwapToyToFireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<void> updateToyId(
    String toyId,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .doc(toyId)
          .update({
            "id": toyId,
          })
          .then((value) => log("ToyId successfully updated!"))
          .onError((error, stackTrace) =>
              log("ToyId failed updated: " + error.toString()));
    } catch (e) {
      log("uploadSwapToyToFireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
  }

  Future<List<String>> uploadImageToStorage(
    List<String> images,
    String swapToyId,
  ) async {
    List<String> firebaseImagePath = [];
    int i = 1;
    for (var image in images) {
      try {
        File file = File(image);
        String imageName = "image" + i.toString();
        var ref = FirebaseStorage.instance
            .ref()
            .child('swapToy/$swapToyId/')
            .child(imageName);
        await ref.putFile(file);
        String firebasePath = await ref.getDownloadURL();
        firebaseImagePath.add(firebasePath);
        i++;
      } catch (e) {
        log("uploadSwapToyToFireStore" + e.toString());
        final _errorMessage = Exceptions.errorMessage(e);
        Fluttertoast.showToast(msg: _errorMessage);
      }
    }
    return firebaseImagePath;
  }

  Future<void> updateSwapToyImages(
    String swapToyId,
    List<String> images,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .doc(swapToyId)
          .update({
            "image": images,
          })
          .then((value) => log("Images successfully updated!"))
          .onError((error, stackTrace) =>
              log("ToyId failed updated: " + error.toString()));
    } catch (e) {
      log("update images to firestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
  }

  Future<bool> getSwapToyListFromFirestore() async {
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .get()
          .then((value) {
        for (var doc in value.docs) {}
      });
    } catch (e) {
      log("uploadSwapToyToFireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return true;
  }
}
