

import 'package:flutter/foundation.dart';

class DemoProvider extends ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
