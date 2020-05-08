import 'package:flutter/material.dart';
class Provider2Page extends StatelessWidget {

  Provider2Page({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page 2'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}
