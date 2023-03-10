// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      countFail: json['countFail'] as int?,
      data: json['data'] == null
          ? null
          : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'countFail': instance.countFail,
      'data': instance.data,
      'token': instance.token,
    };

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) =>
    LoginResponseData(
      id: json['_id'] as String?,
      isBNPL: json['isBNPL'] as bool?,
      verifyEmail: json['verifyEmail'] as bool?,
      verifyPhone: json['verifyPhone'] as bool?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isBNPL': instance.isBNPL,
      'verifyEmail': instance.verifyEmail,
      'verifyPhone': instance.verifyPhone,
      'refreshToken': instance.refreshToken,
    };
