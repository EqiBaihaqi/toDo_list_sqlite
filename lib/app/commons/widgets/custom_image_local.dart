import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'dart:typed_data';
import '../../core/app_text_styles.dart';

class CustomImageLocal extends StatelessWidget {
  final String? imagePath;
  final Uint8List? imageData;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  /// Widget [CustomImageLocal] untuk menampilkan gambar lokal - created by [G.SW]
  ///
  /// Parameter:
  /// - `imagePath`: Path file gambar lokal yang akan ditampilkan PNG, JPEG, atau SVG. Opsional.
  /// - `imageData`: Data gambar dalam bentuk [Uint8List], digunakan jika gambar dimuat dari data biner. Opsional.
  /// - `width`: Lebar gambar yang ditampilkan. Opsional, jika tidak diberikan akan menggunakan lebar otomatis.
  /// - `height`: Tinggi gambar yang ditampilkan. Opsional, jika tidak diberikan akan menggunakan tinggi otomatis.
  /// - `fit`: Menentukan cara gambar akan diatur dalam ruang yang tersedia (default adalah [BoxFit.contain]).
  /// - `color`: Warna untuk memberi efek warna pada gambar (misalnya, untuk pewarnaan atau penyesuaian kontras). Opsional.
  const CustomImageLocal({
    super.key,
    this.imagePath,
    this.imageData,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    try {
      if (imageData != null) {
        return Image.memory(
          imageData!,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
      }

      if (imagePath != null) {
        final extension = imagePath!.split('.').last.toLowerCase();

        if (extension == 'svg') {
          return _buildSvgImage();
        } else if (['png', 'jpg', 'jpeg'].contains(extension)) {
          return _buildAssetImage();
        } else if (File(imagePath!).existsSync()) {
          return Image.file(
            File(imagePath!),
            width: width,
            height: height,
            fit: fit,
            color: color,
          );
        }
      }

      return _buildPlaceholder("Gambar tidak ditemukan.");
    } catch (e) {
      debugPrint("Error loading image: $e");
      return _buildPlaceholder("Error: $e");
    }
  }

  Widget _buildSvgImage() {
    try {
      return SvgPicture.asset(
        imagePath!,
        width: width,
        height: height,
        fit: fit,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    } catch (e) {
      debugPrint("Error loading SVG: $e");
      return _buildPlaceholder("Error memuat file SVG.");
    }
  }

  Widget _buildAssetImage() {
    try {
      return Image.asset(
        imagePath!,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    } catch (e) {
      debugPrint("Error loading asset image: $e");
      return _buildPlaceholder("Error memuat asset gambar.");
    }
  }

  Widget _buildPlaceholder(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image, size: width ?? 50, color: Colors.redAccent),
          const SizedBox(height: 8),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular12.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
