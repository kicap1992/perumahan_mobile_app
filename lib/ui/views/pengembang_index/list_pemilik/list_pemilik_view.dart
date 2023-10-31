import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../widgets/top_container.dart';
import './list_pemilik_view_model.dart';

class ListPemilikView extends StatelessWidget {
  const ListPemilikView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListPemilikViewModel>.reactive(
      viewModelBuilder: () => ListPemilikViewModel(),
      onViewModelReady: (ListPemilikViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ListPemilikViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              // model.log.i('backPressed: ${model.globalVar.backPressed}');
              if (model.globalVar.backPressed == 'exitApp') {
                // model.back();
                model.quitApp(context);
              }
              return false;
            },
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTopWidget(
                        icon: Icons.person_outline,
                        title: 'Jumlah Pemilik',
                        subtitle: model.isBusy
                            ? 'Loading...'
                            : model.status
                                ? '${model.counterPemilik} Pemilik'
                                : 'Error Loading Data',
                        // lastUpdate: '31/02/15 - 10.00 am',
                      ),
                      MyTopWidget(
                        icon: Icons.home,
                        subtitle: model.isBusy
                            ? 'Loading...'
                            : model.status
                                ? '${model.counterPembangunan} kali'
                                : 'Error Loading Data',
                        title: 'Pembangunan',
                        // lastUpdate: '31/02/15 - 10.00 am',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          ? const Center(child: CircularProgressIndicator())
                          : model.status
                              ? (model.counterPembangunan > 0
                                  ? ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      itemCount: model.listProgress.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: GestureDetector(
                                            onTap: () {
                                              model.log.i('Card $index tapped');
                                            },
                                            child: ListTile(
                                              title: Text(
                                                  model.listProgress[index]
                                                          .createdAt ??
                                                      '',
                                                  style: boldTextStyle.copyWith(
                                                      fontSize: 13,
                                                      color: mainColor)),
                                              //
                                              subtitle: Text(model
                                                      .listProgress[index]
                                                      .ket ??
                                                  ''),
                                              trailing: Text(
                                                  'Rumah ${model.listProgress[index].idRumah!.toUpperCase()}'),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : const Center(
                                      child:
                                          Text('Tidak ada data Pembangunana'),
                                    ))
                              : const Center(
                                  child: Text('Error Loading Data'),
                                ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
