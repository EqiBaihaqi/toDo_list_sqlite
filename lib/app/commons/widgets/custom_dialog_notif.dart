import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_architecture/app/style/style_color.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import 'custom_button.dart';
import 'custom_image_local.dart';
import '../../constant/constant_asset.dart';

enum NotificationType { success, error, info }

class CustomDialogNotif extends StatelessWidget {
  const CustomDialogNotif({
    super.key,
    this.title,
    this.body,
    this.assetIconPath,
    this.buttonText,
    this.onButtonPressed,
    this.type = NotificationType.success,
    this.autoCloseDuration,
    this.widthIcon,
    this.textStyleBody,
    this.bodyWidget,
  });

  final String? title;
  final String? body;
  final String? assetIconPath;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final NotificationType type;
  final Duration? autoCloseDuration;
  final double? widthIcon;
  final TextStyle? textStyleBody;
  final Widget? bodyWidget;
  @override
  Widget build(BuildContext context) {
    // Auto close jika diberikan durasi
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration!, () {
        if (Get.isDialogOpen == true) Get.back();
      });
    }

    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageLocal(
            imagePath: assetIconPath ?? _getDefaultIcon(),
            width: widthIcon ?? 64.0,
          ),
          const SizedBox(height: 24),
          Text(
            title ?? 'this is the default title text',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold24,
          ),
          const SizedBox(height: 8),
          bodyWidget ??
              Text(
                body ?? ' this is the default body text',
                style:
                    textStyleBody ??
                    AppTextStyles.regular14.copyWith(
                      color: AppColors.colorNetral7,
                    ),
                textAlign: TextAlign.center,
              ),
          const SizedBox(height: 24),
          buttonText != null
              ? CustomButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  label: buttonText ?? 'Close',
                  isGradient: true,
                  gradientColors: _getButtonGradientColors(),
                  width: context.width,
                  onPressed: () {
                    if (onButtonPressed != null) {
                      onButtonPressed!();
                    } else {
                      Get.back();
                    }
                  },
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  String _getDefaultIcon() {
    switch (type) {
      case NotificationType.error:
        return ConstantAsset.imgFailed;
      case NotificationType.info:
        return ConstantAsset.imgInfo;
      case NotificationType.success:
      default:
        return ConstantAsset.icSukses;
    }
  }

  List<Color> _getButtonGradientColors() {
    switch (type) {
      case NotificationType.error:
        return [CustomColor.blueGradient, CustomColor.purpleGradient];
      case NotificationType.info:
        return [CustomColor.blueGradient, CustomColor.purpleGradient];
      case NotificationType.success:
        return [CustomColor.blueGradient, CustomColor.purpleGradient];
      default:
        return [Color(0xFF4CAF50), Color(0xFF66BB6A)]; // hijau
    }
  }
}
