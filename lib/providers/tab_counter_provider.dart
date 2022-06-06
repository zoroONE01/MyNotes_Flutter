import 'package:flutter/material.dart';

class TabCounterProvider with ChangeNotifier {
  int _counter = 0;

  int increment() {
    _counter < 2 ? _counter++ : _counter;
    notifyListeners();
    return _counter;
  }

  int decrement() {
    _counter > 0 ? _counter-- : _counter;
    notifyListeners();
    return _counter;
  }

  int toLastPage() {
    _counter = 2;
    notifyListeners();
    return _counter;
  }

  int get currentCount => _counter;
}
