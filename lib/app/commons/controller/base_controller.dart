import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_architecture/app/commons/widgets/custom_dialog_notif.dart';

import '../../constant/constant_asset.dart';
import '../widgets/custom_dialog_api_status.dart';

/// Status API yang menunjukkan apakah operasi API sedang berlangsung, gagal, atau berhasil.
enum ApiState {
  loading, // Status ini menunjukkan bahwa operasi API sedang berlangsung.
  failure, // Status ini menunjukkan bahwa operasi API gagal.
  success // Status ini menunjukkan bahwa operasi API berhasil.
}

/// Mixin yang menyediakan fungsi untuk mengelola data formulir dan melakukan operasi API dengan template umum.
mixin BaseController {
  // untuk form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Map yang menyimpan data formulir dengan pasangan kunci-nilai.
  Map<String, dynamic> dataForm = {};

  /// Menambahkan data ke dalam [dataForm].
  ///
  /// [key] adalah kunci untuk data yang akan ditambahkan.
  /// [value] adalah nilai untuk data yang akan ditambahkan.
  void addDataForm(key, value) {
    dataForm[key] = value;
  }

  /// Menghapus data dari [dataForm].
  ///
  /// [key] adalah kunci dari data yang akan dihapus.
  void removeDataForm(key) {
    dataForm.remove(key);
  }

  /// Mereset [dataForm] dengan menghapus semua data yang ada.
  void resetDataForm() {
    dataForm.clear();
  }

  /// Template untuk melakukan operasi API dengan penanganan status dan callback.
  ///
  /// [T] adalah tipe data yang diharapkan dari hasil API.
  ///
  /// [apiStatus] adalah referensi reaktif yang menyimpan status API.
  /// [apiCallback] adalah callback future yang memanggil API dan mengembalikan `RepoResult`.
  /// [successCallback] adalah fungsi yang dipanggil ketika operasi API berhasil.
  /// [failureCallback] adalah fungsi yang dipanggil ketika operasi API gagal.
  ///
  /// Mengubah status API menjadi `ApiState.loading` sebelum memulai operasi.
  /// Setelah operasi selesai, status diubah menjadi `ApiState.success` atau `ApiState.failure`
  /// berdasarkan hasil operasi. Memanggil callback `successCallback` jika operasi berhasil
  /// atau `failureCallback` jika operasi gagal.
  Future<void> apiOperationTemplate<T>(
    Rx<ApiState> apiStatus,
    Future<Either<String, T>> apiCallback,
    void Function(T success) successCallback,
    void Function(String failure) failureCallback,
  ) async {
    apiStatus.value = ApiState.loading;
    Either<String, T> failureOrSuccess = await apiCallback;
    failureOrSuccess.fold(
      (String failure) {
        apiStatus.value = ApiState.failure;
        failureCallback(failure);
      },
      (T success) {
        apiStatus.value = ApiState.success;
        successCallback(success);
      },
    );
  }

  void showLoading(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialogApiStatus(
            type: DialogTypeApiStatus.loading, title: message);
      },
    );
  }

  void hideLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  void showFailure(BuildContext context, String message) {
    hideLoading(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          // shape: AppDecoration.bottomSheetDecoration,
          child: CustomDialogNotif(
            title: 'Failed!',
            body: message,
            assetIconPath: ConstantAsset.imgFailed,
            buttonText: 'OK',
            onButtonPressed: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  void showSuccess(BuildContext context, String message,
      {String? title, VoidCallback? onButtonPressed, String? buttonText}) {
    hideLoading(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          // shape: AppDecoration.bottomSheetDecoration,
          child: CustomDialogNotif(
            title: title ?? 'Success!',
            body: message,
            assetIconPath: ConstantAsset.icSukses,
            buttonText: buttonText ?? 'OK',
            onButtonPressed: onButtonPressed,
          ),
        );
      },
    );
  }

  // void showCustomSnackbar(String title,
  //     {Color? color, bool? isError, int? duration}) {
  //   Get.snackbar(title, "",
  //       duration: Duration(seconds: duration ?? 5),
  //       colorText: Colors.white,
  //       titleText: Text(title,
  //           style: AppTextStyles.semiBold14.copyWith(color: Colors.white)),
  //       messageText: const SizedBox(),
  //       padding: const EdgeInsets.only(bottom: 8, top: 14),
  //       backgroundColor: color ?? AppColors.colorOrange500,
  //       margin: const EdgeInsets.only(top: 4, left: 16, right: 16),
  //       icon: const Padding(
  //         padding: EdgeInsets.only(bottom: 14.0, top: 14),
  //         child: Icon(Icons.info, color: Colors.white),
  //       ));
  // }

  void logging(message) {
    if (kDebugMode) {
      print(message);
    }
  }

  //digunakan untuk log error di layar maupun di firebase crashlytic
  void logError(message) {
    if (kDebugMode) {
      print(message);
    } else {
      //print to crashlytic
    }
  }
}
