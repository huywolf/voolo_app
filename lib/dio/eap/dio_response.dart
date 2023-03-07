// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'dio_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DioResponse {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  @JsonKey(name: 'errorCode')
  final int? errorCode;
  @JsonKey(name: 'message')
  final String? message;

  DioResponse({
    this.status,
    this.statusCode,
    this.errorCode,
    this.message,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  factory DioResponse.fromJson(Map<String, dynamic> json) => _$DioResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DioResponseToJson(this);
}
