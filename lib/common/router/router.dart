import 'package:auto_route/auto_route_annotations.dart';
import 'package:example/common/router/auth_grard.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:example/pages/login/player_login_page.dart';
import 'package:example/pages/route/route_data_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
import 'package:flutter/material.dart';


///中间放大
Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(scale: animation, child: child);
}


Widget leftToRightTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      // 设置滑动的 X , Y 轴
      //从左到右
        begin: Offset(-1.0, 0.0),
        end: Offset(0.0, 0.0)
    ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn
    )),
    child: child,
  );
}

Widget rightToLeftTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      // 设置滑动的 X , Y 轴
      //从右到左
        begin: Offset(1.0, 0.0),
        end: Offset(0.0, 0.0)
    ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn
    )),
    child: child,
  );
}


Widget bottomToTopTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      // 设置滑动的 X , Y 轴
      //从低到顶
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0)
    ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn
    )),
    child: child,
  );
}


@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter{

  @initial
  IndexPage indexPageRoute;

  PlayerLoginPage playerLoginPageRoute;

  RouteSimplePage routeSimplePageRoute;

//  @GuardedBy([AuthGuard])
  @CustomRoute(transitionsBuilder: bottomToTopTransition,durationInMilliseconds: 500)
  RouteDataPage routeDataPageRoute;

}