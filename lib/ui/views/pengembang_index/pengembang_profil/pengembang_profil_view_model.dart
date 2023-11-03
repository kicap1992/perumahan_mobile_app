import 'package:perumahan_bew/model/my_response_model.dart';
import 'package:perumahan_bew/model/rumah_model.dart';

import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class PengembangProfilViewModel extends CustomBaseViewModel {
  final log = getLogger('PengembangProfilViewModel');
  String? level;
  String? id;
  MandorModel? mandorModel;

  Future<void> init() async {
    level = await mySharedPrefs.getString('level');
    id = await mySharedPrefs.getString('id');
    log.i('level: $level');

    if (level == 'Mandor') {
      await getData();
    }
    notifyListeners();
  }

  getData() async {
    setBusy(true);
    try {
      var response = await httpService.get('mandor?id=$id');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      mandorModel = MandorModel.fromJson(myResponseModel.data);
      log.i('mandorModel: ${mandorModel!.nama}');
    } catch (e) {
      log.e('Error: $e');
    } finally {
      setBusy(false);
    }
  }
}
