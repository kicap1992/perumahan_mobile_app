import 'package:flutter/material.dart';
import 'package:native_video_player/native_video_player.dart';
import 'package:perumahan_bew/ui/widgets/my_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import './play_video_dialog_view_model.dart';

class PlayVideoDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const PlayVideoDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlayVideoDialogViewModel>.reactive(
      viewModelBuilder: () => PlayVideoDialogViewModel(),
      onViewModelReady: (PlayVideoDialogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PlayVideoDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            // width: MediaQuery.of(context).size.width * 0.8,
            // height: 450,
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 11,
                    child: NativeVideoPlayerView(
                      onViewReady: (controller) async {
                        final videoSource = await VideoSource.init(
                          path: request!.data.toString(),
                          type: VideoSourceType.file,
                        );
                        await controller.loadVideoSource(videoSource);
                        model.nativeVideoPlayerController = controller;
                        model.notifyListeners();
                        model.nativeVideoPlayerController!.play();
                        // loop video
                        model.nativeVideoPlayerController!.onPlaybackEnded
                            .addListener(() {
                          model.nativeVideoPlayerController!.seekTo(0);
                          model.nativeVideoPlayerController!.play();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // create button to play video
                  SizedBox(
                    width: 150,
                    child: MyButton(
                      onPressed: () {
                        model.playVideo = !model.playVideo;
                        if (model.playVideo) {
                          model.nativeVideoPlayerController!.play();
                        } else {
                          model.nativeVideoPlayerController!.pause();
                        }
                        model.notifyListeners();
                      },
                      text: model.playVideo ? 'Pause' : 'Play',
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
