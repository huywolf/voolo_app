// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:voolo_app/dio/eap/dio_response.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends DioResponse {
  RegisterResponse({
    bool? status,
    String? message,
    int? statusCode,
  }) : super(message: message, status: status, statusCode: statusCode);

  // @JsonKey(name: 'status')
  // final bool? status;
  // @JsonKey(name: 'message')
  // final String? message;
  // @JsonKey(name: 'statusCode')
  // final int? statusCode;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
