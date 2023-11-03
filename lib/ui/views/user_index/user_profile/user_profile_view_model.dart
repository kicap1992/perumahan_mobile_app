import 'package:perumahan_bew/app/core/custom_base_view_model.dart';

import '../../../../app/app.logger.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/rumah_model.dart';

class UserProfileViewModel extends CustomBaseViewModel {
  final log = getLogger('UserProfileViewModel');
  RumahDetailModel? rumahDetailModel;
  RumahModel? rumahModel;
  bool status = false;
  String? idRumah;

  Future<void> init() async {
    idRumah = await mySharedPrefs.getString('id') ?? '';
    if (idRumah != '') {
      await getData();
    }
    // await getData();
  }

  getData() async {
    setBusy(true);
    try {
      var response = await httpService.get('rumah?id=$idRumah');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      // log.i('myResponseModel: ${myResponseModel.data}');
      rumahDetailModel = RumahDetailModel.fromJson(myResponseModel.data);
      rumahModel = rumahDetailModel!.rumahModel;
      // rumahModel = RumahModel.fromJson(myResponseModel.data);
      log.i('rumahModel: ${rumahModel!.toJson()}');

      status = true;
    } catch (e) {
      log.e('Error: $e');
      status = false;
    } finally {
      setBusy(false);
    }
  }

  logout() {
    log.i('logout');
    navigationService.pushNamedAndRemoveUntil('/login-screen-view');
  }
}
