import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../app/app.router.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import './pengembang_index_view_model.dart';

class PengembangIndexView extends StatelessWidget {
  const PengembangIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengembangIndexViewModel>.reactive(
      viewModelBuilder: () => PengembangIndexViewModel(),
      onModelReady: (PengembangIndexViewModel model) async {
        await model.init();
      },
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      builder: (
        BuildContext context,
        PengembangIndexViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              model.header,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: ExtendedNavigator(
            navigatorKey: StackedService.nestedNavigationKey(3),
            router: PengembangIndexViewRouter(),
          ),
          bottomNavigationBar: StylishBottomBar(
            items: [
              for (var item in model.bottomNavBarList)
                BubbleBarItem(
                  icon: Icon(item['icon'],
                      color: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? mainColor
                          : backgroundColor),
                  title: Text(
                    item['name'],
                    style: regularTextStyle.copyWith(
                      color: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? mainColor
                          : Colors.grey,
                    ),
                  ),
                  backgroundColor:
                      model.currentIndex == model.bottomNavBarList.indexOf(item)
                          ? Colors.white
                          : Colors.grey,
                ),
            ],
            currentIndex: model.currentIndex,
            barAnimation: BarAnimation.liquid,
            iconStyle: IconStyle.animated,
            hasNotch: true,
            backgroundColor: mainColor,
            onTap: (value) {
              model.handleNavigation(value!);
            },
            // fabLocation: StylishBarFabLocation.center,
          ),
        );
      },
    );
  }
}
