import 'package:voolo_app/models/models.dart';
import 'package:get/get.dart';

import 'bnpl_base_provider.dart';

class BnplApiProvider extends BnplBaseProvider {
  Future<Response> checkPhoneExist(String path, LoginRequest data) {
    return post(path, data.toJson());
  }
}
