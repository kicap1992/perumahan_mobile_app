import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perumahan_bew/ui/widgets/my_button.dart';
import 'package:perumahan_bew/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

import '../../../app/themes/app_text.dart';
import './login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      viewModelBuilder: () => LoginScreenViewModel(),
      onViewModelReady: (LoginScreenViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginScreenViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              // model.log.i('backPressed: ${model.globalVar.backPressed}');
              if (model.globalVar.backPressed == 'exitApp') {
                // model.back();
                model.quitApp(context);
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Text(
                        "Perumahan Mutiara Alga",
                        style: boldTextStyle.copyWith(
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SvgPicture.asset(
                        'assets/house.svg',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login Ke Akun Anda',
                        style: boldTextStyle.copyWith(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MyTextFormField(
                          hintText: "Masukkan Username",
                          labelText: "Username",
                          validator: Validatorless.required(
                              'Username tidak boleh kosong'),
                          controller: model.usernameController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MyTextFormField(
                          hintText: "Masukkan Password",
                          labelText: "Password",
                          obscureText: !model.isPasswordVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              model.isPasswordVisible =
                                  !model.isPasswordVisible;
                              model.notifyListeners();
                            },
                            icon: Icon(
                              model.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          validator: Validatorless.required(
                              'Password tidak boleh kosong'),
                          controller: model.passwordController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: MyButton(
                          text: "LOGIN",
                          onPressed: () {
                            if (model.formKey.currentState!.validate()) {
                              model.login();
                            }
                            // model.login();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
