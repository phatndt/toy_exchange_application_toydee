import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/request/components/request_swap_toy_card.dart';
import 'package:toy_exchange_application_toydee/modules/request/model/request.dart';
import 'package:toy_exchange_application_toydee/modules/request/repos/request_repo.dart';

import '../../../core/styles/styles.dart';
import '../../../core/widgets/Toast.dart';

class RequestSetting {
  String selectedSwapToy;
  String swapToyUser;
  RequestSetting({
    required this.selectedSwapToy,
    required this.swapToyUser,
  });

  RequestSetting copy({
    String? selectedSwapToy,
    String? swapToyUser,
  }) =>
      RequestSetting(
        selectedSwapToy: selectedSwapToy ?? this.selectedSwapToy,
        swapToyUser: swapToyUser ?? this.swapToyUser,
      );
}

class RequestSettingNotifier extends StateNotifier<RequestSetting> {
  RequestSettingNotifier(this.ref)
      : super(RequestSetting(selectedSwapToy: "", swapToyUser: "")) {
    _requestRepo = ref.watch(requestRepoProvider);
  }
  final Ref ref;
  late RequestRepo _requestRepo;

  Future<bool> checkSwapToyOfUser(String swapToyId, context) async {
    final _result = await _requestRepo.checkSwapToyOfUser(swapToyId);
    return _result;
  }

  updateSelectedSwapToy(String uid) {
    final newState = state.copy(selectedSwapToy: uid);
    state = newState;
  }

  updateSwapToyUser(String uid) {
    final newState = state.copy(swapToyUser: uid);
    state = newState;
  }

  addRequestToFirestore(
    String requestedSwapToyId,
    String requestedUserId,
    String requestingSwapToyId,
    String requestingUserId,
    BuildContext context,
  ) async {
    Request request = Request(
        id: "",
        requestedSwapToyId: requestedSwapToyId,
        requestedUserId: requestedUserId,
        requestingSwapToyId: requestingSwapToyId,
        requestingUserId: requestingUserId,
        status: "waiting");
    final _checkExist = await _requestRepo.checkExistRequest(request);
    if (_checkExist) {
      CustomToast.fToast.init(context);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: const CustomToastBuilder(
              msg: "You already requested this toy.",
              icon: FontAwesomeIcons.exclamation));
    } else {
      _requestRepo.addRequestToFirestore(request);
    }
  }

  updateDeclineRequest(String uid) {
    _requestRepo.updateDeclineRequest(uid);
  }

  updateAcceptRequest(String uid) {
    _requestRepo.updateAcceptRequest(uid);
  }
}

final requestSettingNotifier =
    StateNotifierProvider<RequestSettingNotifier, RequestSetting>(
        (ref) => RequestSettingNotifier(ref));

final requestNotificationProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
        (ref, requestingUserId) {
  log(requestingUserId);
  return FirebaseFirestore.instance
      .collection('swap')
      .where('requestedUserId', isEqualTo: requestingUserId)
      .snapshots();
});

final requestSwapToyListProvider =
    StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) {
  return FirebaseFirestore.instance
      .collection('swapToy')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
});

final swapToyListProvider = FutureProvider(
  (ref) => ref.watch(requestRepoProvider).getSwapToyListByUserFromFirestore(),
);
