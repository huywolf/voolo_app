// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:get/get.dart';

class ServerErrorCode {
  String convertStatusCodeToMessage(int? statusCode) {
    switch (statusCode) {
      case 1002:
        return 'account_do_not_exist'.tr;
      case 1004:
        return 'invalid_otp'.tr;
      case 2010:
        return 'that_phone_number_is_taken'.tr;
      case 2011:
        return 'that_email_is_taken'.tr;
      case 3000:
        return 'expired_otp'.tr;
      case 8000:
        return 'invalid_email'.tr;
      default:
        return '';
    }
  }
}
