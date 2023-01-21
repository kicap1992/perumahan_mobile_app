import 'dart:async';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_easyloading.dart';

class UserHomeViewModel extends CustomBaseViewModel {
  final log = getLogger('UserHomeViewModel');
  final _myEasyLoading = locator<MyEasyLoading>();

  get myEasyLoading => _myEasyLoading;
  late WebViewController webVIewcontroller;
  final Completer<WebViewController> webViewControllerCompleter =
      Completer<WebViewController>();

  Future<void> init() async {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }
}
