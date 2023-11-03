import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:perumahan_bew/app/themes/app_text.dart';
import 'package:perumahan_bew/ui/widgets/my_button.dart';
import 'package:perumahan_bew/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
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
                          '${request!.title!} ${request!.data['idPerumahan'].toString().toUpperCase()}',
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
                                            onTap: () => model.showImage(
                                                context, 'file', null),
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
                                  : (model.progressModel != null
                                      ? (model.imageVideoType == 'image'
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: GestureDetector(
                                                  onTap: () => model.showImage(
                                                      context,
                                                      'network',
                                                      dotenv.env['url']! +
                                                          model.progressModel!
                                                              .img!),
                                                  child: Image.network(
                                                    dotenv.env['url']! +
                                                        model.progressModel!
                                                            .img!,
                                                    fit: BoxFit.fill,
                                                  )),
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: AspectRatio(
                                                aspectRatio: 16 / 11,
                                                child: NativeVideoPlayerView(
                                                  onViewReady:
                                                      (controller) async {
                                                    final videoSource =
                                                        await VideoSource.init(
                                                      path: dotenv.env['url']! +
                                                          model.progressModel!
                                                              .img!,
                                                      type: VideoSourceType
                                                          .network,
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
                                        )),
                            ),
                            if (model.progressModel == null)
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
                            if (model.imageVideoType == 'video')
                              Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: sixthGrey,
                                    child: IconButton(
                                      onPressed: () {
                                        if (model.progressModel != null) {
                                          model.playVideo(
                                              'network',
                                              dotenv.env['url']! +
                                                  model.progressModel!.img!);
                                        } else {
                                          model.playVideo(
                                              'file', model.imageVideoPath);
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: backgroundColor3,
                                        size: 15,
                                      ),
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
                        readOnly: model.progressModel != null,
                      ),
                      const SizedBox(height: 20),
                      if (model.progressModel != null)
                        MyTextFormField(
                          labelText: 'Waktu',
                          controller: model.waktuController,
                          readOnly: true,
                        ),
                      if (model.progressModel == null)
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
                                      model.nativeVideoPlayerController
                                          ?.pause();
                                      model.nativeVideoPlayerController
                                          ?.removeListener(() {
                                        // model.nativeVideoPlayerController?.dispose();
                                        model.nativeVideoPlayerController =
                                            null;
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
                      if (model.level == 'Pemilik Rumah' &&
                          model.mandorModel != null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 20),
                            MyTextFormField(
                              labelText: 'Mandor',
                              controller: model.mandorController,
                              readOnly: true,
                            ),
                            const SizedBox(height: 20),
                            MyTextFormField(
                              labelText: 'No. Telp Mandor',
                              controller: model.noHpController,
                              readOnly: true,
                            ),
                            const SizedBox(height: 20),
                            // create row with 2 rounded icon , one is chat whatsapp , one is call
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: greenColor,
                                  child: IconButton(
                                    onPressed: () async {
                                      // model.openWhatsapp();
                                      String noTelpon =
                                          model.noHpController!.text;
                                      // convert the number to international format
                                      noTelpon = noTelpon.replaceAll(
                                          RegExp(r'[^0-9]'), '');
                                      noTelpon = '62${noTelpon.substring(1)}';

                                      // log.i('no_telpon: $noTelpon');
                                      final url =
                                          Uri.parse('https://wa.me/$noTelpon');

                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.chat,
                                      color: backgroundColor3,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: mainColor,
                                  child: IconButton(
                                    onPressed: () async {
                                      // model.callPhone();
                                      final Uri callUri = Uri(
                                          scheme: 'tel',
                                          path: model.noHpController!.text);
                                      if (!await launchUrl(callUri)) {
                                        throw 'Could not launch ${callUri.toString()}';
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.call,
                                      color: backgroundColor3,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
