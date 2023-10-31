import 'package:flutter/material.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:perumahan_bew/app/themes/app_text.dart';
import 'package:perumahan_bew/ui/widgets/my_button.dart';
import 'package:perumahan_bew/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../app/themes/app_colors.dart';
import './tambah_lihat_progress_bottom_sheet_view_model.dart';

class TambahLihatProgressBottomSheetView extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const TambahLihatProgressBottomSheetView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TambahLihatProgressBottomSheetViewModel>.reactive(
      viewModelBuilder: () => TambahLihatProgressBottomSheetViewModel(),
      onViewModelReady: (TambahLihatProgressBottomSheetViewModel model) async {
        await model.init(request!.data);
      },
      builder: (
        BuildContext context,
        TambahLihatProgressBottomSheetViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          // if
          onWillPop: () async {
            if (model.globalVar.backPressed == 'exitApp') {
              // model.back();
              // model.quitApp(context);
              model.nativeVideoPlayerController?.pause();
              model.nativeVideoPlayerController?.removeListener(() {
                // model.nativeVideoPlayerController?.dispose();
                model.nativeVideoPlayerController = null;
              });
              model.nativeVideoPlayerController = null;
              return true;
            }
            return false;
            // stop playing video
          },
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: model.globalKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '${request!.title!} ${request!.data.toString().toUpperCase()}',
                          style: boldTextStyle,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              // clipBehavior: Clip.none,
                              height: 100,
                              width: 150,
                              padding: const EdgeInsets.all(2),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: model.imageVideoBytes != null
                                  ? (model.imageVideoType == 'image'
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: GestureDetector(
                                            onTap: () =>
                                                model.showImage(context),
                                            child: Image.memory(
                                              model.imageVideoBytes!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: AspectRatio(
                                            aspectRatio: 16 / 11,
                                            child: NativeVideoPlayerView(
                                              onViewReady: (controller) async {
                                                final videoSource =
                                                    await VideoSource.init(
                                                  path: model.imageVideoPath!,
                                                  type: VideoSourceType.file,
                                                );
                                                await controller
                                                    .loadVideoSource(
                                                        videoSource);
                                                model.nativeVideoPlayerController =
                                                    controller;
                                                model.notifyListeners();
                                                model
                                                    .nativeVideoPlayerController!
                                                    .play();
                                                // loop video
                                                model
                                                    .nativeVideoPlayerController!
                                                    .onPlaybackEnded
                                                    .addListener(() {
                                                  model
                                                      .nativeVideoPlayerController!
                                                      .seekTo(0);
                                                  model
                                                      .nativeVideoPlayerController!
                                                      .play();
                                                });
                                              },
                                            ),
                                          ),
                                        ))
                                  : const Icon(
                                      Icons.credit_card_rounded,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: sixthGrey,
                                child: IconButton(
                                  onPressed: () {
                                    model.pilihImageVideo();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: backgroundColor3,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyTextFormField(
                        maxLines: 5,
                        hintText: 'Masukkan Keterangan',
                        labelText: 'Keterangan',
                        controller: model.ketController,
                        validator:
                            Validatorless.required('Keterangan harus diisi'),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: 250,
                          child: MyButton(
                            text: 'Tambah Progress',
                            onPressed: () {
                              if (model.imageVideoBytes == null) {
                                model.snackbarService.showSnackbar(
                                  message: 'Gambar/video harus diisi',
                                );
                                model.pilihImageVideo();
                                return;
                              }

                              if (model.globalKey.currentState!.validate()) {
                                model.dialogService
                                    .showDialog(
                                  title: 'Tambah Progress',
                                  description: 'Apakah anda yakin?',
                                  buttonTitle: 'Ya',
                                  cancelTitle: 'Tidak',
                                )
                                    .then((value) async {
                                  if (value!.confirmed) {
                                    // stop playing video
                                    model.nativeVideoPlayerController?.pause();
                                    model.nativeVideoPlayerController
                                        ?.removeListener(() {
                                      // model.nativeVideoPlayerController?.dispose();
                                      model.nativeVideoPlayerController = null;
                                    });
                                    model.nativeVideoPlayerController = null;

                                    // add progress
                                    bool res = await model.tambahProgress();
                                    model.log.i('res: $res');
                                    completer!(SheetResponse(
                                      confirmed: true,
                                    ));
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
          ),
        );
      },
    );
  }
}
