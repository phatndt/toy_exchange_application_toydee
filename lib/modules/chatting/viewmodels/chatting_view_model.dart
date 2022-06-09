import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/repos/chatting_repo.dart';
import 'package:toy_exchange_application_toydee/modules/request/model/request.dart';

class ChattingSetting {
  final TextEditingController messageController;
  ChattingSetting({
    required this.messageController,
  });

  ChattingSetting copy({
    TextEditingController? messageController,
  }) =>
      ChattingSetting(
          messageController: messageController ?? this.messageController);
}

class ChattingSettingNotifier extends StateNotifier<ChattingSetting> {
  ChattingSettingNotifier(this.ref)
      : super(ChattingSetting(
          messageController: TextEditingController(),
        )) {
    _chattingRepo = ref.watch(chattingRepoProvider);
  }
  final Ref ref;
  late ChattingRepo _chattingRepo;

  createChatting(Request request) {
    _chattingRepo.createChatting(request);
  }

  addChattingMessage(String uid, String message) {
    _chattingRepo.addChattingMessage(
        FirebaseAuth.instance.currentUser!.uid, uid, message);
  }
}

final chattingSettingNotifier =
    StateNotifierProvider<ChattingSettingNotifier, ChattingSetting>(
        (ref) => ChattingSettingNotifier(ref));

final getChattingProvider = StreamProvider(
  (ref) => FirebaseFirestore.instance
      .collection('perChatting')
      .snapshots(),
);

final getRequestingUserProvider =
    StreamProvider.family<DocumentSnapshot<Map<String, dynamic>>, String>(
  (ref, requestingUser) {
    log("requestingUser");
    return FirebaseFirestore.instance
        .collection('users')
        .doc(requestingUser)
        .snapshots();
  },
);

final getChattingMessageProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
  (ref, uid) {
    log("getChattingMessageProvider");
    return FirebaseFirestore.instance
        .collection('perChatting')
        .doc(uid)
        .collection('messages')
        .orderBy('sentAt', descending: false)
        .snapshots();
  },
);
