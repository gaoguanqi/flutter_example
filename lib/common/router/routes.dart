import 'package:example/common/router/page_route_builder.dart';
import 'package:example/pages/anim/anim_page.dart';
import 'package:example/pages/banner/grid_banner_page.dart';
import 'package:example/pages/banner/list_banner_page.dart';
import 'package:example/pages/category/category_page.dart';
import 'package:example/pages/dialog/dialog_page.dart';
import 'package:example/pages/eventbus/eventbus_page1.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:example/pages/login/player_login_page.dart';
import 'package:example/pages/login/scroll_login_page.dart';
import 'package:example/pages/mimicry/mimicry_page.dart';
import 'package:example/pages/provider/provider1_page.dart';
import 'package:example/pages/refresh/list_page.dart';
import 'package:example/pages/refresh/pull_refresh_page.dart';
import 'package:example/pages/route/route_data_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
import 'package:example/pages/sqflite/sqflite_page.dart';
import 'package:example/pages/ui/ui_slide_page.dart';
import 'package:flutter/material.dart';

class RouteName{
  static const String indexPage = '/';
  static const String routeSimplePage = '/route_simple_page';
  static const String routeDataPage = '/route_data_page';
  static const String playerLoginPage = '/player_login_page';
  static const String mimicryPage = '/mimicry_page';

  static const String pullRefreshPage = '/pull_refresh_page';
  static const String listPage = '/list_page';
  static const String dialogPage = '/dialog_page';
  static const String categoryPage = '/category_page';
  static const String listBannerPage = '/list_banner_page';
  static const String gridBannerPage = '/grid_banner_page';
  static const String provider1Page = '/provider1_page';
  static const String animPage = '/anim_page';
  static const String scrollLoginPage = '/scroll_login_page';
  static const String uIslidePage = '/uislide_page';
  static const String sqflitePage = '/sqflite_page';
  static const String eventBusPage1 = '/event_bus_page1';

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
     case RouteName.pullRefreshPage:
       return AnimRouteBuilder(PullRefreshPage());
     case RouteName.listPage:
       return AnimRouteBuilder(ListPage());
     case RouteName.dialogPage:
       return AnimRouteBuilder(DialogPage());
     case RouteName.categoryPage:
       return AnimRouteBuilder(CategoryPage());
     case RouteName.listBannerPage:
       return AnimRouteBuilder(ListBannerPage());
     case RouteName.gridBannerPage:
     return AnimRouteBuilder(GridBannerPage());
     case RouteName.provider1Page:
       return AnimRouteBuilder(Provider1Page());
     case RouteName.animPage:
       return AnimRouteBuilder(AnimPage());
     case RouteName.scrollLoginPage:
     return AnimRouteBuilder(ScrollLoginPage());
     case RouteName.uIslidePage:
       return AnimRouteBuilder(UIslidePage());
     case RouteName.sqflitePage:
       return AnimRouteBuilder(SqflitePage());
     case RouteName.eventBusPage1:
       return AnimRouteBuilder(EventBusPage1());
     default:
       return  MaterialPageRoute(
           builder: (_) => Scaffold(
             body: Center(
               child: Text('No route defined for ${settings.name}'),
             ),
           ));
   }
}