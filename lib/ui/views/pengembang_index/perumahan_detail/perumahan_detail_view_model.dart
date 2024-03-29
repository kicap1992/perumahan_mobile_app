import 'package:url_launcher/url_launcher.dart';

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
      data: {
        'idPerumahan': idPerumahan,
      },
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

  checkProgress(ProgressModel progressModel) async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.tambahLihatProgressBottomSheetView,
      title: 'Lihat Progress',
      data: {
        'idPerumahan': idPerumahan,
        'progressModel': progressModel,
      },
    );
  }

  openWhatsapp() async {
    // open whatsapp using url
    String noTelpon = rumahModel!.noTelpon!;
    // convert the number to international format
    noTelpon = noTelpon.replaceAll(RegExp(r'[^0-9]'), '');
    noTelpon = '62${noTelpon.substring(1)}';

    log.i('no_telpon: $noTelpon');
    final url = Uri.parse('https://wa.me/$noTelpon');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  call() async {
    final Uri callUri = Uri(scheme: 'tel', path: rumahModel!.noTelpon!);
    if (!await launchUrl(callUri)) {
      throw 'Could not launch ${callUri.toString()}';
    }
  }
}
