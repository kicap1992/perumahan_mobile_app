import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_easyloading.dart';

class PengembangHomeViewModel extends CustomBaseViewModel {
  final log = getLogger('PengembangHomeViewModel');
  final _myEasyLoading = locator<MyEasyLoading>();

  late String url;

  get myEasyLoading => _myEasyLoading;
  late WebViewController webVIewcontroller;
  final Completer<WebViewController> webViewControllerCompleter =
      Completer<WebViewController>();

  Future<void> init() async {
    url = dotenv.env['url']!;
    log.d(url);
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void goToDetail(String message) {
    navigationService.navigateTo(
      '/perumahan-detail-view',
      arguments: PerumahanDetailViewArguments(idPerumahan: message),
    );
  }
}
