import 'package:flutter/material.dart';
import 'package:getx_pattern_architecture/app/core/app_colors.dart';
import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('EEEE, dd/MM/yyyy HH:mm', 'id_ID').format(dateTime);
}

String formatTime(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('HH:mm', 'id_ID').format(dateTime);
}

String formatDuration(Duration duration) {
  final hours = duration.inHours;
  return hours.toString();
  // final minutes = duration.inMinutes % 60;
  // return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

Duration calculateDuration(TimeOfDay start, TimeOfDay end) {
  final now = DateTime.now();
  final startDateTime =
      DateTime(now.year, now.month, now.day, start.hour, start.minute);
  final endDateTime =
      DateTime(now.year, now.month, now.day, end.hour, end.minute);
  return endDateTime.difference(startDateTime);
}

Future<DateTime?> pickDateTime(BuildContext context,
    {DateTime? initialDate}) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.colorRed500,
            onPrimary: Colors.white,
            onSurface: AppColors.colorRed500,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.colorRed500,
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.colorRed500,
              onPrimary: Colors.white,
              onSurface: AppColors.colorRed500,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      return DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }
  return null;
}

Future<TimeOfDay?> pickTime(BuildContext context,
    {TimeOfDay? initialTime}) async {
  return showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.colorRed500,
            onPrimary: Colors.white,
            onSurface: AppColors.colorRed500,
          ),
        ),
        child: child!,
      );
    },
  );
}

Future<DateTime?> pickDate(BuildContext context,
    {DateTime? initialDate}) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.colorRed500,
            onPrimary: Colors.white,
            onSurface: AppColors.colorRed500,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.colorRed500,
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  return pickedDate;
}
