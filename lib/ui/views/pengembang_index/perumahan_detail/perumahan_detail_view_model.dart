import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/rumah_model.dart';

class PerumahanDetailViewModel extends CustomBaseViewModel {
  final log = getLogger('PerumahanDetailViewModel');
  late String idPerumahan;
  late String blok;
  late String idRumah;
  late String level;

  bool status = false;

  RumahModel? rumahModel;
  List<ProgressModel>? progressModel;

  Future<void> init(String idPerumahan) async {
    level = await mySharedPrefs.getString('level') ?? '';
    if (level == '') {
      navigationService.clearTillFirstAndShow(Routes.loginScreenView);
    }
    this.idPerumahan = idPerumahan;
    // globalVar.backPressed = "backNormal";
    // setBusy(true);
    // seperate the number from the string
    blok = idPerumahan.replaceAll(RegExp(r'[0-9]'), '');
    // change the blok to uppercase
    blok = blok.toUpperCase();
    // log.i('blok: $blok');
    idRumah = idPerumahan.replaceAll(RegExp(r'[^0-9]'), '');
    // log.i('idRumah: $idRumah');
    await getData();
    // setBusy(false);
  }

  getData() async {
    setBusy(true);

    try {
      var respose = await httpService.get('rumah?id=$idPerumahan');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(respose.data);
      RumahDetailModel rumahDetailModel =
          RumahDetailModel.fromJson(myResponseModel.data);
      rumahModel = rumahDetailModel.rumahModel!;
      progressModel = rumahDetailModel.progressModel!;
      log.i('rumahModel: ${rumahModel!.img}');
      status = true;
    } catch (e) {
      log.e('Error: $e');
      status = false;
    } finally {
      setBusy(false);
    }
  }

  ambilGambarVideo() async {
    var res = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.tambahLihatProgressBottomSheetView,
      title: 'Form Tambah Progress',
      data: idPerumahan,
    );

    if (res!.confirmed) {
      snackbarService.showSnackbar(
        message: 'Berhasil menambah progress',
        title: 'Berhasil',
        duration: const Duration(seconds: 2),
      );
      await getData();
    }
  }
}
