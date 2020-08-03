import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int _index;

  int get index => _index;

  setIndex(index) {
    _index = index;
    notifyListeners();
  }
}
