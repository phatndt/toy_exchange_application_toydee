import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toy_exchange_application_toydee/modules/home/repos/home_repo.dart';

import '../../swap/models/swap_toy.dart';

class HomeSetting {
  List<SwapToy> swapToys;
  HomeSetting({
    required this.swapToys,
  });
}

class HomeSettingNotifier extends StateNotifier<HomeSetting> {
  HomeSettingNotifier(this.ref)
      : super(HomeSetting(
          swapToys: [],
        )) {
    _homeRepo = ref.watch(
      homeRepoRepoProvider,
    );
    getSwapToyListFromFirestore();
  }

  final Ref ref;
  late HomeRepo _homeRepo;

  Future<List<SwapToy>> getSwapToyListFromFirestore() async {
    final swapToys = await _homeRepo.getSwapToyListFromFirestore();
    return swapToys;
  }
}

final homeSettingNotifier =
    StateNotifierProvider<HomeSettingNotifier, HomeSetting>(
        (ref) => HomeSettingNotifier(ref));

final swapToysProvider = FutureProvider(
    (ref) => ref.watch(homeRepoRepoProvider).getSwapToyListFromFirestore());
