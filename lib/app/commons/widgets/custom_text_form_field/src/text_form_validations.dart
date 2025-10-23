class TextFormValidation {
  /// Validasi untuk memastikan nilai tidak kosong
  static String? emptyValidation(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return "${fieldName ?? 'Field'} tidak boleh kosong";
    }
    return null;
  }

  /// Validasi panjang minimal
  static String? minLengthValidation(String? value, int minLength,
      {String? message}) {
    if (value == null || value.trim().length < minLength) {
      return message ?? "Minimal $minLength karakter";
    }
    return null;
  }

  /// Validasi panjang maksimal
  static String? maxLengthValidation(String? value, int maxLength) {
    if (value != null && value.trim().length > maxLength) {
      return "Maksimal $maxLength karakter";
    }
    return null;
  }

  /// Validasi email
  static String? emailValidation(String? value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || !emailRegex.hasMatch(value)) {
      return "Masukkan email yang valid";
    }
    return null;
  }

  /// Validasi angka
  static String? numberValidation(String? value) {
    final numberRegex = RegExp(r'^[0-9]+$');
    if (value == null || !numberRegex.hasMatch(value)) {
      return "Hanya angka yang diperbolehkan";
    }
    return null;
  }

  /// Validasi nilai minimal
  static String? minValueValidation(String? value, int minValue) {
    if (value == null || int.tryParse(value) == null) {
      return "Masukkan angka yang valid";
    }
    final intValue = int.parse(value);
    if (intValue < minValue) {
      return "Nilai minimal adalah $minValue";
    }
    return null;
  }

  /// Validasi nilai maksimal
  static String? maxValueValidation(String? value, int maxValue) {
    if (value == null || int.tryParse(value) == null) {
      return "Masukkan angka yang valid";
    }
    final intValue = int.parse(value);
    if (intValue > maxValue) {
      return "Nilai maksimal adalah $maxValue";
    }
    return null;
  }

  /// Validasi hanya huruf
  static String? letterValidation(String? value) {
    final letterRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (value == null || !letterRegex.hasMatch(value)) {
      return "Hanya huruf yang diperbolehkan";
    }
    return null;
  }

  /// Validasi format nomor telepon
  static String? phoneNumberValidation(String? value) {
    final phoneRegex = RegExp(r'^\+?[0-9\s]{8,15}$');
    if (value == null || !phoneRegex.hasMatch(value)) {
      return "Masukkan nomor telepon yang valid";
    }
    return null;
  }

  /// Validasi kecocokan dengan pola khusus
  static String? customPatternValidation(
      String? value, String pattern, String errorMessage) {
    final regex = RegExp(pattern);
    if (value == null || !regex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  /// Validasi untuk memastikan dua nilai cocok
  static String? matchValidation(
      String? value, String? matchWith, String fieldName,
      {String? message}) {
    if (value != matchWith) {
      return message ?? "Field ini harus sama dengan $fieldName";
    }
    return null;
  }
}
