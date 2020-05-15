import 'package:example/common/router/page_route_builder.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:example/pages/login/player_login_page.dart';
import 'package:example/pages/mimicry/mimicry_page.dart';
import 'package:example/pages/route/route_data_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
import 'package:flutter/material.dart';

class RouteName{
  static const String indexPage = '/';
  static const String routeSimplePage = '/route_simple_page';
  static const String routeDataPage = '/route_data_page';
  static const String playerLoginPage = '/player_login_page';
  static const String mimicryPage = '/mimicry_page';
}


Route<dynamic> onGenerateRoute(RouteSettings settings){
   final String routeName = settings.name;
   print('当前访问路由名:$routeName');
   switch(routeName){
     case RouteName.indexPage:
       return AnimRouteBuilder(IndexPage());
     case RouteName.routeSimplePage:
       return AnimRouteBuilder(RouteSimplePage());
     case RouteName.routeDataPage:
       return AnimRouteBuilder(RouteDataPage(arguments: settings.arguments,));
     case RouteName.playerLoginPage:
       return AnimRouteBuilder(PlayerLoginPage());
     case RouteName.mimicryPage:
       return AnimRouteBuilder(MimicryPage());
     default:
       return  MaterialPageRoute(
           builder: (_) => Scaffold(
             body: Center(
               child: Text('No route defined for ${settings.name}'),
             ),
           ));
   }
}