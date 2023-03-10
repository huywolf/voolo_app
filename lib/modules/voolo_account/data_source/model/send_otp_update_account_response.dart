class SendOtpUpdateAccountResponse {
  final bool status;
  final String? message;
  final int? statusCode;

  SendOtpUpdateAccountResponse({
    this.status = false,
    this.message,
    this.statusCode,
  });
}
