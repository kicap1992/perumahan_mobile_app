import 'package:native_video_player/native_video_player.dart';
import 'package:perumahan_bew/app/core/custom_base_view_model.dart';

class PlayVideoDialogViewModel extends CustomBaseViewModel {
  NativeVideoPlayerController? nativeVideoPlayerController;
  bool playVideo = true;
  Future<void> init() async {}
}
