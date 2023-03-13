import 'package:logger/logger.dart';
import 'package:voolo_app/dio/eap/dio_client.dart';

import '../api/verify_otp_api.dart';
import '../model/verify_otp_response.dart';

class VerifyOtpRepository {
  final api = VerifyOtpApi(DioClient.instance.dio);

  Future<VerifyOtpResponse> verifyOtp({
    required String fullname,
    required String email,
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final res = await api.verifyOtp({
        "username": fullname,
        "email": email,
        "phone": phoneNumber,
        "otp": otp,
      });
      return res;
    } catch (err) {
      Logger().e('VerifyOtpRepository -> VerifyOtp()', err);
      return VerifyOtpResponse(statusCode: 0);
    }
  }

  Future<VerifyOtpResponse> verifyOtpUpdateAccount({
    required String email,
    required String newEmail,
    required String otp,
  }) async {
    try {
      final res = await api.verifyOtpUpdateAccount({
        "email": email,
        "new_email": newEmail,
        "otp": otp,
      });
      return res;
    } catch (err) {
      Logger().e('VerifyOtpRepository -> VerifyOtp()', err);
      return VerifyOtpResponse(statusCode: 0);
    }
  }
}
