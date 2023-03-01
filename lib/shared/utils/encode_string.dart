class EncodeString {
  static String encodeEmail(String email) {
    String result = '';
    if (email.length < 6) return result;
    result += email.substring(0, 3);
    result += "***@***";
    result += email.substring(email.length - 3, email.length);
    return result;
  }
}
