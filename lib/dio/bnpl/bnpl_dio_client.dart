import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voolo_app/app_config.dart';
import 'package:voolo_app/shared/shared.dart';

class BnplDioClient {
  static final instance = BnplDioClient._();

  late final Dio dio;

  BnplDioClient._() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.bnplBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          Map<String, dynamic> headers = {
            "Connection": "Keep-Alive",
            "Keep-Alive": "timeout=5, max=1000",
            "appKey": AppConfig.bnplAppKey,
            "appID": AppConfig.bnplAppId,
          };
          var accessToken = Get.find<SharedPreferences>().getString(StorageConstants.ACCESS_TOKEN);
          if (accessToken != null) {
            headers["Authorization"] = "Bearer $accessToken";
          }
          // UtilLogger.logInfo('Access Token: $ACCESS_TOKEN');
          options.headers.addAll(headers);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError error, handler) async {
          final response = Response(
            requestOptions: error.requestOptions,
            data: error.response?.data,
            statusCode: error.response?.statusCode,
            statusMessage: error.response?.statusMessage,
          );
          return handler.resolve(response);
        },
      ),
    );
  }
}
