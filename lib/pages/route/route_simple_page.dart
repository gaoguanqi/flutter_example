import 'package:example/common/router/routes.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:flutter/material.dart';

class RouteSimplePage extends StatefulWidget {


  @override
  _RouteSimplePageState createState() => _RouteSimplePageState();
}

class _RouteSimplePageState extends State<RouteSimplePage> {

  String resultData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(resultData),
          FlatButton(onPressed: () async{
//            String result = await ExtendedNavigator.rootNavigator.pushRouteDataPageRoute(data: '传递的数据啊啊啊');
//            toastInfo(msg: '接收返回数据::$result');


//            String result = await ExtendedNavigator.rootNavigator.pushNamed(Routes.routeDataPageRoute,arguments: '传递的数据啊啊啊');
//            toastInfo(msg: '接收返回数据::$result');

//            String result = await Navigator.of(context).pushNamed(RouteName.routeDataPage,arguments: '传递的数据啊啊啊');
//            toastInfo(msg: '接收返回数据');

             var map = await Navigator.of(context).pushNamed(RouteName.routeDataPage,arguments: {
              'data' : '传递的数据啊啊啊',
            });

             if(map != null){
               setState(() {

                 resultData = (map as Map)['result'];
                 if(resultData.isNotEmpty){
                   toastInfo(msg: '接收返回数据:${resultData}');
                 }
               });
             }



          }, child: Text('button'),),
        ],
      ),
    );
  }
}

