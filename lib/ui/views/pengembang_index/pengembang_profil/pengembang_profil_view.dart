import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './pengembang_profil_view_model.dart';

class PengembangProfilView extends StatelessWidget {
  const PengembangProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengembangProfilViewModel>.reactive(
      viewModelBuilder: () => PengembangProfilViewModel(),
      onViewModelReady: (PengembangProfilViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PengembangProfilViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'PengembangProfilView',
            ),
          ),
        );
      },
    );
  }
}
