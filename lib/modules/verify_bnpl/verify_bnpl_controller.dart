import 'package:shared_preferences/shared_preferences.dart';
import 'package:voolo_app/api/bnpl/bnpl_api_repository.dart';
import 'package:get/get.dart';

import '../../shared/shared.dart';

class VerifyBnplController extends GetxController {
  final BnplApiRepository bnplApiRepository;
  VerifyBnplController({required this.bnplApiRepository});

  late String phoneNumber;

  @override
  void onInit() async {
    super.onInit();
    initData();
  }

  void initData() {
    var prefs = Get.find<SharedPreferences>();
    phoneNumber = prefs.get(StorageConstants.phoneNumber).toString();
  }
}
