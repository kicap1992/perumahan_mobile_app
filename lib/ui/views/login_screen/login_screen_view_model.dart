import 'package:flutter/material.dart';
import '../../../app/app.router.dart';

import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/login_model.dart';
import '../../../model/my_response_model.dart';

class LoginScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginScreenViewModel');

  // form variables
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> init() async {
    globalVar.backPressed = "exitApp";
  }

  login() async {
    log.i('login');
    setBusy(true);
    globalVar.backPressed = "cantBack";
    easyLoading.customLoading('Login...');
    try {
      String username = usernameController.text;
      String password = passwordController.text;
      var response =
          await httpService.get('login?username=$username&password=$password');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      log.i('myResponseModel: ${myResponseModel.data}');
      LoginDataModel loginDataModel =
          LoginDataModel.fromJson(myResponseModel.data);
      LoginDetailModel loginDetailModel = loginDataModel.value!;
      String level = loginDataModel.level!;
      log.i('level: $level');

      await mySharedPrefs.setString('level', level);
      await mySharedPrefs.setString(
          'id',
          level == 'Admin'
              ? "Admin"
              : (level == 'Mandor'
                  ? loginDetailModel.idMandor!
                  : loginDetailModel.idRumah!));
      easyLoading.dismiss();
      snackbarService.showSnackbar(
        title: 'Login berhasil',
        message: 'Selamat datang kembali',
        duration: const Duration(seconds: 3),
      );

      if (level == 'Admin') {
        navigationService.navigateToPengembangIndexView();
      } else if (level == 'Mandor') {
        navigationService.navigateToMandorTrackingIndexView();
      } else {
        navigationService.navigateToUserIndexView();
      }
    } catch (e) {
      log.e(e.toString());
    } finally {
      setBusy(false);
      globalVar.backPressed = "exitApp";
      easyLoading.dismiss();
    }
  }
}
