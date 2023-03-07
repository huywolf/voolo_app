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
    return null;
  }
}
