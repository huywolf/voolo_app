import 'package:get/get.dart';

class ServerErrorCode {
  String convertStatusCodeToString(int? statusCode) {
    switch (statusCode) {
      case 1002:
        return 'account_do_not_exist'.tr;
      default:
        return '';
    }
  }
}
