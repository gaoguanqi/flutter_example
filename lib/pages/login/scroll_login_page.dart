import 'package:example/common/utils/screen.dart';
import 'package:flutter/material.dart';
class ScrollLoginPage extends StatefulWidget {
  @override
  _ScrollLoginPageState createState() => _ScrollLoginPageState();
}

class _ScrollLoginPageState extends State<ScrollLoginPage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: duSetHeight(240),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.yellow[50],
                  Colors.yellow[300],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              color: Colors.blue[100],
              child: Column(
                children: <Widget>[

                  Container(
                    height: duSetHeight(100),
                    color: Colors.deepOrange,
                  ),
                  Container(
                    height: duSetHeight(100),
                    color: Colors.blue,
                  ),
                  Container(
                    height: duSetHeight(100),
                    color: Colors.green,
                  ),
                  Container(
                    height: duSetHeight(120),
                    color: Colors.black54,
                  ),
                  Container(
                    height: duSetHeight(60),
                    color: Colors.cyan,
                    child: Center(
                      child: Text('同意协议',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
