import 'package:perumahan/app/core/custom_base_view_model.dart';

import '../../../../app/app.logger.dart';

class UserProfileViewModel extends CustomBaseViewModel {
  final log = getLogger('UserProfileViewModel');

  Future<void> init() async {}

  logout() {
    log.i('logout');
    navigationService.pushNamedAndRemoveUntil('/login-screen-view');
  }
}
