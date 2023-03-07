// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.statusCode,
    this.countFail,
  });

  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  @JsonKey(name: 'countFail')
  final int? countFail;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
