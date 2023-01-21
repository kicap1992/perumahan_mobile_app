import 'package:perumahan/services/my_easyloading.dart';
import 'package:perumahan/ui/views/login_screen/login_screen_view.dart';
import 'package:perumahan/ui/views/pengembang_index/list_pemilik/list_pemilik_view.dart';
import 'package:perumahan/ui/views/pengembang_index/pengembang_home/pengembang_home_view.dart';
import 'package:perumahan/ui/views/pengembang_index/pengembang_index_view.dart';
import 'package:perumahan/ui/views/pengembang_index/pengembang_profil/pengembang_profil_view.dart';
import 'package:perumahan/ui/views/pengembang_index/perumahan_detail/perumahan_detail_view.dart';
import 'package:perumahan/ui/views/splash_screen/splash_screen_view.dart';
import 'package:perumahan/ui/views/user_index/user_index_view.dart';
import 'package:perumahan/ui/views/user_index/user_list_pembangunan/user_list_pembangunan_view.dart';
import 'package:perumahan/ui/views/user_index/user_profile/user_profile_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/http_services.dart';
import '../ui/views/user_index/user_home/user_home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(
      page: UserIndexView,
      children: [
        MaterialRoute(page: UserHomeView, initial: true),
        MaterialRoute(page: UserProfileView),
        MaterialRoute(page: UserListPembangunanView),
      ],
    ),
    MaterialRoute(
      page: PengembangIndexView,
      children: [
        MaterialRoute(page: PengembangHomeView, initial: true),
        MaterialRoute(page: ListPemilikView),
        MaterialRoute(page: PengembangProfilView),
      ],
    ),
    MaterialRoute(page: PerumahanDetailView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //
    LazySingleton(classType: UserHomeView),
    LazySingleton(classType: PengembangHomeView),
    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
  ],
  logger: StackedLogger(),
)
class App {}
