import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/request/model/request.dart';

import '../../../core/errors/exceptions.dart';
import '../../swap/models/swap_toy.dart';

final requestRepoProvider = Provider<RequestRepo>((ref) => RequestRepo());

class RequestRepo {
  Future<List<Request>> getRequestListFromFirestore(
      String requestedSwapToyId) async {
    List<Request> swapToys = [];
    try {
      await FirebaseFirestore.instance
          .collection('swap')
          .where('requestedSwapToyId', isEqualTo: requestedSwapToyId)
          .get()
          .then(
        (value) {
          for (var doc in value.docs) {
            log("getRequestListFromFirestore" + doc.id);
            swapToys.add(Request.fromMap(doc.data()));
          }
        },
      );
    } catch (e) {
      log("getSwapToyListFromFirestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return swapToys;
  }

  Future<bool> checkSwapToyOfUser(String swapToyId) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .doc(swapToyId)
          .get()
          .then(
        (value) {
          _result = value
              .data()!
              .containsValue(FirebaseAuth.instance.currentUser!.uid);
        },
      );
    } catch (e) {
      log("checkSwapToyOfUser " + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<bool> addRequestToFirestore(Request request) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('swap')
          .add(request.toMap())
          .then((value) {
        updateRequestId(value.id);
        _result = true;
      });
    } catch (e) {
      log("checkSwapToyOfUser " + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<void> updateRequestId(String requestId) async {
    await FirebaseFirestore.instance.collection('swap').doc(requestId).update({
      "id": requestId,
    }).then((value) => log("ToyId successfully updated!"));
  }

  Future<bool> checkExistRequest(Request request) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('swap')
          .where('requestedSwapToyId', isEqualTo: request.requestedSwapToyId)
          .where('requestedUserId', isEqualTo: request.requestedUserId)
          .where('requestingSwapToyId', isEqualTo: request.requestingSwapToyId)
          .where('requestingUserId', isEqualTo: request.requestingUserId)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          _result = true;
        }
      });
    } catch (e) {
      log("checkSwapToyOfUser " + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<List<SwapToy>> getSwapToyListByUserFromFirestore() async {
    List<SwapToy> swapToys = [];
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then(
        (value) {
          for (var doc in value.docs) {
            log("getSwapToyListByUserFromFirestore" + doc.id);
            swapToys.add(SwapToy.fromMap(doc.data()));
          }
        },
      );
    } catch (e) {
      log("getSwapToyListByUserFromFirestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return swapToys;
  }

  Future<bool> updateDeclineRequest(String uid) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('swap')
          .doc(uid)
          .update({'status': 'decline'});
    } catch (e) {
      log("getSwapToyListByUserFromFirestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<bool> updateAcceptRequest(String uid) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance
          .collection('swap')
          .doc(uid)
          .update({'status': 'accept'});
    } catch (e) {
      log("getSwapToyListByUserFromFirestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }
}
