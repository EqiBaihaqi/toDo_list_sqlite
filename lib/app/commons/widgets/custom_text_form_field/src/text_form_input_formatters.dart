import 'package:flutter/services.dart';

class TextFormInputFormatters {
  /// Formatter untuk hanya mengizinkan angka
  static TextInputFormatter onlyDigits() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  /// Formatter untuk hanya mengizinkan huruf kecil
  static TextInputFormatter onlyLowercaseLetters() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-z]'));
  }

  /// Formatter untuk hanya mengizinkan huruf besar
  static TextInputFormatter onlyUppercaseLetters() {
    return FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'));
  }

  /// Formatter untuk hanya mengizinkan huruf (besar dan kecil)
  static TextInputFormatter onlyLetters() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));
  }

  /// Formatter untuk hanya mengizinkan angka dan huruf
  static TextInputFormatter alphanumeric() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));
  }

  /// Formatter untuk mengatur panjang maksimal input
  static TextInputFormatter maxLength(int length) {
    return LengthLimitingTextInputFormatter(length);
  }

  /// Formatter untuk format angka desimal
  static TextInputFormatter decimal({int decimalPlaces = 2}) {
    final regExp = RegExp(r'^\d+\.?\d{0,' + decimalPlaces.toString() + r'}$');
    return FilteringTextInputFormatter.allow(regExp);
  }

  /// Formatter untuk hanya mengizinkan karakter khusus (contoh: hanya huruf besar dan angka)
  static TextInputFormatter customPattern(String pattern) {
    return FilteringTextInputFormatter.allow(RegExp(pattern));
  }
}
