import 'package:flutter/material.dart';
import 'package:getx_pattern_architecture/app/core/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isIconLeading;
  final double iconTextSpacing;
  final Color backgroundColor;
  final Color textColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double? elevation;
  final double? borderRadius;
  final double? width;
  final double? height;
  final bool isEnabled;
  final VoidCallback? onLongPress;
  final bool isTextButton;
  final bool isOutlinedButton;
  final bool isGradient;
  final bool isGradientOutline;
  final List<Color>? gradientColors;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle; // ← Parameter untuk custom text style

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isIconLeading = true,
    this.iconTextSpacing = 8.0,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    this.splashColor,
    this.highlightColor,
    this.elevation,
    this.borderRadius = 8.0,
    this.width,
    this.height,
    this.isEnabled = true,
    this.onLongPress,
    this.isTextButton = false,
    this.isOutlinedButton = false,
    this.isGradient = false,
    this.isGradientOutline = false,
    this.gradientColors,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> finalGradientColors =
        gradientColors ?? [Colors.blue, Colors.purple];

    final Color fallbackTextColor = isEnabled ? textColor : Colors.grey;

    if (isGradientOutline) {
      return GestureDetector(
        onTap: isEnabled ? onPressed : null,
        onLongPress: isEnabled ? onLongPress : null,
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: finalGradientColors),
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            ),
            alignment: Alignment.center,
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: _buildGradientContent(finalGradientColors),
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      elevation: isTextButton ? 0.0 : (elevation ?? 0.0),
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        splashColor: splashColor ?? Colors.white.withOpacity(0.2),
        highlightColor: highlightColor ?? Colors.white.withOpacity(0.1),
        child: Container(
          width: width,
          height: height,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: isGradient ? null : backgroundColor,
            gradient:
                isGradient ? LinearGradient(colors: finalGradientColors) : null,
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            border: isOutlinedButton
                ? Border.all(color: textColor, width: 2.0)
                : null,
          ),
          child: Center(child: _buildButtonContent(fallbackTextColor)),
        ),
      ),
    );
  }

  /// Content untuk gradient outline button
  Widget _buildGradientContent(List<Color> gradientColors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null && isIconLeading) ...[
          Icon(icon, color: gradientColors.first),
          SizedBox(width: iconTextSpacing),
        ],
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: gradientColors,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            label,
            style: _getTextStyle().copyWith(
              color: Colors.white, // akan di-replace oleh shader
            ),
          ),
        ),
        if (icon != null && !isIconLeading) ...[
          SizedBox(width: iconTextSpacing),
          Icon(icon, color: gradientColors.first),
        ],
      ],
    );
  }

  /// Content untuk button biasa
  Widget _buildButtonContent(Color textColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null && isIconLeading) ...[
          Icon(icon, color: textColor),
          SizedBox(width: iconTextSpacing),
        ],
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _getTextStyle().copyWith(color: textColor),
          ),
        ),
        if (icon != null && !isIconLeading) ...[
          SizedBox(width: iconTextSpacing),
          Icon(icon, color: textColor),
        ],
      ],
    );
  }

  /// Helper method untuk mendapatkan text style
  TextStyle _getTextStyle() {
    return textStyle ?? AppTextStyles.semiBold14;
  }
}
