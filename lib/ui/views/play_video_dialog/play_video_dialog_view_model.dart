import 'package:native_video_player/native_video_player.dart';
import 'package:perumahan_bew/app/core/custom_base_view_model.dart';

class PlayVideoDialogViewModel extends CustomBaseViewModel {
  NativeVideoPlayerController? nativeVideoPlayerController;
  bool playVideo = true;

  String? status;
  String? url;
  String? path;

  Future<void> init(data) async {
    status = data['status'];
    url = data['url'];
    path = data['path'];
  }
}
