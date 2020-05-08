// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:example/pages/login/player_login_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
import 'package:example/pages/route/route_data_page.dart';
import 'package:example/common/router/router.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const playerLoginPageRoute = '/player-login-page-route';
  static const routeSimplePageRoute = '/route-simple-page-route';
  static const routeDataPageRoute = '/route-data-page-route';
}

class AppRouter extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexPageArguments>(args)) {
          return misTypedArgsRoute<IndexPageArguments>(args);
        }
        final typedArgs = args as IndexPageArguments ?? IndexPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => IndexPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.playerLoginPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => PlayerLoginPage(),
          settings: settings,
        );
      case Routes.routeSimplePageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => RouteSimplePage(),
          settings: settings,
        );
      case Routes.routeDataPageRoute:
        if (hasInvalidArgs<RouteDataPageArguments>(args)) {
          return misTypedArgsRoute<RouteDataPageArguments>(args);
        }
        final typedArgs =
            args as RouteDataPageArguments ?? RouteDataPageArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              RouteDataPage(key: typedArgs.key, data: typedArgs.data),
          settings: settings,
          transitionsBuilder: bottomToTopTransition,
          transitionDuration: const Duration(milliseconds: 500),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//IndexPage arguments holder class
class IndexPageArguments {
  final Key key;
  IndexPageArguments({this.key});
}

//RouteDataPage arguments holder class
class RouteDataPageArguments {
  final Key key;
  final String data;
  RouteDataPageArguments({this.key, this.data});
}

//**************************************************************************
// Navigation helper methods extension
//***************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushIndexPageRoute({
    Key key,
  }) =>
      pushNamed(Routes.indexPageRoute, arguments: IndexPageArguments(key: key));
  Future pushPlayerLoginPageRoute() => pushNamed(Routes.playerLoginPageRoute);
  Future pushRouteSimplePageRoute() => pushNamed(Routes.routeSimplePageRoute);
  Future pushRouteDataPageRoute({
    Key key,
    String data,
  }) =>
      pushNamed(Routes.routeDataPageRoute,
          arguments: RouteDataPageArguments(key: key, data: data));
}
