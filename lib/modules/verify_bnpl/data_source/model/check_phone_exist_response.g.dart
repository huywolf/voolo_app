// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_phone_exist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPhoneExistResponse _$CheckPhoneExistResponseFromJson(
        Map<String, dynamic> json) =>
    CheckPhoneExistResponse(
      step: json['step'] as int?,
    );

Map<String, dynamic> _$CheckPhoneExistResponseToJson(
        CheckPhoneExistResponse instance) =>
    <String, dynamic>{
      'step': instance.step,
    };

CheckPhoneExistData _$CheckPhoneExistDataFromJson(Map<String, dynamic> json) =>
    CheckPhoneExistData(
      phone: json['phone'] as String?,
      step: json['step'] as int?,
    );

Map<String, dynamic> _$CheckPhoneExistDataToJson(
        CheckPhoneExistData instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'step': instance.step,
    };
