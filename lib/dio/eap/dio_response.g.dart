// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DioResponse _$DioResponseFromJson(Map<String, dynamic> json) => DioResponse(
      status: json['status'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DioResponseToJson(DioResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
