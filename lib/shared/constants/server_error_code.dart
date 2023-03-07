import 'package:get/get.dart';

class ServerErrorCode {
  String convertStatusCodeToString(int? statusCode) {
    switch (statusCode) {
      case 1002:
        return 'account_do_not_exist'.tr;
      case 1004:
        return 'invalid_otp'.tr;
      case 3000:
        return 'expired_otp'.tr;
      default:
        return '';
    }
  }
}
