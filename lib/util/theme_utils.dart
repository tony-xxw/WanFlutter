import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getBackgroundColors(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }
}
