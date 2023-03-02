import 'package:voolo_app/dio/eap/dio_response.dart';

class SendOtpResponse {
  final bool status;
  final String? message;
  final StatusCode? statusCode;

  SendOtpResponse({
    this.status = false,
    this.message,
    this.statusCode,
  });
}
