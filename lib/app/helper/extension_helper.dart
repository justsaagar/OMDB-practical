import 'package:flutter/foundation.dart';

extension SnackBar on String {
  void logs() {
    if (kDebugMode) {
      print(this);
    }
  }
}
