import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../../shared/shared.dart';
import '../data_source/repository/verify_bnpl_repository.dart';

class VerifyBnplController extends GetxController {
  VerifyBnplController();

  final VerifyBnplRepository repo = VerifyBnplRepository();

  late String phoneNumber;
  RxInt step = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    initData();
    checkPhoneExist();
  }

  void initData() {
    var prefs = Get.find<SharedPreferences>();
    phoneNumber = prefs.get(StorageConstants.phoneNumber).toString();
    phoneNumber = "0955555551";
  }

  Future<void> checkPhoneExist() async {
    EasyLoading.show(status: 'loading'.tr);
    final res = await repo.checkPhoneExist(phoneNumber: phoneNumber);
    EasyLoading.dismiss();
    if (res != null && res.step != null) {
      step.value = res.step!;
    }
  }
}