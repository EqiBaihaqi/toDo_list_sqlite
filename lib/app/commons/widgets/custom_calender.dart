import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';

class CustomCalendar extends StatefulWidget {
  final Duration? maxRangeDuration;
  final Function(DateTime startDate, DateTime endDate) onRangeSelected;

  const CustomCalendar({
    super.key,
    this.maxRangeDuration,
    required this.onRangeSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final controller = Get.put(CustomCalenderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TableCalendar(
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        headerStyle: const HeaderStyle(titleCentered: true),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: controller.startDate.value,
        rangeSelectionMode: controller.rangeSelectionMode.value,
        selectedDayPredicate: (day) {
          return isSameDay(controller.startDate.value, day) ||
              isSameDay(controller.endDate.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          focusedDay = selectedDay;

          if (controller.rangeSelectionMode.value ==
              RangeSelectionMode.toggledOff) {
            // Set start date and end date to same day initially
            controller.startDate.value = selectedDay;
            controller.endDate.value = selectedDay;
            controller.rangeSelectionMode.value = RangeSelectionMode.toggledOn;
            widget.onRangeSelected(
              controller.startDate.value,
              controller.endDate.value,
            );
          } else {
            // Validate max range duration
            final selectedRange =
                selectedDay.difference(controller.startDate.value).abs();
            if (widget.maxRangeDuration != null &&
                selectedRange > widget.maxRangeDuration!) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Max range is ${widget.maxRangeDuration!.inDays} days!',
                  ),
                ),
              );
              return;
            }

            // Update end date
            controller.endDate.value = selectedDay;
            controller.rangeSelectionMode.value = RangeSelectionMode.toggledOff;
            widget.onRangeSelected(
              controller.startDate.value,
              controller.endDate.value,
            );
          }
        },
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.colorBlue50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.colorNetral7,
                  ),
                ),
              ),
            );
          },
          rangeHighlightBuilder: (context, day, isWithinRange) {
            final isInRange =
                (day.isAtSameMomentAs(controller.startDate.value) ||
                    day.isAtSameMomentAs(controller.endDate.value)) ||
                (day.isAfter(controller.startDate.value) &&
                    day.isBefore(controller.endDate.value));

            if (isInRange) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(color: AppColors.colorRed50),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: AppTextStyles.regular14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
            return null;
          },
          selectedBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: AppTextStyles.regular14.copyWith(color: Colors.white),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class CustomCalenderController extends GetxController {
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  final rangeSelectionMode = RangeSelectionMode.toggledOff.obs;

  void resetRange() {
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
    rangeSelectionMode.value = RangeSelectionMode.toggledOff;
  }
}
