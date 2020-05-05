import 'package:flutter/foundation.dart';

///本地图片路径
String imagePath(@required String name,[String type = 'png']){
  return 'assets/images/$name.$type';
}