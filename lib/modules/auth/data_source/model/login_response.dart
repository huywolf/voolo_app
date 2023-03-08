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
    this.data,
    this.token,
  });

  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  @JsonKey(name: 'countFail')
  final int? countFail;
  @JsonKey(name: 'data')
  final LoginResponseData? data;
  @JsonKey(name: 'token')
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResponseData {
  LoginResponseData({
    this.isBNPL,
    this.verifyEmail,
    this.verifyPhone,
    this.refreshToken,
  });

  @JsonKey(name: 'isBNPL')
  final bool? isBNPL;
  @JsonKey(name: 'verifyEmail')
  final bool? verifyEmail;
  @JsonKey(name: 'verifyPhone')
  final bool? verifyPhone;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) => _$LoginResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}
