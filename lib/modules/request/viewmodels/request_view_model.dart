import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:toy_exchange_application_toydee/modules/request/repos/request_repo.dart';

import '../../../core/styles/styles.dart';
import '../../../core/widgets/Toast.dart';

class RequestSetting {
  String selectedSwapToy;
  RequestSetting({
    required this.selectedSwapToy,
  });

  RequestSetting copy({String? selectedSwapToy}) => RequestSetting(
        selectedSwapToy: selectedSwapToy ?? this.selectedSwapToy,
      );
}

class RequestSettingNotifier extends StateNotifier<RequestSetting> {
  RequestSettingNotifier(this.ref)
      : super(RequestSetting(selectedSwapToy: "")) {
    _requestRepo = ref.watch(requestRepoProvider);
  }
  final Ref ref;
  late RequestRepo _requestRepo;

  checkSwapToyOfUser(String swapToyId, context) {
    _requestRepo.checkSwapToyOfUser(swapToyId).then(
      (value) {
        if (value) {
          CustomToast.fToast.init(context);
          CustomToast.fToast.showToast(
              gravity: ToastGravity.TOP,
              child: const CustomToastBuilder(
                  msg: "It is your toy!", icon: FontAwesomeIcons.exclamation));
        } else {
          showMaterialModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(S.dimens.defaultBorderRadius),
              ),
            ),
            context: context,
            builder: (builder) {
              return SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Column(
                  children: [
                    SizedBox(
                      height: 400.h,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          ref.refresh(swapToyListProvider);
                        },
                        child: ref.watch(swapToyListProvider).when(
                              data: (data) {
                                return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return RequestSwapToyCard(
                                      press: () {
                                        final newState = state.copy(
                                            selectedSwapToy: data[index].id);
                                        state = newState;
                                      },
                                      itemName: data[index].name,
                                      itemPrice: "",
                                      itemDistance: "",
                                      itemImagePath: data[index].image.first,
                                      index: data[index].id,
                                    );
                                  },
                                );
                              },
                              error: (error, stack) => Center(
                                  child: Lottie.network(
                                      'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json')),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(S.dimens.defaultPaddingVertical_16),
                      child: CustomButton(
                          text: "Swap",
                          onPressed: () {
                            //NavigationService.goBack();
                          }),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
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
      .where('requestingUserId', isEqualTo: requestingUserId)
      .snapshots();
});

final swapToyListProvider = FutureProvider((ref) =>
    ref.watch(requestRepoProvider).getSwapToyListByUserFromFirestore());
