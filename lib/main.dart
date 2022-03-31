import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_exchange_application_toydee/core/screens/onboarding/onboarding_page.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/login_screen.dart';

import 'core/routing/app_router.dart';
import 'core/routing/navigation_service.dart';
import 'core/routing/route_paths.dart';
import 'core/styles/styles.dart';

// int? initScreen;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   initScreen = preferences.getInt('initScreen');
//   await preferences.setInt('initScreen', 1);
//   runApp(const ProviderScope(child: Toydee()));
// }

void main() {
  runApp(const ProviderScope(child: Toydee()));
}

class Toydee extends StatelessWidget {
  const Toydee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: S.colors.primary,
        ),
      ),
      navigatorKey: NavigationService.navigationKey,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.onboardingpage,
      onGenerateRoute: AppRouter.generateRoute,
      // initialRoute: initScreen == 0 || initScreen == null
      //     ? RoutePaths.onboardingpage
      //     : RoutePaths.login,
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
