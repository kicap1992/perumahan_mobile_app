import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/http_services.dart';

class PerumahanDetailViewModel extends CustomBaseViewModel {
  final log = getLogger('PerumahanDetailViewModel');
  final _myHttpServices = locator<MyHttpServices>();
  late String blok;
  late String idRumah;

  Future<void> init(String idPerumahan) async {
    setBusy(true);
    // seperate the number from the string
    blok = idPerumahan.replaceAll(RegExp(r'[0-9]'), '');
    // change the blok to uppercase
    blok = blok.toUpperCase();
    log.i('blok: $blok');
    idRumah = idPerumahan.replaceAll(RegExp(r'[^0-9]'), '');
    log.i('idRumah: $idRumah');
    setBusy(false);
  }

  void coba() async {
    setBusy(true);
    final response = await _myHttpServices.get('');
    log.i(response);
    setBusy(false);
  }
}
