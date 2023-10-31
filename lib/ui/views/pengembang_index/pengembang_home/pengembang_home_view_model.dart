import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';

class PengembangHomeViewModel extends CustomBaseViewModel {
  final log = getLogger('PengembangHomeViewModel');

  late String url;
  late String level;

  late WebViewController webVIewcontroller;
  final Completer<WebViewController> webViewControllerCompleter =
      Completer<WebViewController>();

  Future<void> init() async {
    globalVar.backPressed = "exitApp";
    url = dotenv.env['url']!;
    log.d(url);
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    level = await mySharedPrefs.getString('level') ?? '';
    log.d('level: $level');
    if (level == '') {
      navigationService.clearTillFirstAndShow(Routes.loginScreenView);
    }
  }

  goToDetail(String message) async {
    setBusy(true);
    easyLoading.customLoading('Loading...');
    try {
      var response = await httpService.get('cek_rumah?id=$message');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      log.i('myResponseModel: ${myResponseModel.res}');
      if (myResponseModel.res == true) {
        navigationService.navigateTo(
          '/perumahan-detail-view',
          arguments: PerumahanDetailViewArguments(idPerumahan: message),
        );
      } else {
        // easyLoading.showError('Data tidak ditemukan');
        easyLoading.dismiss();
        if (level == 'Mandor') {
          snackbarService.showSnackbar(
            message: 'Data Rumah Belum Ada',
            title: 'Gagal',
            duration: const Duration(seconds: 2),
          );
          return;
        }
        var res = await bottomSheetService.showCustomSheet(
          variant: BottomSheetType.tambahRumahBottomSheetView,
          title: 'Form Tambah Pemilik Rumah',
          data: message,
        );
        // res;

        if (res!.confirmed) {
          webVIewcontroller.reload();
          snackbarService.showSnackbar(
            message:
                'Pemilik Rumah ${res.data.toString().toUpperCase()} berhasil ditambahkan',
            title: 'Berhasil',
            duration: const Duration(seconds: 2),
          );
        }
      }
    } catch (e) {
      log.e(e.toString());
    } finally {
      setBusy(false);
      easyLoading.dismiss();
    }
  }
}
