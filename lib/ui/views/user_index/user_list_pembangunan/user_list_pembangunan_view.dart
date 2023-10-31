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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTopWidget(
                      icon: Icons.list_alt_outlined,
                      title: 'Pembangunan',
                      subtitle: '15 kali',
                      // lastUpdate: '31/02/15 - 10.00 am',
                    ),
                    MyTopWidget(
                      icon: Icons.home,
                      title: 'Progress',
                      subtitle: '76 %',
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
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Card(
                            child: GestureDetector(
                              onTap: () {
                                model.log.i('Card $index tapped');
                              },
                              child: ListTile(
                                title: Text('1/02/15 - 10.00 am',
                                    style: boldTextStyle.copyWith(
                                        fontSize: 13, color: mainColor)),
                                subtitle: Text('Progress $index'),
                                trailing: Text('Pembangunan $index'),
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
