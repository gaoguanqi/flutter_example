import 'package:example/common/utils/utils.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends Dialog{


  final String title;
  final String conetnt;

  ConfirmDialog({
    Key key,
    this.title = '温馨提示',
    @required this.conetnt
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: size.width * 0.82,
            height: size.height * 0.42,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: _buildWidget(context),
          ),
        ),
      ),
    );
  }


  //使用 WillPopScope + Future.value(false); 屏蔽返回键。
  Future<bool> _onWillPop() async{
    return Future<bool>.value(false);
  }

  Widget _buildWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Text(title,style: TextStyle(
            color: Colors.black87,
            fontSize: duSetFontSize(18),
            fontWeight: FontWeight.w600,
          ),),
        ),
        Divider(height: 1,color: Colors.black12,),
        Container(
          margin: EdgeInsets.only(top: 14),
          child: Text(conetnt,style: TextStyle(
            color: Colors.black87,
            fontSize: duSetFontSize(14),
            fontWeight: FontWeight.w400,
          ),),
        ),
        Spacer(),
        Divider(height: 1,color: Colors.black12,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(onPressed: (){
                toastInfo(msg: '点击取消');
                Navigator.pop(context);
              }, child: Text('取消'),),
              FlatButton(onPressed: (){
                Navigator.pop(context);
                toastInfo(msg: '点击确定');
              }, child: Text('确定'),),
            ],
          ),
        ),
      ],
    );
  }
}