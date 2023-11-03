import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perumahan_bew/app/themes/app_colors.dart';
import 'package:perumahan_bew/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';

import './splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (SplashScreenViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SplashScreenViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: mainColor,
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SvgPicture.asset(
                  'assets/house.svg',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'APLIKASI PERUMAHAN \nMUTIARA ALGA',
                  style: boldTextStyle.copyWith(
                    color: backgroundColor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'Kecamatan Suppa, \nKabupaten Pinrang,\nSulawesi Selatan,91131',
                  style: regularTextStyle.copyWith(
                    color: backgroundColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
