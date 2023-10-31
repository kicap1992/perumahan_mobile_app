import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class UserIndexViewModel extends IndexTrackingViewModel {
  final log = getLogger('UserIndexViewModel');
  final _navigationService = locator<NavigationService>();

  final _bottomNavBarList = [
    {
      'name': 'List',
      'icon': Icons.list_alt_rounded,
      'header': 'List Perumahan'
    },
    {'name': 'Denah', 'icon': Icons.home_outlined, 'header': 'Denah Perumahan'},
    {'name': 'Profil', 'icon': Icons.person_outline, 'header': 'Profil'},
  ];
  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    UserIndexViewRoutes.userListPembangunanView,
    UserIndexViewRoutes.userHomeView,
    UserIndexViewRoutes.userProfileView,
  ];

  String header = 'Denah Perumahan';

  Future<void> init() async {
    setIndex(1);
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: ${_views[index]}");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 2,
    );
  }
}
