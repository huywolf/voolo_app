import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:voolo_app/dio/eap/endpoints.dart';

import '../model/register_request.dart';
import '../model/register_response.dart';

part 'create_password_api.g.dart';

@RestApi()
abstract class CreatePasswordApi {
  factory CreatePasswordApi(Dio dio, {String baseUrl}) = _CreatePasswordApi;

  @POST(Endpoints.register)
  Future<RegisterResponse> register(@Body() RegisterRequest data);
}
