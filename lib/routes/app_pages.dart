import 'package:voolo_app/modules/auth/auth_binding.dart';
import 'package:voolo_app/modules/auth/view/auth_screen.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/modules/select_language/select_language_binding.dart';
import 'package:voolo_app/modules/select_language/select_language_screen.dart';
import 'package:voolo_app/modules/splash/splash_binding.dart';
import 'package:voolo_app/modules/splash/splash_screen.dart';
import 'package:voolo_app/modules/verify_bnpl/verify_bnpl_binding.dart';
import 'package:voolo_app/modules/verify_bnpl/view/verify_bnpl_screen.dart';
import 'package:voolo_app/modules/verify_otp/verify_otp_binding.dart';
import 'package:voolo_app/modules/verify_otp/view/verify_otp_screen.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SELECT_LANGUAGE,
      page: () => const SelectLanguageScreen(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_OTP,
      page: () => const VerifyOtpScreen(),
      binding: VerifyOtpBinding(),
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
