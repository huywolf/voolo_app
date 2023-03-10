import 'package:logger/logger.dart';
import 'package:voolo_app/dio/eap/dio_client.dart';

import '../api/voolo_account_api.dart';
import '../model/get_user_info_response.dart';
import '../model/send_otp_update_account_response.dart';
import '../model/update_user_info_response.dart';

class VooloAccountRepository {
  final api = VooloAccountApi(DioClient.instance.dio);

  Future<GetUserInfoResponse> getUserInfo({required String userId}) async {
    try {
      final res = await api.getInfoUser(userId);
      return res;
    } catch (err) {
      Logger().e('VooloAccountRepository -> VooloAccount()', err);
      return GetUserInfoResponse(statusCode: 0);
    }
  }

  Future<UpdateUserInfoResponse> updateUserInfo({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await api.updateUserInfo(userId, data);
      return res;
    } catch (err) {
      Logger().e('VooloAccountRepository -> VooloAccount()', err);
      return UpdateUserInfoResponse(statusCode: 0);
    }
  }

  Future<SendOtpUpdateAccountResponse> sendOtpUpdateAccount({
    required String email,
    required String newEmail,
  }) async {
    try {
      final res = await api.sendOtpUpdateAccount({
        "email": email,
        "new_email": newEmail,
      });
      if (res.status == true) {
        return SendOtpUpdateAccountResponse(status: true);
      }
      final resCode = res.statusCode ?? res.errorCode;
      return SendOtpUpdateAccountResponse(status: false, message: res.message, statusCode: resCode);
    } catch (err) {
      Logger().e('AuthRepository', err);
      return SendOtpUpdateAccountResponse(status: false);
    }
  }
}
