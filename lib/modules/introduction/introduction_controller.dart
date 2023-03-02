import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class IntroductionController extends GetxController {
  final PageController pageViewController = PageController();
  RxInt currentPage = 1.obs;

  void onPageChange(int page) async {
    if (page == 2) {
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.show(status: "loading".tr);
      await Future.delayed(const Duration(milliseconds: 1000));
      EasyLoading.dismiss();
      Get.offAndToNamed(Routes.AUTH);
    }
  }
}
