// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  VerifyOtpResponse({
    required this.status,
    required this.message,
    required this.statusCode,
    required this.countFail,
  });

  final bool? status;
  final String? message;
  final int? statusCode;
  final int? countFail;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}
