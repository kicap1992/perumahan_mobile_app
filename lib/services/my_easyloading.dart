import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyEasyLoading {
  showLoading() {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
  }

  dismiss() {
    EasyLoading.dismiss();
  }

  customLoading(String message) {
    EasyLoading.show(
      status: message,
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
  }

  showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  showError(String message) {
    EasyLoading.showError(message);
  }

  showInfo(String message) {
    EasyLoading.showInfo(message);
  }

  showProgress(double progress, String status) {
    EasyLoading.showProgress(progress, status: status);
  }
}
