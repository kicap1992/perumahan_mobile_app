import 'package:perumahan/app/core/custom_base_view_model.dart';

import '../../../app/app.router.dart';

class LoginScreenViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  void goToUserIndex() {
    navigationService.navigateTo(Routes.userIndexView);
  }

  void goToPengembangIndex() {
    navigationService.navigateTo(Routes.pengembangIndexView);
  }
}
