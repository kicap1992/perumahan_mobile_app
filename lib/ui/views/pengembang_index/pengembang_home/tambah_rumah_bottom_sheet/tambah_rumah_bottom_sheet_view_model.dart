import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class TambahRumahBottomSheetViewModel extends CustomBaseViewModel {
  final log = getLogger('TambahRumahBottomSheetViewModel');

  // form variables
  final globalKey = GlobalKey<FormState>();
  TextEditingController namaPemilikRumahController = TextEditingController();
  TextEditingController noHpPemilikRumahController = TextEditingController();
  TextEditingController hargaRumahController = TextEditingController();
  TextEditingController bayarPerbulanController = TextEditingController();
  TextEditingController tglBeliController = TextEditingController();
  String? dateTime;

  Future<void> init() async {}

  Future<bool> tambahRumah(String idPerumahan) async {
    setBusy(true);
    easyLoading.customLoading('Tambah Pemilik Rumah...');
    try {
      String harga =
          myFunction.numberFormat(int.parse(hargaRumahController.text));
      String cicilan =
          myFunction.numberFormat(int.parse(bayarPerbulanController.text));
      // log.i(myFunction.numberFormat(int.parse(hargaRumahController.text)));
      var formData = FormData.fromMap({
        'id_rumah': idPerumahan,
        'nama': namaPemilikRumahController.text,
        'no_hp': noHpPemilikRumahController.text,
        'harga': harga,
        'cicilan': cicilan,
        'tanggal_pembelian': dateTime,
      });
      // log.i(hargaRumahController.text);
      // log.i(bayarPerbulanController.text);
      await httpService.postWithFormData(
        'rumahnya',
        formData,
      );

      return true;
    } catch (e) {
      log.e(e.toString());
      return false;
    } finally {
      setBusy(false);
      easyLoading.dismiss();
    }
  }
}
