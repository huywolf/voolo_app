import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voolo_app/routes/app_pages.dart';

enum LanguageType { none, vietnamese, english }

class SelectLanguageController extends GetxController {
  var curLanguageType = LanguageType.none.obs;

  void chooseLanguage(LanguageType type) {
    curLanguageType.value = type;
    if (type == LanguageType.vietnamese) {
      Get.updateLocale(const Locale('vi', 'VN'));
    } else if (type == LanguageType.english) {
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  void onPressNextButton() {
    Get.offAndToNamed(Routes.INTRODUCTION);
  }
}
