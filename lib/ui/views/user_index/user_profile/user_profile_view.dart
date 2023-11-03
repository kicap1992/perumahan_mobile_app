import 'package:flutter/material.dart';
import 'package:perumahan_bew/app/themes/app_colors.dart';
import 'package:perumahan_bew/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';

import './user_profile_view_model.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      viewModelBuilder: () => UserProfileViewModel(),
      onViewModelReady: (UserProfileViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UserProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // create a rounded container
                      Center(
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: fontParagraphColor,
                              // child: model.imageBytes == null
                              //     ? const Icon(
                              //         Icons.person,
                              //         size: 50,
                              //         color: Colors.white,
                              //       )
                              //     : ClipRRect(
                              //         borderRadius: BorderRadius.circular(50),
                              //         child: Image.memory(
                              //           model.imageBytes!,
                              //           width: 100,
                              //           height: 100,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       ),
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: mainColor,
                                child: IconButton(
                                    onPressed: () {
                                      // model.addImage();
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: fontColor,
                                      size: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!model.isBusy &&
                          model.status == true &&
                          model.rumahModel != null)
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              _DetailChild(
                                text: model.rumahModel!.pemilik!,
                                icon: Icons.person,
                              ),
                              _DetailChild(
                                text: model.rumahModel!.tanggalPembelian!,
                                icon: Icons.calendar_today_outlined,
                              ),
                              _DetailChild(
                                text: "Rp. ${model.rumahModel!.harga!}",
                                icon: Icons.attach_money_outlined,
                              ),
                              _DetailChild(
                                text: 'Rp. ${model.rumahModel!.cicilan!}',
                                icon: Icons.money_outlined,
                              ),
                            ],
                          ),
                        ),
                      if (model.isBusy)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ),
                  // create rounded button with edit on top right
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: mainColor,
                      child: IconButton(
                          onPressed: () {
                            // model.addImage();
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: fontColor,
                            size: 15,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DetailChild extends StatelessWidget {
  const _DetailChild({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
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
