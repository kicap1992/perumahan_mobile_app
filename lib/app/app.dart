import 'package:perumahan_bew/ui/views/play_video_dialog/play_video_dialog_view.dart';
import 'package:perumahan_bew/ui/views/user_index/user_list_pembangunan/user_list_pembangunan_page/user_list_pembangunan_page_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/global_var.dart';
import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/other_function.dart';
import '../services/shared_prefs.dart';
import '../ui/views/login_screen/login_screen_view.dart';
import '../ui/views/mandor_tracking_index/mandor_tracking_index_view.dart';
import '../ui/views/pengembang_index/list_pemilik/list_pemilik_view.dart';
import '../ui/views/pengembang_index/pengembang_home/pengembang_home2/pengembang_home2_view.dart';
import '../ui/views/pengembang_index/pengembang_home/pengembang_home_view.dart';
import '../ui/views/pengembang_index/pengembang_home/tambah_rumah_bottom_sheet/tambah_rumah_bottom_sheet_view.dart';
import '../ui/views/pengembang_index/pengembang_index_view.dart';
import '../ui/views/pengembang_index/pengembang_profil/pengembang_profil_view.dart';
import '../ui/views/pengembang_index/perumahan_detail/perumahan_detail_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/tambah_lihat_progress_bottom_sheet/tambah_lihat_progress_bottom_sheet_view.dart';
import '../ui/views/user_index/user_index_view.dart';
import '../ui/views/user_index/user_list_pembangunan/user_list_pembangunan_view.dart';
import '../ui/views/user_index/user_profile/user_profile_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(
      page: UserIndexView,
      children: [
        MaterialRoute(page: UserListPembangunanView, initial: true),
        MaterialRoute(page: UserProfileView),
        MaterialRoute(page: UserListPembangunanPageView),
      ],
    ),
    // dibawah untuk admin
    MaterialRoute(
      page: PengembangIndexView,
      children: [
        MaterialRoute(page: PengembangHomeView, initial: true),
        MaterialRoute(page: PengembangHome2View),
        MaterialRoute(page: ListPemilikView),
        MaterialRoute(page: PengembangProfilView),
      ],
    ),
    MaterialRoute(page: PerumahanDetailView),
    // dibawah untuk mandor
    MaterialRoute(page: MandorTrackingIndexView, children: [
      MaterialRoute(page: PengembangHomeView, initial: true),
      MaterialRoute(page: PengembangHome2View),
      MaterialRoute(page: ListPemilikView),
      MaterialRoute(page: PengembangProfilView),
    ])
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //
    LazySingleton(classType: PengembangHomeView),
    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: MySharedPrefs),
    LazySingleton(classType: GlobalVar),
    LazySingleton(classType: MyFunction),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: TambahRumahBottomSheetView),
    StackedBottomsheet(classType: TambahLihatProgressBottomSheetView),
  ],
  dialogs: [
    StackedDialog(classType: PlayVideoDialogView),
  ],
  logger: StackedLogger(),
)
class App {}
