import 'package:json_annotation/json_annotation.dart';

part 'check_phone_exist_response.g.dart';

@JsonSerializable()
class CheckPhoneExistResponse {
  // Shared
  @JsonKey(name: 'step')
  final int? step;
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'statusCode')
  final int? statusCode;

  const CheckPhoneExistResponse({
    this.step,
    this.status,
    this.statusCode,
  });

  factory CheckPhoneExistResponse.fromJson(Map<String, dynamic> json) => _$CheckPhoneExistResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CheckPhoneExistResponseToJson(this);
}

@JsonSerializable()
class CheckPhoneExistData {
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'step')
  final int? step;

  const CheckPhoneExistData({
    this.phone,
    this.step,
  });

  factory CheckPhoneExistData.fromJson(Map<String, dynamic> json) => _$CheckPhoneExistDataFromJson(json);
  Map<String, dynamic> toJson() => _$CheckPhoneExistDataToJson(this);
}
