import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:toy_exchange_application_toydee/modules/home/repos/home_repo.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../swap/models/swap_toy.dart';
import '../../swap/models/toy_type.dart';

class HomeFilterSetting {
  final GroupButtonController groupButtonControllerCategories;
  final GroupButtonController groupButtonControllerCondition;
  final GroupButtonController groupButtonControllerGenderType;
  final GroupButtonController groupButtonControllerAgeGroup;

  HomeFilterSetting({
    required this.groupButtonControllerCategories,
    required this.groupButtonControllerCondition,
    required this.groupButtonControllerGenderType,
    required this.groupButtonControllerAgeGroup,
  });

  HomeFilterSetting copy({
    GroupButtonController? groupButtonControllerCategories,
    GroupButtonController? groupButtonControllerCondition,
    GroupButtonController? groupButtonControllerGenderType,
    GroupButtonController? groupButtonControllerAgeGroup,
  }) =>
      HomeFilterSetting(
        groupButtonControllerCategories: groupButtonControllerCategories ??
            this.groupButtonControllerCategories,
        groupButtonControllerCondition: groupButtonControllerCondition ??
            this.groupButtonControllerCondition,
        groupButtonControllerGenderType: groupButtonControllerGenderType ??
            this.groupButtonControllerGenderType,
        groupButtonControllerAgeGroup:
            groupButtonControllerAgeGroup ?? this.groupButtonControllerAgeGroup,
      );
}

class HomeFilterSettingNotifier extends StateNotifier<HomeFilterSetting> {
  HomeFilterSettingNotifier(this.ref)
      : super(
          HomeFilterSetting(
            groupButtonControllerAgeGroup: GroupButtonController(),
            groupButtonControllerCategories: GroupButtonController(),
            groupButtonControllerCondition: GroupButtonController(),
            groupButtonControllerGenderType: GroupButtonController(),
          ),
        );

  final Ref ref;

  void clearFilter() {
    state.groupButtonControllerAgeGroup.unselectAll();
    state.groupButtonControllerCategories.unselectAll();
    state.groupButtonControllerCondition.unselectAll();
    state.groupButtonControllerGenderType.unselectAll();
  }

  void applyFilter(BuildContext context) {
    navigationApplyFilter(context);
  }

  navigationBack(BuildContext context) {
    clearFilter();
    NavigationService.goBack();
  }

  navigationApplyFilter(BuildContext context) {
    NavigationService.goBack();
  }
}

final homeFilterNotifierProvider =
    StateNotifierProvider<HomeFilterSettingNotifier, HomeFilterSetting>(
        ((ref) => HomeFilterSettingNotifier(ref)));

final homeFilterProvider = FutureProvider.family<List<SwapToy>, ToyType>(
    (ref, toyType) => ref
        .watch(homeRepoRepoProvider)
        .getSwapToyListByFilterFromFirestore(toyType));
