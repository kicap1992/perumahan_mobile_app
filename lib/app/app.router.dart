// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:perumahan/ui/views/login_screen/login_screen_view.dart' as _i3;
import 'package:perumahan/ui/views/pengembang_index/list_pemilik/list_pemilik_view.dart'
    as _i12;
import 'package:perumahan/ui/views/pengembang_index/pengembang_home/pengembang_home_view.dart'
    as _i11;
import 'package:perumahan/ui/views/pengembang_index/pengembang_index_view.dart'
    as _i5;
import 'package:perumahan/ui/views/pengembang_index/pengembang_profil/pengembang_profil_view.dart'
    as _i13;
import 'package:perumahan/ui/views/pengembang_index/perumahan_detail/perumahan_detail_view.dart'
    as _i6;
import 'package:perumahan/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:perumahan/ui/views/user_index/user_home/user_home_view.dart'
    as _i8;
import 'package:perumahan/ui/views/user_index/user_index_view.dart' as _i4;
import 'package:perumahan/ui/views/user_index/user_list_pembangunan/user_list_pembangunan_view.dart'
    as _i10;
import 'package:perumahan/ui/views/user_index/user_profile/user_profile_view.dart'
    as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const splashScreenView = '/';

  static const loginScreenView = '/login-screen-view';

  static const userIndexView = '/user-index-view';

  static const pengembangIndexView = '/pengembang-index-view';

  static const perumahanDetailView = '/perumahan-detail-view';

  static const all = <String>{
    splashScreenView,
    loginScreenView,
    userIndexView,
    pengembangIndexView,
    perumahanDetailView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginScreenView(),
        settings: data,
      );
    },
    _i4.UserIndexView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.UserIndexView(),
        settings: data,
      );
    },
    _i5.PengembangIndexView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.PengembangIndexView(),
        settings: data,
      );
    },
    _i6.PerumahanDetailView: (data) {
      final args = data.getArgs<PerumahanDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i6.PerumahanDetailView(
            key: args.key, idPerumahan: args.idPerumahan),
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

  final _i7.Key? key;

  final String idPerumahan;
}

class UserIndexViewRoutes {
  static const userHomeView = '/';

  static const userProfileView = '/user-profile-view';

  static const userListPembangunanView = '/user-list-pembangunan-view';

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
      page: _i8.UserHomeView,
    ),
    _i1.RouteDef(
      UserIndexViewRoutes.userProfileView,
      page: _i9.UserProfileView,
    ),
    _i1.RouteDef(
      UserIndexViewRoutes.userListPembangunanView,
      page: _i10.UserListPembangunanView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i8.UserHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.UserHomeView(),
        settings: data,
      );
    },
    _i9.UserProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i9.UserProfileView(),
        settings: data,
      );
    },
    _i10.UserListPembangunanView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.UserListPembangunanView(),
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
  static const pengembangHomeView = '/';

  static const listPemilikView = '/list-pemilik-view';

  static const pengembangProfilView = '/pengembang-profil-view';

  static const all = <String>{
    pengembangHomeView,
    listPemilikView,
    pengembangProfilView,
  };
}

class PengembangIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      PengembangIndexViewRoutes.pengembangHomeView,
      page: _i11.PengembangHomeView,
    ),
    _i1.RouteDef(
      PengembangIndexViewRoutes.listPemilikView,
      page: _i12.ListPemilikView,
    ),
    _i1.RouteDef(
      PengembangIndexViewRoutes.pengembangProfilView,
      page: _i13.PengembangProfilView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i11.PengembangHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.PengembangHomeView(),
        settings: data,
      );
    },
    _i12.ListPemilikView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i12.ListPemilikView(),
        settings: data,
      );
    },
    _i13.PengembangProfilView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i13.PengembangProfilView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i14.NavigationService {
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
    _i7.Key? key,
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

  Future<dynamic> navigateToNestedUserHomeViewInUserIndexView([
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

  Future<dynamic> navigateToNestedUserProfileViewInUserIndexView([
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

  Future<dynamic> navigateToNestedUserListPembangunanViewInUserIndexView([
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

  Future<dynamic> navigateToNestedPengembangHomeViewInPengembangIndexView([
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

  Future<dynamic> navigateToNestedListPemilikViewInPengembangIndexView([
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

  Future<dynamic> navigateToNestedPengembangProfilViewInPengembangIndexView([
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
    _i7.Key? key,
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

  Future<dynamic> replaceWithNestedUserHomeViewInUserIndexView([
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

  Future<dynamic> replaceWithNestedUserProfileViewInUserIndexView([
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

  Future<dynamic> replaceWithNestedUserListPembangunanViewInUserIndexView([
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

  Future<dynamic> replaceWithNestedPengembangHomeViewInPengembangIndexView([
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

  Future<dynamic> replaceWithNestedListPemilikViewInPengembangIndexView([
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

  Future<dynamic> replaceWithNestedPengembangProfilViewInPengembangIndexView([
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
}
