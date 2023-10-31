// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/pengembang_index/pengembang_home/tambah_rumah_bottom_sheet/tambah_rumah_bottom_sheet_view.dart';
import '../ui/views/tambah_lihat_progress_bottom_sheet/tambah_lihat_progress_bottom_sheet_view.dart';

enum BottomSheetType {
  tambahRumahBottomSheetView,
  tambahLihatProgressBottomSheetView,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.tambahRumahBottomSheetView: (context, request, completer) =>
        TambahRumahBottomSheetView(request: request, completer: completer),
    BottomSheetType.tambahLihatProgressBottomSheetView:
        (context, request, completer) => TambahLihatProgressBottomSheetView(
            request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
