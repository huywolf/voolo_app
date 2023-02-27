import 'package:logger/logger.dart';
import 'package:voolo_app/dio/bnpl/bnpl_dio_client.dart';
import 'package:voolo_app/modules/verify_bnpl/data_source/api/verify_bnpl_api.dart';

import '../model/check_phone_exist_response.dart';

class VerifyBnplRepository {
  final api = VerifyBnplApi(BnplDioClient.instance.dio);

  Future<CheckPhoneExistResponse?> checkPhoneExist({required String phoneNumber}) async {
    try {
      final CheckPhoneExistResponse res = await api.checkPhoneExist({"phone": phoneNumber});
      return res;
    } catch (err) {
      Logger().e('VerifyBnplRepository -> VerifyBnpl()', err);
      return null;
    }
  }
}
