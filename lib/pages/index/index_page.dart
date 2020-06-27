import 'package:example/common/router/routes.dart';
import 'package:example/pages/anim/anim_page.dart';
import 'package:example/pages/banner/grid_banner_page.dart';
import 'package:example/pages/banner/list_banner_page.dart';
import 'package:example/pages/category/category_page.dart';
import 'package:example/pages/dialog/dialog_page.dart';
import 'package:example/pages/eventbus/eventbus_page1.dart';
import 'package:example/pages/login/player_login_page.dart';
import 'package:example/pages/login/scroll_login_page.dart';
import 'package:example/pages/map/map_page.dart';
import 'package:example/pages/mimicry/mimicry_page.dart';
import 'package:example/pages/provider/provider1_page.dart';
import 'package:example/pages/refresh/list_page.dart';
import 'package:example/pages/refresh/pull_refresh_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
import 'package:example/pages/sqflite/sqflite_page.dart';
import 'package:example/pages/ui/ui_slide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 用于路由跳转，app将从此页面开始
class IndexPage extends StatefulWidget {

  IndexPage({Key key}): super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  List<PageData> _widgetList = [
    PageData('PlayerLoginPage',RouteName.playerLoginPage),
    PageData('PullRefreshPage',RouteName.pullRefreshPage),
    PageData('ListPage',RouteName.listPage),
    PageData('DialogPage',RouteName.dialogPage),
    PageData('CategoryPage',RouteName.categoryPage),
    PageData('ListBannerPage',RouteName.listBannerPage),
    PageData('GridBannerPage',RouteName.gridBannerPage),
    PageData('Provider1Page',RouteName.provider1Page),
    PageData('RouteSimplePage',RouteName.routeSimplePage),
    PageData('AnimPage',RouteName.animPage),
    PageData('ScrollLoginPage',RouteName.scrollLoginPage),
    PageData('UIslidePage',RouteName.uIslidePage),
    PageData('MimicryPage',RouteName.mimicryPage),
    PageData('SqflitePage',RouteName.sqflitePage),
    PageData('EventBusPage1',RouteName.eventBusPage1)
  ];




  
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );

    return Scaffold(
//      body: PlayerLoginPage(),
//      body: PullRefreshPage(),
//      body: ListPage(),
//      body: DialogPage(),
//      body: CategoryPage(),
//      body: ListBannerPage(),
//      body: GridBannerPage(),
//        body: Provider1Page(),
//        body: RouteSimplePage(),
//        body: AnimPage(),
//        body: ScrollLoginPage(),
//        body: UIslidePage(),
//        body: MimicryPage(),
//        body: MapPage(),
//        body: SqflitePage(),
//          body: EventBusPage1(),
          body: _bulidBody(),
    );
  }

  Widget _bulidBody(){
    return ListView.builder(
        itemCount: _widgetList.length,
        itemBuilder: (BuildContext context, int index){
      return MaterialButton(
        child: Text(_widgetList[index]._name),
        onPressed: (){
          Navigator.of(context).pushNamed(_widgetList[index]._routeName);
        },
      );
    });
  }
}

class PageData{
  String _name;
  String _routeName;

  PageData(this._name, this._routeName);
}

