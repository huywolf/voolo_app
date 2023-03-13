import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:voolo_app/dio/bnpl/bnpl_endpoints.dart';

import '../model/check_phone_exist_response.dart';

part 'bnpl_account_api.g.dart';

@RestApi()
abstract class BnplAccountApi {
  factory BnplAccountApi(Dio dio, {String baseUrl}) = _BnplAccountApi;

  @POST(BnplEndpoints.checkPhoneExist)
  Future<CheckPhoneExistResponse> checkPhoneExist(@Body() Map<String, dynamic> data);
}
