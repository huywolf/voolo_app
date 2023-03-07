import 'package:logger/logger.dart';
import 'package:voolo_app/dio/eap/dio_client.dart';

import '../api/create_password_api.dart';
import '../model/register_request.dart';
import '../model/register_response.dart';

class CreatePasswordRepository {
  final api = CreatePasswordApi(DioClient.instance.dio);

  Future<RegisterResponse> register({required RegisterRequest data}) async {
    try {
      final res = await api.register(data);
      return res;
    } catch (err) {
      Logger().e('CreatePasswordRepository -> CreatePassword()', err);
      return RegisterResponse(statusCode: 0);
    }
  }
}
