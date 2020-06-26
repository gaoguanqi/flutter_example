import 'package:example/common/widgets/toast.dart';
import 'package:example/pages/provider/counter.dart';
import 'package:example/pages/provider/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider1Page extends StatelessWidget {

  TextEditingController _textEditingController = TextEditingController();

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Provider.of<ThemeModel>(context, listen: false).reverse();
            },
            icon: Consumer<ThemeModel>(
              builder: (context, t, child) {
                Icon icon = Icon(Icons.brightness_3, color: Colors.grey,);
                if (t.currentType == ThemeType.light) {
                  icon = Icon(Icons.brightness_3, color: Colors.grey,);
                } else {
                  icon = Icon(Icons.wb_sunny, color: Colors.white,);
                }
                return icon;
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Consumer<Counter>(builder: (context,t,child){
                  return Text(t.count.toString());
                }),
                IconButton(icon: Icon(Icons.add),onPressed: (){
                  Provider.of<Counter>(context,listen: false).add(_count+=1);
                },),
              ],
            ),

            TextField(
              controller: _textEditingController,
            ),
            
            RaisedButton(child: Text('button'),onPressed: (){
              toastInfo(msg: _textEditingController.text);

            },),
            
          ],
        ),
      ),
    );
  }
}
