import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class ValidateUtil {
  String? validateFullName(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    final specialCharacters = [
      '`',
      '~',
      '!',
      '@',
      '#',
      '\$',
      '%',
      '^',
      '&',
      '*',
      '(',
      ')',
      '-',
      '_',
      '+',
      '=',
      '[',
      ']',
      '{',
      '}',
      '|',
      '\\',
      ';',
      ':',
      "'",
      '"',
      ",",
      '.',
      '<',
      '>',
      '/',
      '?'
    ];
    for (var specialCharacter in specialCharacters) {
      if (value.contains(specialCharacter)) {
        return 'name_not_include_special_character'.tr;
      }
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'name_not_include_number'.tr;
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    final RegExp phoneRegex = RegExp(r'(^0(3|5|7|8|9)[0-9]*$)');
    if (!phoneRegex.hasMatch(value)) {
      return 'invalid_phone_number_format'.tr;
    }
    if (value.length != 10) {
      return 'invalid_phone_number_format'.tr;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    if (!EmailValidator.validate(value)) {
      return 'invalid_email_format'.tr;
    }
    return null;
  }

  String? validatePhoneNumberOrEmail(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    if (value.contains('@')) {
      return validateEmail(value);
    }
    return validatePhoneNumber(value);
  }

  String? validatePassword(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    if (!value.contains(RegExp(r'[0-9]')) || !value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[a-z]'))) {
      return 'invalid_password'.tr;
    }
    if (value.length < 6) {
      return 'invalid_password'.tr;
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String password) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    if (!value.contains(RegExp(r'[0-9]')) || !value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[a-z]'))) {
      return 'invalid_password'.tr;
    }
    if (value.length < 6) {
      return 'invalid_password'.tr;
    }
    if (value != password) {
      return 'password_do_not_match'.tr;
    }
    return null;
  }

  String? validateNewPassword(String? value, String oldPassword) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'please_enter_value'.tr;
    }
    if (!value.contains(RegExp(r'[0-9]')) || !value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[a-z]'))) {
      return 'invalid_password'.tr;
    }
    if (value.length < 6) {
      return 'invalid_password'.tr;
    }
    if (value == oldPassword) {
      return 'new_password_must_not_same_old_password'.tr;
    }
    return null;
  }
}
