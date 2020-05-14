import 'package:example/common/router/routes.dart';
import 'package:example/global.dart';
import 'package:example/pages/error/ErrorPage.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:example/pages/login/player_login_page.dart';
import 'package:example/pages/provider/providers.dart';
import 'package:example/pages/provider/theme_model.dart';
import 'package:example/pages/route/route_data_page.dart';
import 'package:example/pages/route/route_simple_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) =>runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter example',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeModel>(context,listen: true).themeData,
//      onGenerateRoute: Router.generateRoute,
//      initialRoute: RouteName.home,
//      builder: ExtendedNavigator<AppRouter>(
//          initialRoute: Routes.indexPageRoute,
//          router: AppRouter(),
//          guards: [AuthGuard()],
//      ),

      // 注册路由表
//        routes: {
//          RouteName.indexPage: (context) => IndexPage(),
//          RouteName.routeSimplePage: (context) => RouteSimplePage(),
//          RouteName.routeDataPage: (context) => RouteDataPage(),
//          RouteName.playerLoginPage: (context) => PlayerLoginPage(),
//        },

      // 默认路由
        initialRoute: RouteName.indexPage,
      // 路由拦截器  当通过Navigation.of(context).pushNamed跳转路由时， 在routes查找不到时，会调用该方法
        onGenerateRoute: onGenerateRoute,
    // 未知页面，404
        onUnknownRoute: (RouteSettings setting) { // 未知页面，404
          String name = setting.name;
          print("未匹配到路由:$name");
          return new MaterialPageRoute(builder: (context) {
            return ErrorPage();
          });
        }
    );
  }
}
