// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:perumahan_bew/ui/views/login_screen/login_screen_view.dart'
    as _i3;
import 'package:perumahan_bew/ui/views/mandor_tracking_index/mandor_tracking_index_view.dart'
    as _i7;
import 'package:perumahan_bew/ui/views/pengembang_index/list_pemilik/list_pemilik_view.dart'
    as _i14;
import 'package:perumahan_bew/ui/views/pengembang_index/pengembang_home/pengembang_home2/pengembang_home2_view.dart'
    as _i13;
import 'package:perumahan_bew/ui/views/pengembang_index/pengembang_home/pengembang_home_view.dart'
    as _i12;
import 'package:perumahan_bew/ui/views/pengembang_index/pengembang_index_view.dart'
    as _i5;
import 'package:perumahan_bew/ui/views/pengembang_index/pengembang_profil/pengembang_profil_view.dart'
    as _i15;
import 'package:perumahan_bew/ui/views/pengembang_index/perumahan_detail/perumahan_detail_view.dart'
    as _i6;
import 'package:perumahan_bew/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:perumahan_bew/ui/views/user_index/user_home/user_home_view.dart'
    as _i9;
import 'package:perumahan_bew/ui/views/user_index/user_index_view.dart' as _i4;
import 'package:perumahan_bew/ui/views/user_index/user_list_pembangunan/user_list_pembangunan_view.dart'
    as _i11;
import 'package:perumahan_bew/ui/views/user_index/user_profile/user_profile_view.dart'
    as _i10;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const splashScreenView = '/';

  static const loginScreenView = '/login-screen-view';

  static const userIndexView = '/user-index-view';

  static const pengembangIndexView = '/pengembang-index-view';

  static const perumahanDetailView = '/perumahan-detail-view';

  static const mandorTrackingIndexView = '/mandor-tracking-index-view';

  static const all = <String>{
    splashScreenView,
    loginScreenView,
    userIndexView,
    pengembangIndexView,
    perumahanDetailView,
    mandorTrackingIndexView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginScreenView,
      page: _i3.LoginScreenView,
    ),
    _i1.RouteDef(
      Routes.userIndexView,
      page: _i4.UserIndexView,
    ),
    _i1.RouteDef(
      Routes.pengembangIndexView,
      page: _i5.PengembangIndexView,
    ),
    _i1.RouteDef(
      Routes.perumahanDetailView,
      page: _i6.PerumahanDetailView,
    ),
    _i1.RouteDef(
      Routes.mandorTrackingIndexView,
      page: _i7.MandorTrackingIndexView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginScreenView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginScreenView(),
        settings: data,
      );
    },
    _i4.UserIndexView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.UserIndexView(),
        settings: data,
      );
    },
    _i5.PengembangIndexView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PengembangIndexView(),
        settings: data,
      );
    },
    _i6.PerumahanDetailView: (data) {
      final args = data.getArgs<PerumahanDetailViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.PerumahanDetailView(
            key: args.key, idPerumahan: args.idPerumahan),
        settings: data,
      );
    },
    _i7.MandorTrackingIndexView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.MandorTrackingIndexView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PerumahanDetailViewArguments {
  const PerumahanDetailViewArguments({
    this.key,
    required this.idPerumahan,
  });

  final _i8.Key? key;

  final String idPerumahan;

  @override
  String toString() {
    return '{"key": "$key", "idPerumahan": "$idPerumahan"}';
  }

  @override
  bool operator ==(covariant PerumahanDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.idPerumahan == idPerumahan;
  }

  @override
  int get hashCode {
    return key.hashCode ^ idPerumahan.hashCode;
  }
}

class UserIndexViewRoutes {
  static const userHomeView = '';

  static const userProfileView = 'user-profile-view';

  static const userListPembangunanView = 'user-list-pembangunan-view';

  static const all = <String>{
    userHomeView,
    userProfileView,
    userListPembangunanView,
  };
}

class UserIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      UserIndexViewRoutes.userHomeView,
      page: _i9.UserHomeView,
    ),
    _i1.RouteDef(
      UserIndexViewRoutes.userProfileView,
      page: _i10.UserProfileView,
    ),
    _i1.RouteDef(
      UserIndexViewRoutes.userListPembangunanView,
      page: _i11.UserListPembangunanView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i9.UserHomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.UserHomeView(),
        settings: data,
      );
    },
    _i10.UserProfileView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.UserProfileView(),
        settings: data,
      );
    },
    _i11.UserListPembangunanView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.UserListPembangunanView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PengembangIndexViewRoutes {
  static const pengembangHomeView = '';

  static const pengembangHome2View = 'pengembang-home2-view';

  static const listPemilikView = 'list-pemilik-view';

  static const pengembangProfilView = 'pengembang-profil-view';

  static const all = <String>{
    pengembangHomeView,
    pengembangHome2View,
    listPemilikView,
    pengembangProfilView,
  };
}

class PengembangIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      PengembangIndexViewRoutes.pengembangHomeView,
      page: _i12.PengembangHomeView,
    ),
    _i1.RouteDef(
      PengembangIndexViewRoutes.pengembangHome2View,
      page: _i13.PengembangHome2View,
    ),
    _i1.RouteDef(
      PengembangIndexViewRoutes.listPemilikView,
      page: _i14.ListPemilikView,
    ),
    _i1.RouteDef(
      PengembangIndexViewRoutes.pengembangProfilView,
      page: _i15.PengembangProfilView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i12.PengembangHomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.PengembangHomeView(),
        settings: data,
      );
    },
    _i13.PengembangHome2View: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PengembangHome2View(),
        settings: data,
      );
    },
    _i14.ListPemilikView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ListPemilikView(),
        settings: data,
      );
    },
    _i15.PengembangProfilView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.PengembangProfilView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MandorTrackingIndexViewRoutes {
  static const pengembangHomeView = '';

  static const pengembangHome2View = 'pengembang-home2-view';

  static const listPemilikView = 'list-pemilik-view';

  static const pengembangProfilView = 'pengembang-profil-view';

  static const all = <String>{
    pengembangHomeView,
    pengembangHome2View,
    listPemilikView,
    pengembangProfilView,
  };
}

class MandorTrackingIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      MandorTrackingIndexViewRoutes.pengembangHomeView,
      page: _i12.PengembangHomeView,
    ),
    _i1.RouteDef(
      MandorTrackingIndexViewRoutes.pengembangHome2View,
      page: _i13.PengembangHome2View,
    ),
    _i1.RouteDef(
      MandorTrackingIndexViewRoutes.listPemilikView,
      page: _i14.ListPemilikView,
    ),
    _i1.RouteDef(
      MandorTrackingIndexViewRoutes.pengembangProfilView,
      page: _i15.PengembangProfilView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i12.PengembangHomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.PengembangHomeView(),
        settings: data,
      );
    },
    _i13.PengembangHome2View: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PengembangHome2View(),
        settings: data,
      );
    },
    _i14.ListPemilikView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ListPemilikView(),
        settings: data,
      );
    },
    _i15.PengembangProfilView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.PengembangProfilView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPengembangIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pengembangIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPerumahanDetailView({
    _i8.Key? key,
    required String idPerumahan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.perumahanDetailView,
        arguments:
            PerumahanDetailViewArguments(key: key, idPerumahan: idPerumahan),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMandorTrackingIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mandorTrackingIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedUserHomeViewInUserIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexViewRoutes.userHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedUserProfileViewInUserIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexViewRoutes.userProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedUserListPembangunanViewInUserIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexViewRoutes.userListPembangunanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengembangHomeViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PengembangIndexViewRoutes.pengembangHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengembangHome2ViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PengembangIndexViewRoutes.pengembangHome2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedListPemilikViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PengembangIndexViewRoutes.listPemilikView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengembangProfilViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PengembangIndexViewRoutes.pengembangProfilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengembangHomeViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(MandorTrackingIndexViewRoutes.pengembangHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengembangHome2ViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        MandorTrackingIndexViewRoutes.pengembangHome2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedListPemilikViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(MandorTrackingIndexViewRoutes.listPemilikView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPengembangProfilViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        MandorTrackingIndexViewRoutes.pengembangProfilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPengembangIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pengembangIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPerumahanDetailView({
    _i8.Key? key,
    required String idPerumahan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.perumahanDetailView,
        arguments:
            PerumahanDetailViewArguments(key: key, idPerumahan: idPerumahan),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMandorTrackingIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mandorTrackingIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedUserHomeViewInUserIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexViewRoutes.userHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedUserProfileViewInUserIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexViewRoutes.userProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedUserListPembangunanViewInUserIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexViewRoutes.userListPembangunanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengembangHomeViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PengembangIndexViewRoutes.pengembangHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengembangHome2ViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PengembangIndexViewRoutes.pengembangHome2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedListPemilikViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PengembangIndexViewRoutes.listPemilikView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengembangProfilViewInPengembangIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PengembangIndexViewRoutes.pengembangProfilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengembangHomeViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        MandorTrackingIndexViewRoutes.pengembangHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengembangHome2ViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        MandorTrackingIndexViewRoutes.pengembangHome2View,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedListPemilikViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(MandorTrackingIndexViewRoutes.listPemilikView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPengembangProfilViewInMandorTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        MandorTrackingIndexViewRoutes.pengembangProfilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
