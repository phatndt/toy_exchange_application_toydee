import 'package:flutter/material.dart';

import '../core/navigation/bottom_navigation_bar.dart';
import 'home/screens/home_screen.dart';
import 'profile/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[currentIndex],
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar(
          onItemPressed: (int m) {
            setState(() {
              currentIndex = m;
            });
          },
        ),
      ),
    );
  }

  // static const _iconTypes = <IconData>[
  //   Icons.cake,
  //   Icons.add_location_sharp,
  // ];

  // bottomNavigationBar: DiamondBottomNavigation(
  //     itemIcons: _iconTypes,
  //     centerIcon: Icons.add,
  //     selectedIndex: currenIndex,
  //     onItemPressed: (int m) {
  //       print(m);
  //       // setState(() {
  //       //   currentScreen = screens[m - 1];
  //       // });
  //     }),
}
