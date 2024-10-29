import 'package:get/get.dart';

import '../log_helper/log_helper.dart';
import 'validation_type.dart';



class ValidationErrors {
  static fieldValidation(
      {required String value,
      required int minValue,
      required int maxValue,
      required ValidationType validationType}) {
    if (validationType == ValidationType.name) {
      if (!GetUtils.isUsername(value)) {
        return 'Please enter a valid name'.tr;
      }
    } else if (validationType == ValidationType.email) {
      if (!GetUtils.isEmail(value)) {
        return 'Please enter a valid email'.tr;
      }
    } else if (validationType == ValidationType.number) {
      if (!hasMatch(value, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')) {
        return 'Please enter a valid phone number'.tr;
      }
    } else if (validationType == ValidationType.password) {
      if (!hasUpperCase(value)) {
        return 'Please enter one capital letter at less'.tr;
      }
      if (!hasLowerCaseString(value)) {
        return 'Please enter one lower letter at less'.tr;
      }
      if (!hasNumber(value)) {
        return 'Please enter one number at less'.tr;
      }
    }
    if (value.isEmpty) {
      return "This field is required".tr;
    }
    if (value.length < minValue) {
      return "${"Can't be less than".tr} $minValue";
    }
    if (value.length > maxValue) {
      return "${"Can't be more than".tr} $maxValue";
    }
  }

  //for compare passwords
  static confirmValidate(String passwordValue, String confirmPasswordValue) {
    if (confirmPasswordValue != passwordValue ||
        confirmPasswordValue.isEmpty ||
        passwordValue.isEmpty) {
      return "Doesn't compare".tr;
    }
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}

bool hasUpperCase(String password) {
  bool hasUpper = false;
  for (int i = 0; i < password.length; i++) {
    if (password[i].toUpperCase() == password[i] && !password[i].isNum) {
      hasUpper = true;
      break;
    }
  }
  LogHelper.logMagenta("hasUpperCase $hasUpper");
  return hasUpper;
}

bool hasNumber(String password) {
  bool hasNumber = false;
  for (int i = 0; i < password.length; i++) {
    if (int.tryParse(password[i]) != null) {
      hasNumber = true;
      break;
    }
  }
  LogHelper.logMagenta("hasNumber $hasNumber");
  return hasNumber;
}

bool hasLowerCaseString(String password) {
  bool hasLowercase = false;
  for (int i = 0; i < password.length; i++) {
    if (password[i].toLowerCase() == password[i]&& !password[i].isNum) {
      hasLowercase = true;
      break;
    }
  }
  LogHelper.logMagenta("hasLowercase $hasLowercase");
  return hasLowercase;
}
