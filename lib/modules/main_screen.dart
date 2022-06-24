import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/viewmodels/main_view_model.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';

import '../core/navigation/bottom_navigation_bar.dart';
import '../core/styles/styles.dart';
import 'home/screens/home_screen.dart';
import 'profile/screens/profile_screen.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int currentIndex = 0;
//   final screens = const [
//     HomeScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ModalProgressHUD(
//         inAsyncCall: ,
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           extendBody: true,
//           body: screens[currentIndex],
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: S.colors.primary,
//             child: const Icon(FontAwesomeIcons.plus),
//             onPressed: () {
//               NavigationService.push(
//                   page: RoutePaths.swapWelcomeScreen, isNamed: true);
//             },
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: CustomBottomAppBar(
//             onItemPressed: (int m) {
//               setState(() {
//                 currentIndex = m;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//   // static const _iconTypes = <IconData>[
//   //   Icons.cake,
//   //   Icons.add_location_sharp,
//   // ];

//   // bottomNavigationBar: DiamondBottomNavigation(
//   //     itemIcons: _iconTypes,
//   //     centerIcon: Icons.add,
//   //     selectedIndex: currenIndex,
//   //     onItemPressed: (int m) {
//   //       print(m);
//   //       // setState(() {
//   //       //   currentScreen = screens[m - 1];
//   //       // });
//   //     }),
// }

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainSetting = ref.watch(mainProvider);
    const screens = [
      HomeScreen(),
      ProfileScreen(),
    ];

    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: ref.watch(mainSettingNotifierProvider).isLoadingMain,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: mainSetting.when(
            data: (data) {
              if (data) {
                return screens[
                    ref.watch(mainSettingNotifierProvider).currentIndex];
              } else {
                return Center(
                  child: CustomButton(text: "Log out", onPressed: () {}),
                );
              }
            },
            error: (error, stack) => Center(
              child: CustomButton(text: "Log out", onPressed: () {}),
            ),
            loading: () => Container(),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: S.colors.primary,
            child: const Icon(FontAwesomeIcons.plus),
            onPressed: () {
              NavigationService.push(
                  page: RoutePaths.swapWelcomeScreen, isNamed: true);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBar(
            onItemPressed: (int m) {
              log(m.toString());
              ref
                  .watch(mainSettingNotifierProvider.notifier)
                  .updateCurrentIndex(m);
            },
          ),
        ),
      ),
    );
  }
}
