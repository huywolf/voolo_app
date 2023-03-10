// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoResponse _$GetUserInfoResponseFromJson(Map<String, dynamic> json) =>
    GetUserInfoResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      data: json['data'] == null
          ? null
          : GetUserInfoResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserInfoResponseToJson(
        GetUserInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

GetUserInfoResponseData _$GetUserInfoResponseDataFromJson(
        Map<String, dynamic> json) =>
    GetUserInfoResponseData(
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$GetUserInfoResponseDataToJson(
        GetUserInfoResponseData instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
    };
