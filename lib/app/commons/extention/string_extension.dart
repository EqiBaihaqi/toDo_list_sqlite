import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatJamFromString() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" " HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('HH:mm').format(tanggalnya);
    return formattedDate;
  }

  String toCustomFormatDate(String format) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" " HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('HH:mm').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalFromString() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" " HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd-MM-yyyy').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalFromStringShow() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" " HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalSlash() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" " HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd/MM/yyyy', 'id_ID').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalSendServerFromPicker() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd" " HH:mm:ssZ");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd-MM-yyyy', 'id_ID').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalFromAPI() {
    DateFormat dateFormat = DateFormat("dd-MMM-yyyy");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd-MM-yyyy').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalShow() {
    try {
      DateFormat dateFormat = DateFormat("dd-MMM-yyyy");
      DateTime tanggalnya = dateFormat.parse(this);
      // String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(tanggalnya);
      String formattedDate =
          DateFormat('dd/MM/yyyy', 'id_ID').format(tanggalnya);
      return formattedDate;
    } catch (e) {
      return this;
    }
  }

  String formatTanggalShowFromAPI() {
    try {
      DateFormat dateFormat = DateFormat("dd-MM-yyyy");
      DateTime tanggalnya = dateFormat.parse(this);
      // String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(tanggalnya);
      String formattedDate =
          DateFormat('dd/MM/yyyy', 'id_ID').format(tanggalnya);
      return formattedDate;
    } catch (e) {
      return this;
    }
  }

  String formatDateSendAPI(String format) {
    try {
      print("cek $this \n format -> $format");
      DateFormat dateFormat = DateFormat(format, "id_ID");
      DateTime tanggalnya = dateFormat.parse(this);
      String formattedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss', 'id_ID').format(tanggalnya);
      return formattedDate;
    } catch (e) {
      print("e -> ${e.toString()}");
      return this;
    }
  }

  String formatTanggalSendServer() {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy", "id_ID");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd-MMM-yyyy').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalSendServerNew() {
    try {
      DateFormat dateFormat = DateFormat("dd/MM/yyyy", "id_ID");
      DateTime tanggalnya = dateFormat.parse(this);
      String formattedDate = DateFormat('dd-MM-yyyy').format(tanggalnya);
      return formattedDate;
    } catch (e) {
      return this;
    }
  }

  String formatTanggalEvent() {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy", "id_ID");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd/MM/yy').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalEventToIndo() {
    DateFormat dateFormat = DateFormat("dd/MM/yy", "id_ID");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(tanggalnya);
    return formattedDate;
  }

  String formatTanggalSendServerFromRoute() {
    DateFormat dateFormat = DateFormat("dd MMMM yyyy", "id_ID");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat('dd-MM-yyyy').format(tanggalnya);
    return formattedDate;
  }

  DateTime toDatefromString() {
    try {
      DateFormat dateFormat = DateFormat("dd MMMM yyyy", "id_ID");
      DateTime tanggalnya = dateFormat.parse(this);
      return tanggalnya;
    } catch (e) {
      return DateTime.now();
    }
  }

  String formatTanggalShowFromRoute() {
    try {
      DateFormat dateFormat = DateFormat("dd MMMM yyyy", "id_ID");
      DateTime tanggalnya = dateFormat.parse(this);
      String formattedDate = DateFormat('dd/MM/yyyy').format(tanggalnya);
      return formattedDate;
    } catch (e) {
      return this;
    }
  }

  String customDateFormat(String oldFormat, String newFormat) {
    DateFormat dateFormat = DateFormat(oldFormat, "id_ID");
    DateTime tanggalnya = dateFormat.parse(this);
    String formattedDate = DateFormat(newFormat, 'id_ID').format(tanggalnya);
    return formattedDate;
  }

  DateTime toDate(String formatDate) {
    DateFormat dateFormat = DateFormat(formatDate, "id_ID");
    DateTime dateTime = dateFormat.parse(this);
    return dateTime;
  }

  String toCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
