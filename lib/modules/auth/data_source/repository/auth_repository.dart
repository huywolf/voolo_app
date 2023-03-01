import 'package:logger/logger.dart';
import 'package:voolo_app/dio/eap/dio_client.dart';

import '../api/auth_api.dart';
import '../model/send_otp_response.dart';

class AuthRepository {
  final api = AuthApi(DioClient.instance.dio);

  Future<SendOtpResponse?> sendOTP({
    required String fullName,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      final res = await api.sendOtp({
        "username": fullName,
        "phone": phoneNumber,
        "email": email,
      });
      if (res.status == true) {
        return SendOtpResponse(status: true);
      }
      return SendOtpResponse(status: false, message: res.message);
    } catch (err) {
      Logger().e('AuthRepository', err);
      return null;
    }
  }
}
