import 'package:example/pages/provider/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider1Page extends StatelessWidget {
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
      body: Text('data'),
    );
  }
}
