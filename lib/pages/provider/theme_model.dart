import 'package:flutter/material.dart';

enum ThemeType{
  light,
  dak,
}

class ThemeModel extends ChangeNotifier{
  ThemeData themeData;
  ThemeType currentType;

  ThemeModel(ThemeType type){
    currentType = type;
    if(type == ThemeType.dak){
      themeData = ThemeData.dark();
    }else{
      themeData = ThemeData.light();
    }
  }

  void reverse(){
    if(currentType == ThemeType.light){
      _update(ThemeType.dak);
    }else{
      _update(ThemeType.light);
    }
  }

  void _update(ThemeType type){
    currentType = type;
    if(type == ThemeType.light){
      themeData = ThemeData.light();
//      currentIcon = Icon(Icons.brightness_4,color: Colors.black45,);
    }else{
      themeData = ThemeData.dark();
//      currentIcon = Icon(Icons.wb_sunny,color: Colors.white,);
    }
    notifyListeners();
  }
}