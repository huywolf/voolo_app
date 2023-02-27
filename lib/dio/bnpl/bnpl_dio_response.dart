class BnplDioResponse {
  final bool? status;
  final int? statusCode;
  final String? message;
  final dynamic data;

  BnplDioResponse({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  @override
  String toString() {
    return toJson().toString();
  }

  factory BnplDioResponse.fromJson(Map<String, dynamic> json) {
    return BnplDioResponse(
      status: json.containsKey('status') ? json['status'] : false,
      statusCode: json.containsKey('statusCode') ? json['statusCode'] : null,
      message: json.containsKey('message') ? json['message'] : null,
      data: json.containsKey('data') ? json['data'] : null,
    );
  }

  dynamic toJson() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data,
      };
}
