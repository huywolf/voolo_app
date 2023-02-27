import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:voolo_app/dio/bnpl/bnpl_endpoints.dart';

import '../model/check_phone_exist_response.dart';

part 'verify_bnpl_api.g.dart';

@RestApi()
abstract class VerifyBnplApi {
  factory VerifyBnplApi(Dio dio, {String baseUrl}) = _VerifyBnplApi;

  @POST(BnplEndpoints.checkPhoneExist)
  Future<CheckPhoneExistResponse> checkPhoneExist(@Body() Map<String, dynamic> data);
}
