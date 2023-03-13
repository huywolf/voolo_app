import 'package:logger/logger.dart';
import 'package:voolo_app/dio/bnpl/bnpl_dio_client.dart';

import '../api/bnpl_account_api.dart';
import '../model/check_phone_exist_response.dart';

class BnplAccountRepository {
  final api = BnplAccountApi(BnplDioClient.instance.dio);

  Future<CheckPhoneExistResponse?> checkPhoneExist({required String phoneNumber}) async {
    try {
      final CheckPhoneExistResponse res = await api.checkPhoneExist({"phone": phoneNumber});
      return res;
    } catch (err) {
      Logger().e('BnplAccountRepository -> BnplAccount()', err);
      return null;
    }
  }
}
