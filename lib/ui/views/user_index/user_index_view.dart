import 'package:flutter/material.dart';
import 'package:perumahan_bew/app/app.router.dart';
import 'package:perumahan_bew/app/themes/app_colors.dart';
import 'package:perumahan_bew/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import './user_index_view_model.dart';

class UserIndexView extends StatelessWidget {
  const UserIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserIndexViewModel>.reactive(
      viewModelBuilder: () => UserIndexViewModel(),
      onViewModelReady: (UserIndexViewModel model) async {
        await model.init();
      },
      disposeViewModel: false,
      fireOnViewModelReadyOnce: true,
      builder: (
        BuildContext context,
        UserIndexViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              model.header,
              style: boldTextStyle.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          // extendBody: true,
          body: ExtendedNavigator(
            navigatorKey: StackedService.nestedNavigationKey(2),
            router: UserIndexViewRouter(),
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
