//import 'package:example/common/utils/utils.dart';

///路由挡板，用于阻止导航到未登录页面
//class AuthGuard extends RouteGuard{
//  @override
//  Future<bool> canNavigate(ExtendedNavigatorState<RouterBase> navigator, String routeName, Object arguments) async{
//    var isAuth = await isAuthenticated();
//    if(isAuth == false){
//      ExtendedNavigator.rootNavigator.pushNamed(Routes.playerLoginPageRoute);
//    }
//    return isAuth;
//  }
//}