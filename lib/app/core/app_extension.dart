import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntegetExtension on int? {
  bool get success {
    if (this == 200 || this == 201 || this == 204) {
      return true;
    }
    return false;
  }
}

extension FormatDate on String {
  String toFormattedDate() {
    try {
      // Parse string to DateTime
      DateTime parsedDate = DateTime.parse(this);
      // Format DateTime to "dd-MM-yyyy"
      return "${parsedDate.day.toString().padLeft(2, '0')}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.year}";
    } catch (e) {
      return "Invalid date format"; // Handle error if the string is not a valid date
    }
  }

  String toFormattedDate2() {
    try {
      // Parse string to DateTime
      DateTime parsedDate = DateTime.parse(this);
      // Format DateTime to "dd/MM/yyyy"
      return "${parsedDate.day.toString().padLeft(2, '0')}/${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year}";
    } catch (e) {
      return "Invalid date format"; // Handle error if the string is not a valid date
    }
  }

  String toFormattedDateFull() {
    try {
      // Parse string to DateTime
      DateTime parsedDate = DateTime.parse(this);

      // Create DateFormat instance with the desired pattern
      final dateFormatter = DateFormat('EEEE, dd/MM/yyyy HH:mm', 'id_ID');

      // Format DateTime to the desired format
      return dateFormatter.format(parsedDate);
    } catch (e) {
      return "Invalid date format"; // Handle error if the string is not a valid date
    }
  }
}

extension TimeAgo on String {
  String timeAgo() {
    try {
      DateTime date = DateTime.parse(this).toLocal();
      DateTime now = DateTime.now();

      if (date.isAfter(now)) {
        return "";
      }

      Duration difference = now.difference(date);

      if (difference.inSeconds < 60) {
        return "${difference.inSeconds} detik yang lalu";
      } else if (difference.inMinutes < 60) {
        return "${difference.inMinutes} menit yang lalu";
      } else if (difference.inHours < 24) {
        return "${difference.inHours} jam yang lalu";
      } else if (difference.inDays < 7) {
        return "${difference.inDays} hari yang lalu";
      } else if (difference.inDays < 30) {
        return "${(difference.inDays / 7).floor()} minggu yang lalu";
      } else if (difference.inDays < 365) {
        return "${(difference.inDays / 30).floor()} bulan yang lalu";
      } else {
        return "${(difference.inDays / 365).floor()} tahun yang lalu";
      }
    } catch (e) {
      return "Tanggal tidak valid";
    }
  }
}

void main() {
  String date = "2025-01-05T10:28:00.000Z";
  String result = date.timeAgo();
  debugPrint(result);
}
