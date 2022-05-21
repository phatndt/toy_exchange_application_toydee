import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/repos/user_repo.dart';

class ProfileSetting {
  final TextEditingController emailController;

  FocusNode emailFocusNode = FocusNode();

  ProfileSetting({
    required this.emailController,
  });

  ProfileSetting copy({
    TextEditingController? emailController,
  }) =>
      ProfileSetting(
        emailController: emailController ?? this.emailController,
      );

  void clearEmail() {
    emailController.clear();
  }
}

class ProfileNotifier extends StateNotifier<ProfileSetting> {
  ProfileNotifier(this.ref)
      : super(
          ProfileSetting(
            emailController: TextEditingController(),
          ),
        ) {
    _userRepo = ref.watch(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileSetting>(
        ((ref) => ProfileNotifier(ref)));
