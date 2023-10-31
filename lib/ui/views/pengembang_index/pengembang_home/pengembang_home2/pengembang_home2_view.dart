import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../pengembang_home_view.dart';
import './pengembang_home2_view_model.dart';

class PengembangHome2View extends StatelessWidget {
  const PengembangHome2View({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengembangHome2ViewModel>.reactive(
      viewModelBuilder: () => PengembangHome2ViewModel(),
      onViewModelReady: (PengembangHome2ViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PengembangHome2ViewModel model,
        Widget? child,
      ) {
        return const PengembangHomeView();
      },
    );
  }
}
