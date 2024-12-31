import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }
}
