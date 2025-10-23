import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_architecture/app/constant/constant_asset.dart';
import 'package:getx_pattern_architecture/app/style/style_color.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import 'custom_button.dart';
import 'custom_image_local.dart';

/**
 * Created by muhamadsaid on 12/22/24, Android Studio
 */

class CustomDialogConfirmation extends StatelessWidget {
  const CustomDialogConfirmation({
    super.key,
    required this.title,
    required this.body,
    this.assetIconPath,
    this.buttonTextPositive,
    this.buttonTextNegative,
    this.onButtonPressedPostive,
    this.onButtonPressedNegative,
    this.widthIcon,
  });

  final String title;
  final String body;
  final String? assetIconPath;
  final String? buttonTextPositive;
  final String? buttonTextNegative;
  final VoidCallback? onButtonPressedPostive;
  final VoidCallback? onButtonPressedNegative;
  final double? widthIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          CustomImageLocal(
            imagePath: assetIconPath ?? ConstantAsset.icSukses,
            width: widthIcon ?? 100.0,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold24,
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.colorNetral7,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: buttonTextNegative ?? 'Back',
                  borderRadius: 6,
                  isOutlinedButton: true,
                  isGradientOutline: false,
                  isGradient: false,
                  textColor: CustomColor.netral1,
                  backgroundColor: CustomColor.red400,
                  width: context.width,
                  onPressed: () {
                    if (onButtonPressedNegative != null) {
                      onButtonPressedNegative!();
                    } else {
                      Get.back();
                    }
                  },
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: CustomButton(
                  label: buttonTextPositive ?? 'Confirm',
                  isGradient: true,
                  borderRadius: 6,
                  gradientColors: [Colors.blue, Colors.purple],
                  textColor: CustomColor.netral1,
                  width: context.width,
                  onPressed: () {
                    if (onButtonPressedPostive != null) {
                      onButtonPressedPostive!();
                    } else {
                      Get.back();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
