import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/signin.screen.dart';
import 'package:greengrocer/src/pages/auth/signin.up.screen.dart';
import 'package:greengrocer/src/pages/base/base.screen.dart';
import 'package:greengrocer/src/pages/splash/splash.screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => const SigninScreen(),
      name: PagesRoutes.signInRoute,
    ),
    GetPage(
      page: () => SigninUpScreen(),
      name: PagesRoutes.signUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseRoute,
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
