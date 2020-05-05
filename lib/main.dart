import 'package:example/global.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:flutter/material.dart';

void main() => Global.init().then((e) =>runApp(
    MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
