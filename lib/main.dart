import 'dart:developer';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toy_exchange_application_toydee/core/screens/onboarding/onboarding_page.dart';
import 'package:toy_exchange_application_toydee/core/widgets/Toast.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/login_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'core/routing/app_router.dart';
import 'core/routing/navigation_service.dart';
import 'core/routing/route_paths.dart';
import 'core/styles/styles.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: S.colors.background_1, // status bar color
  ));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(DevicePreview(
      tools: const [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(),
      ],
      enabled: false,
      builder: (context) => const ProviderScope(child: Toydee())));
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: S.colors.background_1, // status bar color
//   ));
//   runApp(const ProviderScope(child: Toydee()));
// }

final test = StreamProvider((ref) => FirebaseAuth.instance.authStateChanges());

class Toydee extends ConsumerWidget {
  const Toydee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: () => MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: S.colors.primary,
          ),
        ),
        navigatorKey: NavigationService.navigationKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: initScreen == 0 || initScreen == null
            ? RoutePaths.onboardingpage
            : FirebaseAuth.instance.currentUser == null
                ? RoutePaths.login
                : RoutePaths.mainScreen,
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
