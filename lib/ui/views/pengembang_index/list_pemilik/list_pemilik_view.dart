import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../widgets/top_container.dart';
import './list_pemilik_view_model.dart';

class ListPemilikView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListPemilikViewModel>.reactive(
      viewModelBuilder: () => ListPemilikViewModel(),
      onModelReady: (ListPemilikViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ListPemilikViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTopWidget(
                      icon: Icons.person_outline,
                      title: 'Jumlah Pemilik',
                      subtitle: '10 Pemilik',
                      lastUpdate: '31/02/15 - 10.00 am',
                    ),
                    MyTopWidget(
                      icon: Icons.home,
                      title: 'Pembangunan',
                      subtitle: '76 kali',
                      lastUpdate: '31/02/15 - 10.00 am',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
