import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_text_styles.dart';

export 'src/text_form_input_formatters.dart';
export 'src/text_form_validations.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final bool isFilled;
  final Color? fillColor;
  final bool isBorder;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final List<String? Function(String?)>? validations;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? separatedLabel;
  final int? lines;
  final int? maxLength;
  final bool? readOnly;
  final Function()? onTap;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Color? errorBorderColor;
  final TextStyle? errorTextStyle;
  final Color? errorFillColor;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.textStyle,
    this.decoration,
    this.isFilled = false,
    this.fillColor,
    this.isBorder = false,
    this.borderRadius,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword = false,
    this.validations,
    this.inputFormatters,
    this.onChanged,
    this.contentPadding,
    this.separatedLabel,
    this.lines,
    this.maxLength,
    this.readOnly,
    this.onTap,
    this.initialValue,
    this.hintStyle,
    this.inputTextStyle,
    this.errorBorderColor,
    this.errorTextStyle,
    this.errorFillColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;
  bool _hasError = false; // ← Track error state

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _validate(String? value) {
    String? errorMessage;
    bool hasError = false;

    if (widget.validations != null) {
      for (var validation in widget.validations!) {
        final result = validation(value);
        if (result != null) {
          errorMessage = result;
          hasError = true;
          break;
        }
      }
    }

    if (_hasError != hasError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _hasError = hasError;
          });
        }
      });
    }

    return errorMessage;
  }

  Color _getIconColor() {
    if (_hasError) {
      return widget.errorBorderColor ?? Colors.red;
    }
    return AppColors.colorNetral6;
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon == null) return null;

    if (widget.prefixIcon is Icon) {
      final icon = widget.prefixIcon as Icon;
      return Icon(icon.icon, color: _getIconColor(), size: icon.size);
    }

    return Theme(
      data: Theme.of(
        context,
      ).copyWith(iconTheme: IconThemeData(color: _getIconColor())),
      child: widget.prefixIcon!,
    );
  }

  /// Helper method untuk membuat suffix icon dengan warna yang sesuai
  Widget? _buildSuffixIcon() {
    // Jika password field, return password toggle icon
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color:
              _getIconColor(), // ← Gunakan warna yang sama dengan state error
        ),
        onPressed: _togglePasswordVisibility,
      );
    }

    // Jika ada suffixIcon custom
    if (widget.suffixIcon == null) return null;

    // Jika suffixIcon adalah Icon widget, update warnanya
    if (widget.suffixIcon is Icon) {
      final icon = widget.suffixIcon as Icon;
      return Icon(icon.icon, color: _getIconColor(), size: icon.size);
    }

    // Jika suffixIcon adalah IconButton, update warna icon di dalamnya
    if (widget.suffixIcon is IconButton) {
      final iconButton = widget.suffixIcon as IconButton;
      if (iconButton.icon is Icon) {
        final icon = iconButton.icon as Icon;
        return IconButton(
          icon: Icon(icon.icon, color: _getIconColor(), size: icon.size),
          onPressed: iconButton.onPressed,
          padding: iconButton.padding,
          constraints: iconButton.constraints,
          style: iconButton.style,
        );
      }
    }

    // Untuk widget lain, wrap dengan Theme
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(iconTheme: IconThemeData(color: _getIconColor())),
      child: widget.suffixIcon!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.separatedLabel == null
        ? textFormField()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.separatedLabel}', style: AppTextStyles.regular14),
            const SizedBox(height: 8),
            textFormField(),
          ],
        );
  }

  TextFormField textFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: widget.onTap,
      initialValue: widget.initialValue,
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      maxLength: widget.maxLength,
      minLines: widget.lines ?? 1,
      maxLines: widget.lines ?? 1,
      style:
          widget.inputTextStyle ??
          widget.textStyle ??
          AppTextStyles.regular14.copyWith(color: AppColors.colorNetral9),
      onChanged: widget.onChanged,
      validator: _validate,
      inputFormatters: widget.inputFormatters,
      cursorColor: AppColors.colorNetral9,
      cursorErrorColor: Colors.red,
      decoration:
          widget.decoration ??
          InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle:
                widget.hintStyle ??
                AppTextStyles.regular14.copyWith(color: AppColors.colorNetral6),
            filled: widget.isFilled,
            fillColor:
                _hasError
                    ? (widget.errorFillColor ?? Colors.red.withOpacity(0.1))
                    : (widget.fillColor ?? Colors.grey[200]),

            // Border styling dengan error handling
            border:
                widget.isBorder
                    ? OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? AppColors.colorGrey100,
                      ),
                    )
                    : InputBorder.none,
            enabledBorder:
                widget.isBorder
                    ? OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color:
                            _hasError
                                ? (widget.errorBorderColor ?? Colors.red)
                                : (widget.borderColor ??
                                    AppColors.colorGrey100),
                      ),
                    )
                    : InputBorder.none,
            focusedBorder:
                widget.isBorder
                    ? OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color:
                            _hasError
                                ? (widget.errorBorderColor ?? Colors.red)
                                : (widget.borderColor ??
                                    AppColors
                                        .colorGrey100), // ← Ubah dari AppColors.colorBlue600
                        width: 2.0,
                      ),
                    )
                    : InputBorder.none,
            errorBorder:
                widget.isBorder
                    ? OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: widget.errorBorderColor ?? Colors.red,
                        width: 1.0,
                      ),
                    )
                    : InputBorder.none,
            focusedErrorBorder:
                widget.isBorder
                    ? OutlineInputBorder(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: widget.errorBorderColor ?? Colors.red,
                        width: 2.0,
                      ),
                    )
                    : InputBorder.none,

            // Error text styling
            errorStyle:
                widget.errorTextStyle ??
                AppTextStyles.regular12.copyWith(color: Colors.red),

            // ← Gunakan custom icon builders
            prefixIcon: _buildPrefixIcon(),
            suffixIcon: _buildSuffixIcon(),

            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
    );
  }
}
