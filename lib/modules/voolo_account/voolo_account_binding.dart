import 'package:get/get.dart';
import 'controller/voolo_account_controller.dart';

class VooloAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VooloAccountController());
  }
}
