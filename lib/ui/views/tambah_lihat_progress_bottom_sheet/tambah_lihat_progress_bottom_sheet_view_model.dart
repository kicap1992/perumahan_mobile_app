import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:perumahan_bew/model/rumah_model.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../app/themes/app_colors.dart';
import '../../../model/my_response_model.dart';

class TambahLihatProgressBottomSheetViewModel extends CustomBaseViewModel {
  final log = getLogger('TambahLihatProgressBottomSheetViewModel');

  NativeVideoPlayerController? nativeVideoPlayerController;

  String? level;
  MandorModel? mandorModel;
  TextEditingController? mandorController = TextEditingController();
  TextEditingController? noHpController = TextEditingController();

  String? idPerumahan;
  ProgressModel? progressModel;

  // form variable
  final globalKey = GlobalKey<FormState>();
  TextEditingController? ketController = TextEditingController();
  TextEditingController? waktuController = TextEditingController();

  // image video variable
  // image picker
  String? imageVideoPath;
  final ImagePicker _picker = ImagePicker();
  XFile? imageVideoFile;
  Uint8List? imageVideoBytes;
  String? imageVideoType;
  Future<void> init(data) async {
    globalVar.backPressed = "exitApp";
    idPerumahan = data['idPerumahan'];
    // log.i(data['progressModel']);

    if (data['progressModel'] != null) {
      progressModel = data['progressModel'];
      ketController!.text = progressModel!.ket!;
      waktuController!.text = progressModel!.createdAt!;
      log.i('type: ${progressModel!.type}');
      imageVideoType = progressModel!.type;
    }

    level = await mySharedPrefs.getString('level');
    if (level == 'Pemilik Rumah') {
      await getData();
    }
  }

  getData() async {
    setBusy(true);
    try {
      var response =
          await httpService.get('mandor?id=${progressModel!.idMandor}');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      mandorModel = MandorModel.fromJson(myResponseModel.data);
      log.i('mandorModel: ${mandorModel!.nama}');
      mandorController!.text = mandorModel!.nama!;
      noHpController!.text = mandorModel!.noTelpon!;
    } catch (e) {
      log.e('Error: $e');
    } finally {
      setBusy(false);
    }
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

  playVideo(String status, String? url) async {
    // play video by imageVideoPath
    log.i('play video');
    log.i(status);
    log.i(url);

    await dialogService.showCustomDialog(
      variant: DialogType.playVideoDialogView,
      title: 'Video',
      data: {
        'status': status,
        'url': url,
        'path': imageVideoPath,
      },
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

  showImage(BuildContext context, String status, String? url) async {
    log.i(status);
    log.i(url);
    showImageViewer(
      context,
      status == 'file'
          ? Image.memory(
              imageVideoBytes!,
              fit: BoxFit.fill,
            ).image
          : Image.network(
              url!,
              fit: BoxFit.fill,
            ).image,
      swipeDismissible: true,
      doubleTapZoomable: true,
    );
  }
}
