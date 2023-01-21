import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perumahan/ui/widgets/my_button.dart';
import 'package:perumahan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';

import '../../../app/themes/app_text.dart';
import './login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      viewModelBuilder: () => LoginScreenViewModel(),
      onModelReady: (LoginScreenViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginScreenViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MyTextFormField(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MyTextFormField(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: MyButton(
                      text: "LOGIN",
                      onPressed: () {
                        // model.goToUserIndex();
                        model.goToPengembangIndex();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
