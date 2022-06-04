import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSearchSetting {
  final TextEditingController searchController;

  HomeSearchSetting({
    required this.searchController,
  });

  HomeSearchSetting copy({
    TextEditingController? searchController,
  }) =>
      HomeSearchSetting(
        searchController: searchController ?? this.searchController,
      );
}

class HomeSearchSettingNotifier extends StateNotifier<HomeSearchSetting> {
  HomeSearchSettingNotifier(this.ref)
      : super(HomeSearchSetting(
          searchController: TextEditingController(),
        ));
  final Ref ref;

  void clearSearchController() {
    state.searchController.clear();
  }
}

final homeSearchSettingNotifier =
    StateNotifierProvider<HomeSearchSettingNotifier, HomeSearchSetting>(
        (ref) => HomeSearchSettingNotifier(ref));
