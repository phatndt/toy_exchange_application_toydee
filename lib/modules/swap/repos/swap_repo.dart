import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/swap_toy.dart';

import '../../../core/errors/exceptions.dart';

final swapRepoRepoProvider = Provider<SwapRepo>((ref) => SwapRepo());

class SwapRepo {
  Future<bool?> uploadSwapToyToFireStore({
    required SwapToy swapToy,
  }) async {
    bool? _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .add(
            swapToy.toMap(),
          )
          .then((value) => updateToyId(value.id));
      return _result;
    } catch (e) {
      log("uploadSwapToyToFireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
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
}
