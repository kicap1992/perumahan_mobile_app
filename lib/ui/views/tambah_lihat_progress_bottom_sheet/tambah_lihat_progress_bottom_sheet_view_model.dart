import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_video_player/native_video_player.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../app/themes/app_colors.dart';

class TambahLihatProgressBottomSheetViewModel extends CustomBaseViewModel {
  final log = getLogger('TambahLihatProgressBottomSheetViewModel');

  NativeVideoPlayerController? nativeVideoPlayerController;

  String? idPerumahan;

  // form variable
  final globalKey = GlobalKey<FormState>();
  TextEditingController? ketController = TextEditingController();

  // image video variable
  // image picker
  String? imageVideoPath;
  final ImagePicker _picker = ImagePicker();
  XFile? imageVideoFile;
  Uint8List? imageVideoBytes;
  String? imageVideoType;
  Future<void> init(String data) async {
    globalVar.backPressed = "exitApp";
    idPerumahan = data;
  }

  addImage(String type) async {
    imageVideoType = type;
    try {
      XFile? imageVideo;
      if (type == 'image') {
        imageVideo = await _picker.pickImage(
          source: ImageSource.camera,
        );
      } else if (type == 'video') {
        imageVideo = await _picker.pickVideo(
          source: ImageSource.camera,
        );
      }
      if (imageVideo != null) {
        imageVideoFile = imageVideo;
        imageVideoPath = imageVideo.path;
        imageVideoBytes = await imageVideo.readAsBytes();

        log.i('image path: $imageVideoPath');
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
    }
  }

  pilihImageVideo() async {
    dialogService
        .showDialog(
      title: 'Image Video',
      description: 'Pilih Gambar atau Video',
      buttonTitle: 'Gambar',
      cancelTitle: 'Video',
      buttonTitleColor: mainColor,
      cancelTitleColor: mainColor,
    )
        .then((value) async {
      if (value!.confirmed) {
        await addImage('image');
      } else {
        await addImage('video');
      }
    });
  }

  playVideo() async {
    // play video by imageVideoPath

    await dialogService.showCustomDialog(
      variant: DialogType.playVideoDialogView,
      title: 'Video',
      data: imageVideoPath,
    );
  }

  Future<bool> tambahProgress() async {
    globalVar.backPressed = "cantBack";
    setBusy(true);
    easyLoading.customLoading('Tambah Progress...');
    try {
      String? idMandor = await mySharedPrefs.getString('id');
      var formData = FormData.fromMap({
        'id_rumah': idPerumahan,
        'id_mandor': idMandor,
        'ket': ketController!.text,
        'image': await MultipartFile.fromFile(
          imageVideoPath!,
          filename: imageVideoFile!.name,
        ),
        'type': imageVideoType,
      });
      await httpService.postWithFormData('pembangunan', formData);
      return true;
    } catch (e) {
      log.e(e.toString());
      return false;
    } finally {
      globalVar.backPressed = "exitApp";
      setBusy(false);
      easyLoading.dismiss();
    }
  }

  showImage(BuildContext context) async {
    showImageViewer(
      context,
      Image.memory(
        imageVideoBytes!,
        fit: BoxFit.fill,
      ).image,
      swipeDismissible: true,
      doubleTapZoomable: true,
    );
  }
}
