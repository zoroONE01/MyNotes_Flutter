import 'package:flutter/material.dart';

class BotNavProvider with ChangeNotifier {
  int _counter = 0;
  int _value = 0;

  set counter(int value) {
    _value = _counter;
    _counter = value;
    notifyListeners();
  }

  void returnTab(){
    _counter = _value;
    _value = 2;
    notifyListeners();
  }

  int get value => _value;

  int get currentCount => _counter;
}
