import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voolo_app/routes/app_pages.dart';
import 'package:voolo_app/shared/shared.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 1000));
    var storage = Get.find<SharedPreferences>();

    print(storage.getString(StorageConstants.ACCESS_TOKEN));

    try {
      if (storage.getString(StorageConstants.ACCESS_TOKEN) != null) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.offAndToNamed(Routes.SELECT_LANGUAGE);
      }
    } catch (e) {
      Get.offAndToNamed(Routes.AUTH);
    }
  }
}
