import 'package:flutter/material.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';

import '../exceptions/failures/failures.dart';

showError(ApiFailure fail, BuildContext context) {
  return fail.when(serverFailed: (s) {
    context.snackbar(s);
  }, timeout: () {
    context.snackbar("request TimeOut");
  }, internetOut: () {
    context.snackbar("InternetOut");
  }, invalidToken: () {
    context.snackbar("token failed");
  });
}
