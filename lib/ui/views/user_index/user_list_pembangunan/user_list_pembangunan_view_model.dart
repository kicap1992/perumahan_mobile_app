import 'package:perumahan_bew/model/rumah_model.dart';

import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';

class UserListPembangunanViewModel extends CustomBaseViewModel {
  final log = getLogger('UserListPembangunanViewModel');
  bool status = false;
  RumahDetailModel? rumahDetailModel;
  RumahModel? rumahModel;
  List<ProgressModel>? listProgress;

  Future<void> init() async {
    String idRumah = await mySharedPrefs.getString('id') ?? '';

    if (idRumah.isNotEmpty) {
      await getData(idRumah);
    }
  }

  getData(String idRumah) async {
    setBusy(true);
    try {
      var response = await httpService.get('rumah?id=$idRumah');
      MyResponseModel myResponse = MyResponseModel.fromJson(response.data);
      // log.i(myResponse.toJson());
      RumahDetailModel rumahDetailModel =
          RumahDetailModel.fromJson(myResponse.data);
      listProgress = rumahDetailModel.progressModel;

      status = true;
    } catch (e) {
      status = false;
      log.e(e);
    } finally {
      setBusy(false);
    }
  }

  checkProgress(ProgressModel progressModel) async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.tambahLihatProgressBottomSheetView,
      title: 'Lihat Progress',
      data: {
        'idPerumahan': progressModel.idRumah,
        'progressModel': progressModel,
      },
    );
  }
}
