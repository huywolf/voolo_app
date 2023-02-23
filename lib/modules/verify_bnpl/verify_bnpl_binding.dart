import 'package:get/get.dart';
import 'verify_bnpl_controller.dart';

class VerifyBnplBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyBnplController(bnplApiRepository: Get.find()));
  }
}
