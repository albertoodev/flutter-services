import 'package:services/services/validator/reg_exp.dart';

class Validator {
  Validator._();

  ///
  /// email validator using the regular expression
  ///
  static String? email(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    RegExp regExp = RegExp(EMAIL_RE);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  ///
  /// phone validator using the regular expression
  ///
  static String? phone(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    RegExp regExp = RegExp(DZ_PHONE_RE);
    if (!regExp.hasMatch(value.trim())) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  ///
  /// password validator using the regular expression
  ///
  static String? password(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.trim().length < 6) {
      return 'Weak Password ';
    }
    return null;
  }

  ///
  /// confirm password validator
  ///
  static String? confirmPassword(String? value, String passwordValue) {
    if (password(passwordValue) != null) {
      return null;
    }
    if (value != passwordValue) {
      return 'Confirm Password and The password is not the same';
    }
    return null;
  }

  ///
  /// confirm password validator
  ///
  static String? emptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field cannot be Empty';
    }
    return null;
  }
}
