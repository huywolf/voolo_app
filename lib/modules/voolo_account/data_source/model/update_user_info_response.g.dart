// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoResponse _$UpdateUserInfoResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$UpdateUserInfoResponseToJson(
        UpdateUserInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
