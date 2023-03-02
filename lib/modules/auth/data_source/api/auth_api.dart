import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:voolo_app/dio/eap/dio_response.dart';
import 'package:voolo_app/dio/eap/endpoints.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST(Endpoints.sendOtp)
  Future<DioResponse> sendOtp(@Body() Map<String, dynamic> data);
}
