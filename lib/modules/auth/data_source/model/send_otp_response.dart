// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'send_otp_response.g.dart';

@JsonSerializable()
class SendOtpResponse {
  final bool status;
  final String? message;

  SendOtpResponse({
    this.status = false,
    this.message,
  });

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) => _$SendOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SendOtpResponseToJson(this);
}
