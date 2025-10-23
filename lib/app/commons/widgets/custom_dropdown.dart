import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';

class CustomDropdown<T> extends StatefulWidget {
  // Basic Configuration
  final String? label;
  final String? hint;
  final List<T> items;
  final String Function(T item) itemLabel;
  final T? selectedValue;

  // Styling Configuration
  final bool isFilled;
  final Color? fillColor;
  final bool isBorder;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final EdgeInsetsGeometry? contentPadding;

  // Text Styling
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  // Icon Configuration
  final Widget? icon;
  final Color? iconColor;
  final Widget? prefixIcon;

  // Functionality
  final List<String? Function(T?)>? validators;
  final void Function(T?)? onChanged;
  final InputDecoration? decoration;
  final bool showResetButton;
  final Widget Function(T item)? itemBuilder;

  // Dropdown Menu Styling
  final Color? dropdownColor;
  final double? menuMaxHeight;

  /// Widget [CustomDropdown] dengan fitur kustomisasi yang lengkap dan mudah styling
  ///
  /// Parameter Styling:
  /// - `isFilled`: Menentukan apakah dropdown memiliki background fill
  /// - `fillColor`: Warna background dropdown
  /// - `isBorder`: Menentukan apakah dropdown memiliki border
  /// - `borderColor`: Warna border normal
  /// - `focusedBorderColor`: Warna border saat focused
  /// - `hintStyle`: Style untuk hint text
  /// - `textStyle`: Style untuk text yang dipilih
  /// - `labelStyle`: Style untuk label
  /// - `iconColor`: Warna icon dropdown
  /// - `prefixIcon`: Icon di sebelah kiri
  /// - `dropdownColor`: Warna background dropdown menu
  const CustomDropdown({
    super.key,
    // Basic Configuration
    this.label,
    this.hint,
    required this.items,
    required this.itemLabel,
    this.selectedValue,

    // Styling Configuration
    this.isFilled = false,
    this.fillColor,
    this.isBorder = false,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,

    // Text Styling
    this.hintStyle,
    this.textStyle,
    this.labelStyle,

    // Icon Configuration
    this.icon,
    this.iconColor,
    this.prefixIcon,

    // Functionality
    this.validators,
    this.onChanged,
    this.decoration,
    this.showResetButton = false,
    this.itemBuilder,

    // Dropdown Menu Styling
    this.dropdownColor,
    this.menuMaxHeight,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  void didUpdateWidget(CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      _selectedValue = widget.selectedValue;
    }
  }

  void _resetDropdown() {
    setState(() {
      _selectedValue = null;
    });
    widget.onChanged?.call(null);
  }

  // ==================== STYLING HELPER METHODS ====================

  InputDecoration _buildInputDecoration() {
    if (widget.decoration != null) return widget.decoration!;

    return InputDecoration(
      labelText: widget.label,
      labelStyle: widget.labelStyle ?? _getDefaultLabelStyle(),
      filled: widget.isFilled,
      fillColor: widget.fillColor ?? _getDefaultFillColor(),

      // Border Configuration
      border: _getBorder(),
      enabledBorder: _getEnabledBorder(),
      focusedBorder: _getFocusedBorder(),
      errorBorder: _getErrorBorder(),
      focusedErrorBorder: _getFocusedErrorBorder(),

      // Content Padding
      contentPadding: widget.contentPadding ?? _getDefaultContentPadding(),

      // Prefix Icon
      prefixIcon: widget.prefixIcon,
    );
  }

  InputBorder _getBorder() {
    if (!widget.isBorder) return InputBorder.none;

    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.colorNetral4,
      ),
    );
  }

  InputBorder _getEnabledBorder() {
    if (!widget.isBorder) return InputBorder.none;

    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.colorNetral4,
      ),
    );
  }

  InputBorder _getFocusedBorder() {
    if (!widget.isBorder) return InputBorder.none;

    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(
        color:
            widget.focusedBorderColor ??
            widget.borderColor ??
            AppColors.colorPrimary,
        width: 2.0,
      ),
    );
  }

  InputBorder _getErrorBorder() {
    if (!widget.isBorder) return InputBorder.none;

    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    );
  }

  InputBorder _getFocusedErrorBorder() {
    if (!widget.isBorder) return InputBorder.none;

    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    );
  }

  // ==================== DEFAULT STYLES ====================

  TextStyle _getDefaultLabelStyle() {
    return AppTextStyles.regular14.copyWith(color: AppColors.colorNetral7);
  }

  Color _getDefaultFillColor() {
    return AppColors.colorNetral2;
  }

  EdgeInsetsGeometry _getDefaultContentPadding() {
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  }

  TextStyle _getDefaultHintStyle() {
    return AppTextStyles.regular14.copyWith(color: AppColors.colorNetral6);
  }

  TextStyle _getDefaultTextStyle() {
    return AppTextStyles.regular14.copyWith(color: AppColors.colorNetral9);
  }

  Color _getDefaultIconColor() {
    return widget.iconColor ?? AppColors.colorNetral6;
  }

  // ==================== BUILD METHODS ====================

  @override
  Widget build(BuildContext context) {
    // Validasi selectedValue masih ada di items
    if (_selectedValue != null && !widget.items.contains(_selectedValue)) {
      _selectedValue = null;
    }

    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<T>(
            value: _selectedValue,
            decoration: _buildInputDecoration(),
            items: _buildDropdownItems(),
            onChanged: _handleOnChanged,
            validator: _validate,
            hint: _buildHintWidget(),
            icon: _buildDropdownIcon(),
            iconEnabledColor: _getDefaultIconColor(),
            iconDisabledColor: _getDefaultIconColor().withOpacity(0.5),
            dropdownColor: widget.dropdownColor,
            menuMaxHeight: widget.menuMaxHeight,
            isExpanded: true,
            style: widget.textStyle ?? _getDefaultTextStyle(),
          ),
        ),
        if (widget.showResetButton) _buildResetButton(),
      ],
    );
  }

  List<DropdownMenuItem<T>> _buildDropdownItems() {
    return widget.items.map((item) {
      return DropdownMenuItem<T>(value: item, child: _buildDropdownItem(item));
    }).toList();
  }

  Widget _buildDropdownItem(T item) {
    if (widget.itemBuilder != null) {
      return widget.itemBuilder!(item);
    }
    return Text(
      widget.itemLabel(item),
      style: widget.textStyle ?? _getDefaultTextStyle(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget? _buildHintWidget() {
    if (widget.hint == null) return null;

    return Text(
      widget.hint!,
      style: widget.hintStyle ?? _getDefaultHintStyle(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDropdownIcon() {
    if (widget.icon != null) return widget.icon!;

    return Icon(Icons.keyboard_arrow_down, color: _getDefaultIconColor());
  }

  Widget _buildResetButton() {
    return IconButton(
      icon: Icon(Icons.refresh, color: AppColors.colorNetral6),
      onPressed: _resetDropdown,
    );
  }

  // ==================== EVENT HANDLERS ====================

  void _handleOnChanged(T? newValue) {
    setState(() {
      _selectedValue = newValue;
    });
    widget.onChanged?.call(newValue);
  }

  String? _validate(T? value) {
    if (widget.validators == null) return null;

    for (var validator in widget.validators!) {
      final error = validator(value);
      if (error != null) return error;
    }
    return null;
  }
}
