import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/global_var.dart';
import '../../services/http_services.dart';
import '../../services/my_easyloading.dart';
import '../../services/other_function.dart';
import '../../services/shared_prefs.dart';
import '../app.locator.dart';
import '../themes/app_colors.dart';

class CustomBaseViewModel extends BaseViewModel {
  final dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final bottomSheetService = locator<BottomSheetService>();
  final snackbarService = locator<SnackbarService>();
  final mySharedPrefs = locator<MySharedPrefs>();
  final easyLoading = locator<MyEasyLoading>();
  final httpService = locator<MyHttpServices>();
  final globalVar = locator<GlobalVar>();
  final myFunction = locator<MyFunction>();

  void back() {
    navigationService.back();
  }

  quitApp(BuildContext context) {
    // globalVar.backPressed = 'cantBack';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () {
                globalVar.backPressed = 'exitApp';
                Navigator.of(context).pop(false);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Keluar',
                style: TextStyle(color: dangerColor),
              ),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        SystemNavigator.pop();
      }
    });
  }
}
