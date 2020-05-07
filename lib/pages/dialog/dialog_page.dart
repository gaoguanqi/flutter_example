import 'package:example/common/utils/screen.dart';
import 'package:example/common/widgets/toast.dart';
import 'package:example/pages/dialog/confirm_dialog.dart';
import 'package:example/pages/dialog/entity/mtag_entity.dart';
import 'package:example/pages/dialog/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {

  List<MtagEntity> _data;
  MtagEntity entity;

  @override
  void initState() {
    super.initState();
    _data = [];
    for(int i = 0; i < 22; i++){
        entity =  MtagEntity('item---$i',false);
      _data.add(entity);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('dialog'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(onPressed: (){
              _handleLoading(context);
            }, child: Text('loading dialog'),),
            MaterialButton(onPressed: (){
              _handleMessage(context);
            },child: Text('message dialog'),),
            RaisedButton(onPressed: (){
              _handleBottom(context,_data);
            },child: Text('buttom dialog'),)
          ],
        ),
      )
    );
  }




  void _handleLoading(BuildContext context) {
    print('loading');
    showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return LoadingDialog(text: '请稍后...',);
      }
    );
  }

  void _handleMessage(BuildContext context) {
    print('message');
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return ConfirmDialog(conetnt: '内容内容内容内容内容内容内容',);
        }
    );
  }











  ///----------------------------------------------------------
  void _handleBottom(BuildContext context,List<MtagEntity> data) {
    print('bottom');
    showModalBottomSheet(context: context,
        builder: (BuildContext context){
          return SafeArea(
              child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text('title',style: TextStyle(color: Colors.black,fontSize: duSetFontSize(18),fontWeight: FontWeight.w600),),
                      height: duSetHeight(55),
                    ),
                    Divider(height: 1,color: Colors.black12,),
                    Expanded(
                      child: Container(
                        child: ListView.separated(itemBuilder: (BuildContext context,int index){
                          return Container(
                            color: data[index].isTag ? Colors.red: Colors.white,
                            alignment: Alignment.center,
                            height: duSetHeight(48),
                            child: MaterialButton(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(_data[index].name,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: duSetFontSize(14),
                                  fontWeight: FontWeight.w400,
                                ),),
                                width: double.infinity,
                              ),
                              onPressed: (){
                                toastInfo(msg: data[index].name);
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                          itemCount: _data.length,
                          separatorBuilder: (BuildContext context,int index){
                            return Divider(height: 1,color: Colors.black12,);
                          },
                        ),
                      ),
                      flex: 1,),
                    MaterialButton(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('取消',style: TextStyle(
                          color: Colors.blue,
                          fontSize: duSetFontSize(16),
                          fontWeight: FontWeight.w600,
                        ),),
                        width: double.infinity,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
