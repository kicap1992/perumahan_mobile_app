import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../widgets/top_container.dart';
import './user_list_pembangunan_view_model.dart';

class UserListPembangunanView extends StatelessWidget {
  const UserListPembangunanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserListPembangunanViewModel>.reactive(
      viewModelBuilder: () => UserListPembangunanViewModel(),
      onViewModelReady: (UserListPembangunanViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UserListPembangunanViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTopWidget(
                  icon: Icons.list_alt_outlined,
                  title: 'Pembangunan',
                  subtitle:
                      '${model.listProgress != null ? model.listProgress!.length : 0} Progress',
                  // lastUpdate: '31/02/15 - 10.00 am',
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
                          : model.status == false
                              ? const Center(child: Text('Error Loading Data'))
                              : model.listProgress!.isEmpty
                                  ? const Center(child: Text('Data Kosong'))
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      itemCount: model.listProgress!.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: ListTile(
                                            title: Text(
                                              model.listProgress![index]
                                                  .createdAt!,
                                              style: boldTextStyle.copyWith(
                                                fontSize: 13,
                                                color: mainColor,
                                              ),
                                            ),
                                            subtitle: Text(model
                                                .listProgress![index].ket!),
                                            // create icon show
                                            trailing: CircleAvatar(
                                              backgroundColor: mainColor,
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.list_alt_outlined,
                                                  color: backgroundColor,
                                                ),
                                                onPressed: () {
                                                  model.checkProgress(model
                                                      .listProgress![index]);
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
