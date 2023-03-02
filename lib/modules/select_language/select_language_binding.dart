import 'package:get/get.dart';
import 'select_language_controller.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SelectLanguageController>(SelectLanguageController());
  }
}
