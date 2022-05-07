import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';

class HomeFilterSetting {
  final GroupButtonController groupButtonController1;
  final GroupButtonController groupButtonController2;
  final GroupButtonController groupButtonController3;
  final GroupButtonController groupButtonController4;

  HomeFilterSetting({
    required this.groupButtonController1,
    required this.groupButtonController2,
    required this.groupButtonController3,
    required this.groupButtonController4,
  });

  HomeFilterSetting copy({
    GroupButtonController? groupButtonController1,
    GroupButtonController? groupButtonController2,
    GroupButtonController? groupButtonController3,
    GroupButtonController? groupButtonController4,
  }) =>
      HomeFilterSetting(
        groupButtonController1:
            groupButtonController1 ?? this.groupButtonController1,
        groupButtonController2:
            groupButtonController2 ?? this.groupButtonController2,
        groupButtonController3:
            groupButtonController3 ?? this.groupButtonController3,
        groupButtonController4:
            groupButtonController4 ?? this.groupButtonController4,
      );
}

class HomeFilterNotifier extends StateNotifier<HomeFilterSetting> {
  HomeFilterNotifier(this.ref)
      : super(
          HomeFilterSetting(
            groupButtonController1: GroupButtonController(),
            groupButtonController2: GroupButtonController(),
            groupButtonController3: GroupButtonController(),
            groupButtonController4: GroupButtonController(),
          ),
        ) {}

  final Ref ref;

  // void updateGroupButton1() {
  // final newFilter = state.copy(groupButtonController1: );
  // }

  void clearFilter() {
    state.groupButtonController1.unselectAll();
    state.groupButtonController2.unselectAll();
    state.groupButtonController3.unselectAll();
    state.groupButtonController4.unselectAll();
  }

  void applyFilter(BuildContext context) {
    var list = state.groupButtonController1.selectedIndexes;
    print(list);
    navigationApplyFilter(context);
  }
  // sendEmailHomeFilter(
  //   BuildContext context, {
  //   required String email,
  // }) async {
  //   final _result = await _authRepo.sendPasswordResetEmail(
  //     email: email,
  //   );

  //   if (_result != null) {
  //     if (_result) {
  //       navigationToDone(context);
  //       clearEmail();
  //     }
  //   }
  // }

  navigationBack(BuildContext context) {
    clearFilter();
    NavigationService.push(
      page: RoutePaths.home,
      isNamed: true,
    );
  }

  navigationApplyFilter(BuildContext context) {
    NavigationService.goBack();
  }
}

final homeFilterNotifierProvider =
    StateNotifierProvider<HomeFilterNotifier, HomeFilterSetting>(
        ((ref) => HomeFilterNotifier(ref)));
