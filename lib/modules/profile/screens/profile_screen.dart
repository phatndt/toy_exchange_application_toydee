import 'dart:developer';
import 'dart:io';

import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';

import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

import '../components/profile_widget.dart';
import '../configuration_screen/viewmodels/configuration_view_models.dart';
import 'profile_tab_1.dart';
import 'viewmodels/profile_view_models.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   ref
    //       .watch(configurationNotifierProvider.notifier)
    //       .getFirstNameFromFireStore();
    //   ref
    //       .watch(configurationNotifierProvider.notifier)
    //       .getLastNameFromFireStore();
    //   ref
    //       .watch(configurationNotifierProvider.notifier)
    //       .getBirthDateFromFireStore();
    //   ref
    //       .watch(configurationNotifierProvider.notifier)
    //       .getAddressFromFireStore();
    //   ref
    //       .watch(configurationNotifierProvider.notifier)
    //       .getGenderFromFireStore();
    //   ref.watch(configurationNotifierProvider.notifier).getPhoneFromFireStore();
    //   ref.watch(profileNotifierProvider.notifier).getImageFromStorage();
    //   log('======================================');
    // }
    return SafeArea(
        child: Scaffold(
      backgroundColor: S.colors.background_2,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: S.dimens.defaultPadding_48,
              left: S.dimens.defaultPadding_16,
              right: S.dimens.defaultPadding_16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // CustomIconButton(
                //     backgroundColor: S.colors.accent_5,
                //     color: S.colors.primary,
                //     width: 50.0,
                //     text: Icons.arrow_back_rounded,
                //     onPressed: () {}),
                CustomIconButton(
                  text: FontAwesomeIcons.gear,
                  onPressed: () {
                    NavigationService.push(
                      isNamed: true,
                      page: RoutePaths.profileconfiguration,
                    );
                  },
                  backgroundColor: S.colors.accent_5,
                  color: S.colors.primary,
                ),
                // IconButton(
                //   onPressed: () {},
                //   iconSize: 40.0,
                //   icon: Icon(
                //     Icons.edit_note,
                //     color: S.colors.primary,
                //   ),
                // ),
              ],
            ),
          ),
          ProfileWidget(
            imagePath: ref.watch(profileNotifierProvider).imageURL,
            //ref.watch(profileNotifierProvider).imageURL,
            onPressed: () {
              ref
                  .watch(profileNotifierProvider.notifier)
                  .showImageSourceActionSheet(context);
            },
          ),
          SizedBox(
            height: S.dimens.defaultPadding_8,
          ),
          Column(
            children: [
              Text(
                ref.watch(configurationNotifierProvider).firstname,
                style: S.textStyles.h3,
              ),
              SizedBox(
                height: S.dimens.defaultPadding_4,
              ),
              Text(
                ref
                    .watch(profileNotifierProvider.notifier)
                    .setUserEmailFromFireStore(),
                style: S.textStyles.titleLight,
              )
            ],
          ),
          SizedBox(
            height: S.dimens.defaultPadding_8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: S.dimens.defaultPadding_16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  text: FontAwesomeIcons.calendar,
                  onPressed: () {
                    NavigationService.push(
                        isNamed: true, page: RoutePaths.listEvents);
                  },
                  color: S.colors.primary,
                  backgroundColor: S.colors.accent_5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(S.dimens.defaultPadding_8)),
                    color: S.colors.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ReviewWidget(
                        name: T.profileSwap,
                        point: '18',
                      ),
                      ReviewWidget(
                        name: T.profileDonated,
                        point: '22',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                CustomBadgeIconButton(
                  text: FontAwesomeIcons.solidBell,
                  onPressed: () {
                    NavigationService.push(
                      page: RoutePaths.requestScreen,
                      isNamed: true,
                    );
                  },
                  color: S.colors.primary,
                  backgroundColor: S.colors.accent_5,
                  counter: 11,
                ),
              ],
            ),
          ),
          SizedBox(
            height: S.dimens.defaultPaddingVertical_16,
          ),
          const Expanded(
            child: ProfileTab1(),
          ),
        ],
      ),
    ));
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  final String name;
  final String point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.defaultPadding_8,
          vertical: S.dimens.defaultPadding_4),
      child: Column(
        children: [
          Text(
            name,
            style: S.textStyles.titleLight,
          ),
          RichText(
              text: TextSpan(
            style: S.textStyles.titleHeavy,
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.star,
                  color: S.colors.textColor_1,
                ),
              ),
              TextSpan(text: point, style: S.textStyles.titleLight),
            ],
          ))
        ],
      ),
    );
  }
}

class CustomBadgeIconButton extends StatelessWidget {
  const CustomBadgeIconButton({
    Key? key,
    this.width,
    required this.text,
    required this.onPressed,
    this.color,
    required this.backgroundColor,
    this.elevation = 1,
    required this.counter,
  }) : super(key: key);

  final double? width;
  final IconData text;
  final VoidCallback onPressed;
  final Color? color;
  final Color backgroundColor;
  final double elevation;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //default size is 50 in pixel 4a, it will be change
      height: (3850 / 69).h,
      width: width ?? (1265 / 24).w,
      child: Center(
        child: Badge(
          badgeContent: Text(
            counter.toString(),
            style: TextStyle(color: S.colors.textColor_1),
          ),
          badgeColor: S.colors.primary,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(S.dimens.defaultBorderRadius),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
              elevation: MaterialStateProperty.all<double>(elevation),
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
            ),
            child: Center(
              child: Icon(
                text,
                color: color,
                size: (1.h / 1.w) * 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
