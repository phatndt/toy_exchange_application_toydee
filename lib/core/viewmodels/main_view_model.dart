import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/Toast.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/repos/user_repo.dart';

import '../../modules/home/screens/home_screen.dart';
import '../../modules/profile/screens/profile_screen.dart';

class MainSetting {
  bool isLoadingMain = true;
  int currentIndex = 0;

  MainSetting({
    this.isLoadingMain = true,
    this.currentIndex = 0,
  });

  MainSetting copy({
    bool? isLoadingMain,
    int? currentIndex,
  }) =>
      MainSetting(
        isLoadingMain: isLoadingMain ?? this.isLoadingMain,
        currentIndex: currentIndex ?? this.currentIndex,
      );
}

class MainSettingNotifier extends StateNotifier<MainSetting> {
  MainSettingNotifier(this.ref)
      : super(
          MainSetting(
            isLoadingMain: true,
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;

  void updateLoadingMain() {
    final newState = state.copy(isLoadingMain: !state.isLoadingMain);
    state = newState;
  }

  void updateCurrentIndex(int index) {
    final newState = state.copy(currentIndex: index);
    state = newState;
  }

  void getUserProfileToFireStore(BuildContext context) {
    if (_userRepo.userModel == null) {
      _userRepo.getUserProfileToFireStore().then((value) {
        if (value) {
          updateLoadingMain();
        } else {
          CustomToast.fToast.init(context);
          CustomToast.fToast.showToast(
              gravity: ToastGravity.TOP,
              child: const CustomToastBuilder(
                  msg: "Error with authentication!",
                  icon: FontAwesomeIcons.exclamation));
          NavigationService.pushReplacementAll(
            page: RoutePaths.login,
            isNamed: true,
          );
          updateLoadingMain();
        }
      });
    } else {
      updateLoadingMain();
    }
  }
}

final mainSettingNotifierProvider =
    StateNotifierProvider<MainSettingNotifier, MainSetting>(
        ((ref) => MainSettingNotifier(ref)));

final mainProvider = FutureProvider<bool>((ref) async {
  if (ref.watch(userRepoProvider).userModel == null) {
    final _result =
        await ref.watch(userRepoProvider).getUserProfileToFireStore();
    ref.watch(mainSettingNotifierProvider.notifier).updateLoadingMain();
    return _result;
  } else {
    ref.watch(mainSettingNotifierProvider.notifier).updateLoadingMain();
    return true;
  }
});
