import 'package:auto_route/auto_route.dart';
import 'package:example/common/router/router.gr.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:flutter/material.dart';
class RouteSimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Text('data'),
          FlatButton(onPressed: () async{
            String result = await ExtendedNavigator.rootNavigator.pushRouteDataPageRoute(data: '传递的数据啊啊啊');
            toastInfo(msg: '接收返回数据::$result');
          }, child: Text('button'),),
        ],
      ),
    );
  }
}
