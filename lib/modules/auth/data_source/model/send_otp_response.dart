class SendOtpResponse {
  final bool status;
  final String? message;
  final int? statusCode;

  SendOtpResponse({
    this.status = false,
    this.message,
    this.statusCode,
  });
}
