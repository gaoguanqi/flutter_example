import 'dart:async';

import 'dart:math';


/// 检查是否有 token
Future<bool> isAuthenticated() async {
  return Future.delayed(Duration(seconds: 100),(){
//    return Random.secure().nextBool();
    return true;
  });
}

