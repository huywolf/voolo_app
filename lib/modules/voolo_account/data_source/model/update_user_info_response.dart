// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:voolo_app/dio/eap/dio_response.dart';

part 'update_user_info_response.g.dart';

@JsonSerializable()
class UpdateUserInfoResponse extends DioResponse {
  UpdateUserInfoResponse({
    bool? status,
    String? message,
    int? statusCode,
  }) : super(
          status: status,
          message: message,
          statusCode: statusCode,
        );

  factory UpdateUserInfoResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserInfoResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UpdateUserInfoResponseToJson(this);
}
