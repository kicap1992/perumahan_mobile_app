import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/rumah_model.dart';

class ListPemilikViewModel extends CustomBaseViewModel {
  final log = getLogger('ListPemilikViewModel');
  int counterPemilik = 0;
  int counterPembangunan = 0;
  List<ProgressModel> listProgress = [];

  bool status = false;
  String? level;
  String? id;

  Future<void> init() async {
    globalVar.backPressed = "exitApp";
    level = await mySharedPrefs.getString('level') ?? '';
    id = await mySharedPrefs.getString('id') ?? '';
    // log.i('level: $level');
    await getData();
  }

  getData() async {
    setBusy(true);
    try {
      var response = await httpService.get('pemilik');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      counterPemilik = myResponseModel.data.length;

      response = await httpService.get(
          'pembangunan?stat=${level == 'Mandor' ? 'mandor&id_mandor=$id' : 'all'}');
      myResponseModel = MyResponseModel.fromJson(response.data);
      counterPembangunan = myResponseModel.data.length;
      // log.i('myResponseModel: ${myResponseModel.data}');

      for (var item in myResponseModel.data) {
        ProgressModel progressModel = ProgressModel.fromJson(item);
        listProgress.add(progressModel);
      }
      // reverse the list
      listProgress = listProgress.reversed.toList();

      status = true;
    } catch (e) {
      log.e(e.toString());
      status = false;
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
