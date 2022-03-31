import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routing/app_router.dart';
import 'core/routing/navigation_service.dart';
import 'core/routing/route_paths.dart';

void main() {
  runApp(const ProviderScope(child: Toydee()));
}

class Toydee extends StatelessWidget {
  const Toydee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigationKey,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.onboardingpage,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }

  // String getInitalRoute() {
  //   // if (seenOnboard == true) {
  //   //   if (uid == 'null') {
  //   //     return Routes.login;
  //   //   } else {
  //   //     return Routes.main;
  //   //   }
  //   // }
  //   // return Routes.onboarding;
  // }
}
