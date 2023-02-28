import 'package:voolo_app/modules/auth/auth.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:get/get.dart';

import '../modules/splash/splash.dart';
import '../modules/verify_bnpl/verify_bnpl.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen(), transition: Transition.rightToLeft),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_BNPL,
      page: () => const VerifyBnplScreen(),
      binding: VerifyBnplBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
