// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DioResponse _$DioResponseFromJson(Map<String, dynamic> json) => DioResponse(
      status: json['status'] as bool?,
      statusCode: $enumDecodeNullable(_$StatusCodeEnumMap, json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DioResponseToJson(DioResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': _$StatusCodeEnumMap[instance.statusCode],
      'message': instance.message,
    };

const _$StatusCodeEnumMap = {
  StatusCode.PHONE_NUMBER_ALREADY_EXIST: 2010,
  StatusCode.EMAIL_ALREADY_EXIST: 2011,
};
