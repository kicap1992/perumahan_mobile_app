import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class MandorTrackingIndexViewModel extends IndexTrackingViewModel {
  final log = getLogger('MandorTrackingIndexViewModel');
  final _navigationService = locator<NavigationService>();

  final _bottomNavBarList = [
    {'name': 'List', 'icon': Icons.list_alt_rounded, 'header': 'List Pemilik'},
    {'name': 'Denah', 'icon': Icons.home_outlined, 'header': 'Denah Perumahan'},
    {'name': 'Profil', 'icon': Icons.person_outline, 'header': 'Profil Mandor'},
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    MandorTrackingIndexViewRoutes.listPemilikView,
    MandorTrackingIndexViewRoutes.pengembangHome2View,
    MandorTrackingIndexViewRoutes.pengembangProfilView,
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
      id: 4,
    );
  }
}
