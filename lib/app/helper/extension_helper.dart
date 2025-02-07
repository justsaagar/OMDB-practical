import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SnackBar on String {
  void logs() {
    if (kDebugMode) {
      print(this);
    }
  }

  showError() => Get.snackbar('error'.tr, this, backgroundColor: Colors.red, colorText: Colors.white);

  showSuccess() => Get.snackbar('success'.tr, this, backgroundColor: Colors.green, colorText: Colors.white);
}
