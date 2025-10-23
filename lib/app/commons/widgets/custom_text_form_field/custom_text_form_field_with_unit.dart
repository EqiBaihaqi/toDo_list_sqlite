import 'package:flutter/material.dart';
import 'package:getx_pattern_architecture/app/core/app_colors.dart';
import 'package:getx_pattern_architecture/app/core/app_text_styles.dart';
import 'custom_text_form_field.dart';

enum UnitPosition { prefix, suffix }

class CustomTextFieldWithUnit extends StatelessWidget {
  const CustomTextFieldWithUnit({
    super.key,
    required this.unitLabel,
    required this.textFormField,
    this.title,
    this.titleStyle,
    this.unitPosition = UnitPosition.suffix,
    this.unitColor,
    this.labelColor,
  });

  final String? title;
  final TextStyle? titleStyle;
  final String unitLabel;
  final CustomTextFormField textFormField;
  final UnitPosition unitPosition;
  final Color? unitColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(10);
    final labelStyle = AppTextStyles.regular14.copyWith(
      color: labelColor ?? Colors.white,
    );

    final unitBox = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: unitColor ?? AppColors.colorGrey500,
        borderRadius: BorderRadius.only(
          topLeft: unitPosition == UnitPosition.prefix ? radius : Radius.zero,
          bottomLeft:
              unitPosition == UnitPosition.prefix ? radius : Radius.zero,
          topRight: unitPosition == UnitPosition.suffix ? radius : Radius.zero,
          bottomRight:
              unitPosition == UnitPosition.suffix ? radius : Radius.zero,
        ),
      ),
      child: Center(child: Text(unitLabel, style: labelStyle)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? '', style: titleStyle),
        const SizedBox(height: 10),
        IntrinsicHeight(
          child: Row(
            children: [
              if (unitPosition == UnitPosition.prefix) unitBox,
              Expanded(child: textFormField),
              if (unitPosition == UnitPosition.suffix) unitBox,
            ],
          ),
        ),
      ],
    );
  }
}
