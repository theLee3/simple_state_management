import 'package:flutter/material.dart';

const _colors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.yellow,
];

class AppState extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void incrementCounter() {
    _count++;
    _backgroundColor = _colors[count % 5];
    notifyListeners();
  }

  Color _backgroundColor = Colors.blue;
  Color get backgroundColor => _backgroundColor;

  Color get textColor =>
      _backgroundColor == Colors.yellow ? Colors.black87 : Colors.white;
}
