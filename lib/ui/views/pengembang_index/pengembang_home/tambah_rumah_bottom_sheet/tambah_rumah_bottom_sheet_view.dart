import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_textformfield.dart';
import './tambah_rumah_bottom_sheet_view_model.dart';

class TambahRumahBottomSheetView extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const TambahRumahBottomSheetView({Key? key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TambahRumahBottomSheetViewModel>.reactive(
      viewModelBuilder: () => TambahRumahBottomSheetViewModel(),
      onViewModelReady: (TambahRumahBottomSheetViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TambahRumahBottomSheetViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(
                  20,
                ),
              ),
            ),
            child: Form(
              key: model.globalKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        '${request!.title!} ${request!.data.toString().toUpperCase()}',
                        style: regularTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      labelText: 'Nama Pemilik Rumah',
                      hintText: 'Masukkan Nama Pemilik Rumah',
                      suffixIcon: const Icon(
                        Icons.person,
                        color: mainColor,
                      ),
                      validator: Validatorless.required(
                          'Nama Pemilik Rumah Tidak Boleh Kosong'),
                      controller: model.namaPemilikRumahController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      labelText: 'No. Telp',
                      hintText: 'Masukkan No. Telp',
                      suffixIcon: const Icon(
                        Icons.phone,
                        color: mainColor,
                      ),
                      keyboardType: TextInputType.number,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('No. Telp Tidak Boleh Kosong'),
                          Validatorless.number('No. Telp Harus Angka'),
                          Validatorless.min(9, 'No. Telp Minimal 10 Angka'),
                          Validatorless.max(13, 'No. Telp Maksimal 13 Angka'),
                        ],
                      ),
                      controller: model.noHpPemilikRumahController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      labelText: 'Harga Rumah',
                      hintText: 'Masukkan Harga Rumah',
                      keyboardType: TextInputType.number,
                      suffixIcon: const Icon(
                        Icons.attach_money,
                        color: mainColor,
                      ),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                              'Harga Rumah Tidak Boleh Kosong'),
                          Validatorless.number('Harga Rumah Harus Angka'),
                        ],
                      ),
                      controller: model.hargaRumahController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      labelText: 'Cicilan / Bulan',
                      hintText: 'Masukkan Cicilan / Bulan',
                      keyboardType: TextInputType.number,
                      suffixIcon: const Icon(
                        Icons.attach_money,
                        color: mainColor,
                      ),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                              'Cicilan / Bulan Tidak Boleh Kosong'),
                          Validatorless.number('Cicilan / Bulan Harus Angka'),
                        ],
                      ),
                      controller: model.bayarPerbulanController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      hintText: "Tanggal Pembelian",
                      labelText: "Tanggal Pembelian",
                      suffixIcon: const Icon(
                        Icons.date_range,
                        color: mainColor,
                      ),
                      readOnly: true,
                      controller: model.tglBeliController,
                      onTap: () async {
                        DateTime? dateTime = await showOmniDateTimePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1600)
                              .subtract(const Duration(days: 3652)),
                          lastDate: DateTime.now().add(
                            const Duration(days: 3652),
                          ),
                          is24HourMode: false,
                          isShowSeconds: false,
                          minutesInterval: 1,
                          secondsInterval: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            maxHeight: 650,
                          ),
                          transitionBuilder: (context, anim1, anim2, child) {
                            return FadeTransition(
                              opacity: anim1.drive(
                                Tween(
                                  begin: 0,
                                  end: 1,
                                ),
                              ),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 200),
                          barrierDismissible: true,
                          selectableDayPredicate: (dateTime) {
                            // Disable 25th Feb 2023
                            if (dateTime == DateTime(2023, 2, 25)) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                        );
                        model.log.i(dateTime);
                        if (dateTime != null) {
                          model.tglBeliController.text = model.myFunction
                              .convertDateTime(dateTime.toString());
                          model.dateTime = dateTime.toString();
                        }
                        model.notifyListeners();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: 250,
                        child: MyButton(
                          text: 'Tambah',
                          onPressed: () {
                            if (model.globalKey.currentState!.validate()) {
                              model.dialogService
                                  .showDialog(
                                title: 'Tambah Pemilik Rumah',
                                description:
                                    'Apakah anda yakin ingin menambahkan pemilik rumah ${request!.data.toString().toUpperCase()} ini?',
                                buttonTitle: 'Ya',
                                cancelTitle: 'Tidak',
                              )
                                  .then((value) async {
                                if (value!.confirmed) {
                                  // model.log.i(request!.data);
                                  bool res = await model
                                      .tambahRumah(request!.data.toString());
                                  model.log.i('res: $res');
                                  if (res == true) {
                                    completer!(SheetResponse(
                                      confirmed: true,
                                      data: request!.data,
                                    ));
                                  }
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
