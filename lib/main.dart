import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_exchange_application_toydee/core/screens/onboarding/onboarding_page.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/login_screen.dart';
import 'package:device_preview/device_preview.dart';
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

void main() async {
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const ProviderScope(child: Toydee()),
  //   ),
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: Toydee()));
}

class Toydee extends StatelessWidget {
  const Toydee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: () => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: S.colors.primary,
          ),
        ),
        navigatorKey: NavigationService.navigationKey,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePaths.profile,
        onGenerateRoute: AppRouter.generateRoute,
        // initialRoute: initScreen == 0 || initScreen == null
        //     ? RoutePaths.onboardingpage
        //     : RoutePaths.login,
      ),
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
