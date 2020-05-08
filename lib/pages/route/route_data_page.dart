import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
class RouteDataPage extends StatelessWidget {


  final String data;

  RouteDataPage({Key key,this.data}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          ExtendedNavigator.rootNavigator.pop<String>('返回的数据呀呀呀');
        }),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Text(data),
    );
  }
}
