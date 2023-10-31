import 'package:perumahan_bew/app/core/custom_base_view_model.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  Future<void> init() async {
    // await 3 seconds then go to login
    await Future.delayed(const Duration(seconds: 3));
    await navigationService.navigateTo(Routes.loginScreenView);
  }
}
