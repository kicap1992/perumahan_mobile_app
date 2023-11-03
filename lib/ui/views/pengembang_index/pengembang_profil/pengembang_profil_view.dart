import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './pengembang_profil_view_model.dart';

class PengembangProfilView extends StatelessWidget {
  const PengembangProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PengembangProfilViewModel>.reactive(
      viewModelBuilder: () => PengembangProfilViewModel(),
      onViewModelReady: (PengembangProfilViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PengembangProfilViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                      color: backgroundColor,
                                      size: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (model.level == 'Mandor' &&
                          model.mandorModel != null &&
                          !model.isBusy)
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            _FirstDetail(
                              text: model.mandorModel!.nama!,
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 20),
                            _FirstDetail(
                              text: model.mandorModel!.noTelpon!,
                              icon: Icons.phone,
                            ),
                          ],
                        ),
                      if (model.level != null && model.level == 'Admin')
                        const Column(
                          children: [
                            SizedBox(height: 20),
                            _FirstDetail(
                              text: 'Admin',
                              icon: Icons.person,
                            ),
                            SizedBox(height: 20),
                            _FirstDetail(
                              text:
                                  'Perumahan Mutiara Alga, Kecamatan Suppa, Kabupaten Pinrang, Sulawesi Selatan, 91131',
                              icon: Icons.phone,
                            ),
                          ],
                        ),
                      if (model.isBusy)
                        const Column(
                          children: [
                            SizedBox(height: 20),
                            Center(child: CircularProgressIndicator()),
                          ],
                        ),
                    ],
                  ),
                ),

                // create rounded edit button at top right
                Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: mainColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: backgroundColor,
                        size: 15,
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
          Expanded(
            child: Text(
              text,
              style: regularTextStyle.copyWith(
                fontSize: 15,
                color: mainGrey,
              ),
            ),
          ),
          // created edit button
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.edit,
          //         color: mainColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
