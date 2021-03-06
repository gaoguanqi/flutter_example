import 'package:flutter/material.dart';

class Counter with ChangeNotifier{

  int _count = 0;

  int get count => _count;

  set count(int count) {
    _count = count;
  }

  void add(int count){
    this._count = count;
    notifyListeners();
  }

}