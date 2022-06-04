import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toy_exchange_application_toydee/modules/home/repos/home_repo.dart';

import '../../swap/models/swap_toy.dart';

class HomeSetting {
  List<SwapToy> swapToys;
  SwapToy? swapToy;
  bool isSwapToyLoading;
  String search;
  HomeSetting({
    required this.swapToys,
    required this.swapToy,
    required this.isSwapToyLoading,
    required this.search,
  });

  HomeSetting copy({
    List<SwapToy>? swapToys,
    SwapToy? swapToy,
    bool? isSwapToyLoading,
    String? search,
  }) =>
      HomeSetting(
        swapToys: swapToys ?? this.swapToys,
        swapToy: swapToy ?? this.swapToy,
        isSwapToyLoading: isSwapToyLoading ?? this.isSwapToyLoading,
        search: search ?? this.search,
      );
}

class HomeSettingNotifier extends StateNotifier<HomeSetting> {
  HomeSettingNotifier(this.ref)
      : super(HomeSetting(
          swapToys: [],
          swapToy: null,
          isSwapToyLoading: false,
          search: '',
        )) {
    _homeRepo = ref.watch(
      homeRepoRepoProvider,
    );
    getSwapToyListFromFirestore();
  }

  final Ref ref;
  late HomeRepo _homeRepo;

  void updateSwapToy(SwapToy? swapToy) {
    final newState = state.copy(swapToy: swapToy);
    state = newState;
  }

  void updateIsSwapToyLoading() {
    final newState = state.copy(isSwapToyLoading: !state.isSwapToyLoading);
    state = newState;
  }

  void updateSearch(value) {
    final newState = state.copy(search: value);
    state = newState;
  }

  Future<List<SwapToy>> getSwapToyListFromFirestore() async {
    final swapToys = await _homeRepo.getSwapToyListFromFirestore();
    return swapToys;
  }

  getSwapToyByUid(String uid) {
    _homeRepo.getSwapToyByUid(uid).then((value) {
      updateSwapToy(value);
      updateIsSwapToyLoading();
    });
  }
}

final homeSettingNotifier =
    StateNotifierProvider<HomeSettingNotifier, HomeSetting>(
        (ref) => HomeSettingNotifier(ref));

final swapToysProvider = FutureProvider((ref) =>
    ref.watch(homeRepoRepoProvider).getSwapToyListLimitFromFirestore());

final latestSwapToysProvider = FutureProvider((ref) =>
    ref.watch(homeRepoRepoProvider).getLatestSwapToyListLimitFromFirestore());

final allSwapToysProvider = FutureProvider(
    (ref) => ref.watch(homeRepoRepoProvider).getSwapToyListFromFirestore());

final swapToyProvider = FutureProvider.family<SwapToy?, String>(
    (ref, uid) => ref.watch(homeRepoRepoProvider).getSwapToyByUid(uid));

final searchProvider =
    StreamProvider.family<QuerySnapshot<Map<String, dynamic>>, String>(
        (ref, search) {
  log(search);
  if (search == '') {
    return FirebaseFirestore.instance.collection('swapToy').snapshots();
  } else {
    return FirebaseFirestore.instance
        .collection('swapToy')
        .where('name', isEqualTo: search)
        .snapshots();
  }
});

// final swapToysStreamProvider = StreamProvider(
//     (ref) => FirebaseFirestore.instance.collection('swapToy').snapshots());
