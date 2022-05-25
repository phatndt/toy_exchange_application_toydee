import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/repos/user_repo.dart';

class ProfileSetting {
  final String imageURL;

  ProfileSetting({
    required this.imageURL,
  });

  ProfileSetting copy({
    String? imageUrl,
  }) =>
      ProfileSetting(
        imageURL: imageUrl ?? this.imageURL,
      );
}

class ProfileNotifier extends StateNotifier<ProfileSetting> {
  ProfileNotifier(this.ref)
      : super(
          ProfileSetting(
            imageURL: "",
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
