class Endpoints {
  Endpoints._();

  static const sendOtp = '/auth/sendOtp';
  static const verifyOtp = '/auth/verifyOtp';
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const getUserInfo = '/user/{id}';
  static const updateUserInfo = '/user/{id}';
  static const sendOtpUpdateAccount = '/auth/sendOtpUpdateAccountAdmin';
}
