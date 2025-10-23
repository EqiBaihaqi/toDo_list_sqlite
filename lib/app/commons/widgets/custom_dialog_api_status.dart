import 'package:flutter/material.dart';

import '../../core/app_text_styles.dart';

enum DialogTypeApiStatus { loading, success, failure }

class CustomDialogApiStatus extends StatelessWidget {
  final String? title;
  final String? message;
  final DialogTypeApiStatus? type;
  final VoidCallback? onOkPressed;

  /// Widget [CustomDialogApiStatus] untuk menampilkan dialog status API - created by [G.SW]
  ///
  /// Parameter:
  /// - `title`: Judul yang ditampilkan dalam dialog. Opsional.
  /// - `message`: Pesan yang ditampilkan dalam dialog. Opsional.
  /// - `type`: Jenis status API yang ingin ditampilkan (loading, success, failure). Opsional.
  /// - `onOkPressed`: Fungsi callback yang dipanggil ketika tombol OK ditekan. Opsional.
  const CustomDialogApiStatus({
    super.key,
    this.title,
    this.message,
    this.type,
    this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget dialogContent;

    switch (type) {
      case DialogTypeApiStatus.loading:
        dialogContent = Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(width: 20),
              Text(
                title ?? "Loading...",
                style: AppTextStyles.regular14.copyWith(color: Colors.white),
              ),
            ],
          ),
        );
        break;
      case DialogTypeApiStatus.success:
        dialogContent = Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              (message != null && message != '')
                  ? _buildContent1(
                    context: context,
                    title: title ?? 'Success',
                    message: message,
                    icon: Icons.check_circle,
                  )
                  : _buildContent2(
                    context: context,
                    title: title ?? 'Success',
                    icon: Icons.check_circle,
                  ),
        );
        break;
      case DialogTypeApiStatus.failure:
        dialogContent = Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              (message != null && message != '')
                  ? _buildContent1(
                    context: context,
                    title: title ?? 'Failure',
                    message: message,
                    icon: Icons.error,
                  )
                  : _buildContent2(
                    context: context,
                    title: title ?? 'Failure',
                    icon: Icons.error,
                  ),
        );
        break;
      default:
        dialogContent = const SizedBox();
        break;
    }

    return Dialog(
      backgroundColor: _getDialogBackgroundColor(type),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: dialogContent,
    );
  }

  Widget _buildContent1({
    BuildContext? context,
    String? title,
    String? message,
    IconData? icon,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 50),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
              ),
              Text(
                message ?? '',
                style: AppTextStyles.regular12.copyWith(
                  color: Colors.white.withOpacity(0.5),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context!).pop();
                    if (onOkPressed != null) onOkPressed!();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent2({
    BuildContext? context,
    String? title,
    IconData? icon,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 50),
        const SizedBox(height: 5),
        Text(
          title!,
          style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        TextButton(
          child: const Text('OK', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context!).pop();
            if (onOkPressed != null) onOkPressed!();
          },
        ),
      ],
    );
  }

  Color _getDialogBackgroundColor(DialogTypeApiStatus? type) {
    switch (type ?? DialogTypeApiStatus.loading) {
      case DialogTypeApiStatus.loading:
        return Colors.black.withOpacity(0.8);
      case DialogTypeApiStatus.success:
        return Colors.green;
      case DialogTypeApiStatus.failure:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }
}
