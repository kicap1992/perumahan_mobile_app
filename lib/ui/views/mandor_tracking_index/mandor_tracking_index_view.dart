import 'package:flutter/material.dart';
import 'package:perumahan_bew/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import './mandor_tracking_index_view_model.dart';

class MandorTrackingIndexView extends StatelessWidget {
  const MandorTrackingIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MandorTrackingIndexViewModel>.reactive(
      viewModelBuilder: () => MandorTrackingIndexViewModel(),
      onViewModelReady: (MandorTrackingIndexViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MandorTrackingIndexViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              model.header,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: ExtendedNavigator(
            navigatorKey: StackedService.nestedNavigationKey(4),
            router: MandorTrackingIndexViewRouter(),
          ),
          bottomNavigationBar: StylishBottomBar(
            items: [
              for (var item in model.bottomNavBarList)
                BottomBarItem(
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
            option: BubbleBarOptions(),
            hasNotch: true,
            backgroundColor: mainColor,
            onTap: (value) {
              model.handleNavigation(value);
            },
            // fabLocation: StylishBarFabLocation.center,
          ),
        );
      },
    );
  }
}
