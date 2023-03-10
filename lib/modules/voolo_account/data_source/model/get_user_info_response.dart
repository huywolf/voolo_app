// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:voolo_app/dio/eap/dio_response.dart';

part 'get_user_info_response.g.dart';

@JsonSerializable()
class GetUserInfoResponse extends DioResponse {
  GetUserInfoResponse({
    bool? status,
    String? message,
    int? statusCode,
    this.data,
  }) : super(
          status: status,
          message: message,
          statusCode: statusCode,
        );

  final GetUserInfoResponseData? data;

  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) => _$GetUserInfoResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GetUserInfoResponseToJson(this);
}

@JsonSerializable()
class GetUserInfoResponseData extends DioResponse {
  GetUserInfoResponseData({
    this.username,
    this.email,
    this.phone,
  });

  final String? username;
  final String? email;
  final String? phone;

  factory GetUserInfoResponseData.fromJson(Map<String, dynamic> json) => _$GetUserInfoResponseDataFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GetUserInfoResponseDataToJson(this);
}
