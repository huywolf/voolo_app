import 'package:get/get.dart';

import 'controller/bnpl_account_controller.dart';

class BnplAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BnplAccountController());
  }
}
