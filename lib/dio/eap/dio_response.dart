// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'dio_response.g.dart';

enum StatusCode {
  @JsonValue(2010)
  PHONE_NUMBER_ALREADY_EXIST,
  @JsonValue(2011)
  EMAIL_ALREADY_EXIST,
}

@JsonSerializable(genericArgumentFactories: true)
class DioResponse {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'statusCode')
  final StatusCode? statusCode;
  @JsonKey(name: 'message')
  final String? message;

  DioResponse({
    this.status,
    this.statusCode,
    this.message,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  factory DioResponse.fromJson(Map<String, dynamic> json) => _$DioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DioResponseToJson(this);
}
