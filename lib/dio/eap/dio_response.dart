// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'dio_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DioResponse {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'statusCode')
  final int? statusCode;
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
