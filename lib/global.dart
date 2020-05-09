import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Global{

  static Future init() async{

    //运行初始
    WidgetsFlutterBinding.ensureInitialized();

    //竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // android 状态栏为透明的沉浸
    if(Platform.isAndroid){
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}