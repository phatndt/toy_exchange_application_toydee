import 'package:flutter/material.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_transitions.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/screens/onboarding/onboarding1.dart';

import '../../modules/home/screens/home_screen.dart';
import '../../modules/main_screen.dart';
import '../../modules/profile/screens/profile_screen.dart';
import '../screens/onboarding/onboarding2.dart';
import '../screens/onboarding/onboarding3.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Core
      case RoutePaths.coreSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      // case RoutePaths.coreNoInternet:
      //   final args = settings.arguments as Map?;
      //   return MaterialPageRoute(
      //     builder: (_) => NoInternetConnection(
      //       offAll: args?['offAll'],
      //     ),
      //     settings: settings,
      //   );

      // //Auth
      // case RoutePaths.authLogin:
      //   return NavigationFadeTransition(
      //     const LoginScreen(),
      //     settings: settings,
      //     transitionDuration: const Duration(seconds: 1),
      //   );

      // //Settings
      // case RoutePaths.settings:
      //   return MaterialPageRoute(
      //     builder: (_) => const SettingsScreen(),
      //     settings: settings,
      //   );

      // case RoutePaths.settingsLanguage:
      //   return MaterialPageRoute(
      //     builder: (_) => const LanguageScreen(),
      //     settings: settings,
      //   );

      //Home
      case RoutePaths.mainScreen:
        return NavigationFadeTransition(
          const MainScreen(),
          settings: settings,
        );

      //Home
      case RoutePaths.home:
        return NavigationFadeTransition(
          const HomeScreen(),
          settings: settings,
        );

      //Profile
      case RoutePaths.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      //OnBoarding 1
      case RoutePaths.onboarding1:
        return MaterialPageRoute(
          builder: (_) => const OnBoarding1(),
          settings: settings,
        );
      //OnBoarding 2
      case RoutePaths.onboarding2:
        return MaterialPageRoute(
          builder: (_) => const OnBoarding2(),
          settings: settings,
        );
      //OnBoarding 3
      case RoutePaths.onboarding3:
        return MaterialPageRoute(
          builder: (_) => const OnBoarding3(),
          settings: settings,
        );

      //Map
      // case RoutePaths.map:
      //   return MaterialPageRoute(
      //     builder: (_) => const MapScreen(),
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
