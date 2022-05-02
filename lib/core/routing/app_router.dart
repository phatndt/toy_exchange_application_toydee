import 'package:flutter/material.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_transitions.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/screens/onboarding/onboarding1.dart';
import 'package:toy_exchange_application_toydee/core/screens/onboarding/onboarding_page.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/login_screen.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/reset_password_screen.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/sign_up_screen.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/screens/welcome_screen.dart';
import 'package:toy_exchange_application_toydee/modules/home/screens/home_all_toy_screen.dart';
import 'package:toy_exchange_application_toydee/modules/home/screens/home_search_screen.dart';
import 'package:toy_exchange_application_toydee/modules/home/screens/home_toy_detail_screen.dart';
import 'package:toy_exchange_application_toydee/modules/swap/screens/swap_screen_main.dart';
import 'package:toy_exchange_application_toydee/modules/swap/screens/swap_screen_done.dart';
import 'package:toy_exchange_application_toydee/modules/swap/screens/swap_screen_upload.dart';
import 'package:toy_exchange_application_toydee/modules/swap/screens/swap_welcome_screen.dart';

import '../../modules/authentication/screens/reset_password_done_screen.dart';
import '../../modules/home/screens/home_filter_screen.dart';
import '../../modules/home/screens/home_screen.dart';
import '../../modules/main_screen.dart';
import '../../modules/profile/configuration_screen/profile_configuration_changing_gender.dart';
import '../../modules/profile/configuration_screen/profile_configuration_changing_text.dart';
import '../../modules/profile/screens/profile_screen.dart';
import '../../modules/profile/configuration_screen/profile_configuration_screen.dart';
import '../../modules/swap/screens/swap_screen_filter.dart';
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
      case RoutePaths.onboardingpage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );
      case RoutePaths.homefilter:
        return MaterialPageRoute(
          builder: (_) => const HomeFilterScreen(),
          settings: settings,
        );
      case RoutePaths.swapscreenfilter:
        return MaterialPageRoute(
          builder: (_) => const SwapFilterScreen(),
          settings: settings,
        );
      case RoutePaths.profileconfiguration:
        return MaterialPageRoute(
          builder: (_) => const ProfileConfigurationScreen(),
          settings: settings,
        );
      case RoutePaths.profileconfigurationchangingtext:
        return MaterialPageRoute(
          builder: (_) => const ProfileConfigurationTextChanging(
            label: '',
            information: '',
          ),
          settings: settings,
        );
      case RoutePaths.profileconfigurationchangingdate:
        return MaterialPageRoute(
          builder: (_) => const ProfileConfigurationGenderChanging(
            label: '',
            information: '',
          ),
          settings: settings,
        );

      case RoutePaths.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case RoutePaths.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
          settings: settings,
        );

      case RoutePaths.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case RoutePaths.swapWelcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const SwapWelcomeScreen(),
          settings: settings,
        );
      case RoutePaths.swapScreenMain:
        return MaterialPageRoute(
          builder: (_) => const SwapScreenOne(),
          settings: settings,
        );
      case RoutePaths.swapScreenUpload:
        return MaterialPageRoute(
          builder: (_) => const SwapScreenTwo(),
          settings: settings,
        );
      case RoutePaths.swapScreenDone:
        return MaterialPageRoute(
          builder: (_) => const SwappScreenThree(),
          settings: settings,
        );
      case RoutePaths.seeAllToy:
        return MaterialPageRoute(
          builder: (_) => const HomeAllToyScreen(),
          settings: settings,
        );
      case RoutePaths.toyDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeToyDetailScreen(),
          settings: settings,
        );
      case RoutePaths.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeSearchScreen(),
          settings: settings,
        );
      case RoutePaths.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
          settings: settings,
        );
      case RoutePaths.resetPasswordDone:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordDoneScreen(),
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
