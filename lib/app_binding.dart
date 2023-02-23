import 'package:voolo_app/api/api.dart';
import 'package:get/get.dart';

import 'api/bnpl/bnpl_api_provider.dart';
import 'api/bnpl/bnpl_api_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
    Get.put(BnplApiProvider(), permanent: true);
    Get.put(BnplApiRepository(apiProvider: Get.find()), permanent: true);
  }
}
