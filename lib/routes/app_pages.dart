import 'package:voolo_app/modules/auth/auth.dart';
import 'package:voolo_app/modules/home/home.dart';
import 'package:voolo_app/modules/profile/cards/cards_screen.dart';
import 'package:voolo_app/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
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
      children: [
        GetPage(name: Routes.CARDS, page: () => CardsScreen()),
      ],
    ),
  ];
}
