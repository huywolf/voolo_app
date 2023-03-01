import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:voolo_app/dio/eap/endpoints.dart';

import '../model/verify_otp_response.dart';

part 'verify_otp_api.g.dart';

@RestApi()
abstract class VerifyOtpApi {
  factory VerifyOtpApi(Dio dio, {String baseUrl}) = _VerifyOtpApi;

  @POST(Endpoints.verifyOtp)
  Future<VerifyOtpResponse> verifyOtp(@Body() Map<String, dynamic> data);
}
