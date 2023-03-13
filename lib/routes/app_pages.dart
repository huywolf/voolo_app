import 'package:voolo_app/modules/auth/auth_binding.dart';
import 'package:voolo_app/modules/auth/view/auth_screen.dart';
import 'package:voolo_app/modules/bnpl_account/bnpl_account_binding.dart';
import 'package:voolo_app/modules/bnpl_account/view/bnpl_account_screen.dart';
import 'package:voolo_app/modules/create_password/create_password_binding.dart';
import 'package:voolo_app/modules/create_password/view/create_password_screen.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/modules/introduction/introduction_binding.dart';
import 'package:voolo_app/modules/introduction/introduction_screen.dart';
import 'package:voolo_app/modules/select_language/select_language_binding.dart';
import 'package:voolo_app/modules/select_language/select_language_screen.dart';
import 'package:voolo_app/modules/splash/splash_screen.dart';
import 'package:voolo_app/modules/verify_otp/verify_otp_binding.dart';
import 'package:voolo_app/modules/verify_otp/view/verify_otp_screen.dart';
import 'package:voolo_app/modules/voolo_account/view/voolo_account_screen.dart';
import 'package:voolo_app/modules/voolo_account/voolo_account_binding.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.SELECT_LANGUAGE,
      page: () => const SelectLanguageScreen(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: Routes.INTRODUCTION,
      page: () => const IntroductionScreen(),
      binding: IntroductionBinding(),
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
      name: Routes.CREATE_PASSWORD,
      page: () => const CreatePasswordScreen(),
      binding: CreatePasswordBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_BNPL,
      page: () => const BnplAccountScreen(),
      binding: BnplAccountBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.VOOLO_ACCOUNT,
      page: () => const VooloAccountScreen(),
      binding: VooloAccountBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
