import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:voolo_app/dio/eap/dio_response.dart';
import 'package:voolo_app/dio/eap/endpoints.dart';

import '../model/get_user_info_response.dart';
import '../model/update_user_info_response.dart';

part 'voolo_account_api.g.dart';

@RestApi()
abstract class VooloAccountApi {
  factory VooloAccountApi(Dio dio, {String baseUrl}) = _VooloAccountApi;

  @GET(Endpoints.getUserInfo)
  Future<GetUserInfoResponse> getInfoUser(@Path('id') String userId);

  @PUT(Endpoints.updateUserInfo)
  Future<UpdateUserInfoResponse> updateUserInfo(@Path('id') String userId, @Body() Map<String, dynamic> data);

  @POST(Endpoints.sendOtpUpdateAccount)
  Future<DioResponse> sendOtpUpdateAccount(@Body() Map<String, dynamic> data);
}
