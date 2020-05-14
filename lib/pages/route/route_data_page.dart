import 'package:example/common/widgets/toast.dart';
import 'package:flutter/material.dart';
class RouteDataPage extends StatelessWidget {


  Object arguments;
  String data = '';

  RouteDataPage({Key key,this.arguments}):super(key: key);

  @override
  Widget build(BuildContext context) {
//    Map args = ModalRoute.of(context).settings.arguments;
    Map args = arguments;
    if(args.isNotEmpty){
      data = args['data'];
    }

    toastInfo(msg: 'args >>${args.toString()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
//          ExtendedNavigator.rootNavigator.pop<String>('返回的数据呀呀呀');
            Navigator.pop(context,{
              'result': '返回的数据哟哟',
            });
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
