import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './perumahan_detail_view_model.dart';

class PerumahanDetailView extends StatelessWidget {
  const PerumahanDetailView({super.key, required this.idPerumahan});

  final String idPerumahan;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PerumahanDetailViewModel>.reactive(
      viewModelBuilder: () => PerumahanDetailViewModel(),
      onViewModelReady: (PerumahanDetailViewModel model) async {
        await model.init(idPerumahan);
      },
      builder: (
        BuildContext context,
        PerumahanDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Perumahan Blok ${model.blok} , No. ${model.idRumah}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: WillPopScope(
            onWillPop: () async {
              if (model.globalVar.backPressed == 'exitApp') {
                // model.back();
                return true;
                // model.quitApp(context);
              }
              return false;
            },
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: model.isBusy
                              ? const Padding(
                                  padding: EdgeInsets.all(30),
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                )
                              : model.status
                                  ? (model.rumahModel!.img == null
                                      ? const Icon(
                                          Icons.person,
                                          color: mainColor,
                                          size: 50,
                                        )
                                      : Image.network(
                                          model.rumahModel!.img!,
                                          fit: BoxFit.cover,
                                        ))
                                  : const Icon(
                                      Icons.error,
                                      color: dangerColor,
                                      size: 50,
                                    ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          model.isBusy
                              ? 'Loading...'
                              : model.status
                                  ? model.rumahModel!.pemilik!
                                  : 'Error Loading Data',
                          style: boldTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _FirstDetail(
                        text: model.isBusy
                            ? 'Loading...'
                            : model.status
                                ? model.rumahModel!.tanggalPembelian!
                                : 'Error Loading Data',
                        icon: Icons.calendar_today_outlined,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _FirstDetail(
                        text: model.isBusy
                            ? 'Loading...'
                            : model.status
                                ? 'Rp. ${model.rumahModel!.harga!}'
                                : 'Error Loading Data',
                        icon: Icons.attach_money_outlined,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _FirstDetail(
                        text: model.isBusy
                            ? 'Loading...'
                            : model.status
                                ? 'Rp. ${model.rumahModel!.cicilan!} / bulan'
                                : 'Error Loading Data',
                        icon: Icons.money_outlined,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _FirstDetail(
                        text: model.isBusy
                            ? 'Loading...'
                            : model.status
                                ? model.rumahModel!.noTelpon!
                                : 'Error Loading Data',
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                // offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          // create a listview with 20 dummy data on card and scrollable
                          child: model.isBusy
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                )
                              : model.progressModel!.isEmpty
                                  ? const Center(
                                      child: Text(
                                          'Data Kosong, Belum Ada Progress'),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      itemCount: model.progressModel!.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: GestureDetector(
                                            onTap: () {
                                              model.log.i('Card $index tapped');
                                            },
                                            child: ListTile(
                                              title: Text(
                                                  model.progressModel![index]
                                                      .createdAt!,
                                                  style: boldTextStyle.copyWith(
                                                      fontSize: 13,
                                                      color: mainColor)),
                                              subtitle: Text(model
                                                  .progressModel![index].ket!),
                                              trailing: Text(
                                                  'Pembangunan ${model.progressModel![index].no!}'),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (model.level == 'Mandor')
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          model.ambilGambarVideo();
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FirstDetail extends StatelessWidget {
  const _FirstDetail({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: mainColor,
            size: 40,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: regularTextStyle.copyWith(
              fontSize: 15,
              color: mainGrey,
            ),
          ),
        ],
      ),
    );
  }
}
