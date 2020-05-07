import 'package:example/global.dart';
import 'package:example/pages/index/index_page.dart';
import 'package:example/pages/provider/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) =>runApp(
      ChangeNotifierProvider<ThemeModel>(
        create: (_){
          return ThemeModel(ThemeType.light);
        },
        child: MyApp(),
      ),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter example',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeModel>(context,listen: true).themeData,
      home: IndexPage(),
    );
  }
}
