// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/play_video_dialog/play_video_dialog_view.dart';

enum DialogType {
  playVideoDialogView,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.playVideoDialogView: (context, request, completer) =>
        PlayVideoDialogView(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
