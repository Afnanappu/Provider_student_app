import 'package:flutter/material.dart';

class IsGridOrSearchController extends ChangeNotifier {
  bool isGrid = false;
  bool isSearchOn = false;

  void toggleIsGrid() {
    isGrid = !isGrid;
    notifyListeners();
  }

  void toggleIsSearchOn() {
    isSearchOn = !isSearchOn;
    notifyListeners();
  }
}
