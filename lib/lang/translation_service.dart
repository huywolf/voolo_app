import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'vi_VN.dart';

class TranslationService extends Translations {
  // static Locale? get locale => Get.deviceLocale;
  static Locale? get locale => const Locale('vi', 'VN');
  static const fallbackLocale = Locale('vi', 'VN');
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': vi_VN,
        'en_US': en_US,
      };
}
