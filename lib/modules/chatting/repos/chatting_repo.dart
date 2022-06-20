import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/modules/request/model/request.dart';

import '../../../core/errors/exceptions.dart';

final chattingRepoProvider = Provider<ChattingRepo>((ref) => ChattingRepo());

class ChattingRepo {
  Future<void> createChatting(Request request) async {
    try {
      await FirebaseFirestore.instance.collection('perChatting').add({
        'requestedUserId': request.requestedUserId,
        'requestingUserId': request.requestingUserId,
      }).then(
        (value) {},
      );
    } catch (e) {
      log("createChatting" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
  }

  Future<bool> checkExistChatting(Request request) async {
    bool _result = true;
    try {
      await FirebaseFirestore.instance
          .collection('perChatting')
          .where('requestedUserId', isEqualTo: request.requestedUserId)
          .where('requestingUserId', isEqualTo: request.requestingUserId)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          _result = false;
        }
      });
    } catch (e) {
      log("createChatting" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<bool> checkExistSecondChatting(Request request) async {
    bool _result = true;
    try {
      await FirebaseFirestore.instance
          .collection('perChatting')
          .where('requestedUserId', isEqualTo: request.requestingUserId)
          .where('requestingUserId', isEqualTo: request.requestedUserId)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          _result = false;
        }
      });
    } catch (e) {
      log("createChatting" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<void> addChattingMessage(
      String userId, String uid, String message) async {
    try {
      await FirebaseFirestore.instance
          .collection('perChatting')
          .doc(uid)
          .collection('messages')
          .add({
        'messageText': message,
        'sentAt': DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
        'sentBy': userId,
      });
    } catch (e) {
      log("createChatting" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
  }
}
