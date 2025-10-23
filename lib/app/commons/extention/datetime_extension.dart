import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatJam() {
    String formattedDate = DateFormat('HH:mm').format(this);
    return formattedDate;
  }

  String toStringWithFormat(String format) {
    String formattedDate = DateFormat(format, 'id_ID').format(this);
    return formattedDate;
  }

  String toStringWithFormatFromAPI() {
    String formattedDate = DateFormat("dd/MM/yyyy").format(this);
    return formattedDate;
  }
}
