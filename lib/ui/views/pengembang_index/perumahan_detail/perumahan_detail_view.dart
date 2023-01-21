import 'package:flutter/material.dart';
import 'package:perumahan/app/themes/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_text.dart';
import './perumahan_detail_view_model.dart';

class PerumahanDetailView extends StatelessWidget {
  const PerumahanDetailView({super.key, required this.idPerumahan});

  final String idPerumahan;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PerumahanDetailViewModel>.reactive(
      viewModelBuilder: () => PerumahanDetailViewModel(),
      onModelReady: (PerumahanDetailViewModel model) async {
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'http://kicap-karan.com/assets/img/me.jpg',
                            ),
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) {
                              model.log.e('Error: $exception');
                            },
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Kicap Karan',
                        style: boldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _FirstDetail(),
                    SizedBox(
                      height: 15,
                    ),
                    _FirstDetail(),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
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
                          padding: EdgeInsets.symmetric(
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      model.coba();
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FirstDetail extends StatelessWidget {
  const _FirstDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.maps_home_work_outlined,
            color: mainColor,
            size: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Jln 2, Blok C, No 2',
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
