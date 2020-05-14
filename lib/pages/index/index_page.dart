import 'package:example/pages/login/scroll_login_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
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
        body: RouteSimplePage(),
//        body: AnimPage(),
//        body: ScrollLoginPage(),
//        body: UIslidePage(),
    );
  }
}

