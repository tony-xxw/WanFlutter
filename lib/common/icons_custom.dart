import 'dart:math';

import 'package:flutter/cupertino.dart';

class IconsCustom {
  static const String _family = 'iconfont';

  IconsCustom._();

  static const IconData icontouxiang = IconData(0xe67b, fontFamily: _family);
  static const IconData icontouxiangnvhai_ =
      IconData(0xe60b, fontFamily: _family);
  static const IconData icon_category = IconData(0xe600, fontFamily: _family);
  static const IconData icon_collection = IconData(0xe601, fontFamily: _family);
  static const IconData iconguanlian = IconData(0xe60a, fontFamily: _family);
  static const IconData icontouxiangnanhai =
      IconData(0xe60f, fontFamily: _family);

  static const iconArray = [
    icontouxiang,
    icontouxiangnvhai_,
    icon_category,
    icon_collection,
    iconguanlian,
    icontouxiangnanhai
  ];

  IconData get fetchRandomAvatar =>
      iconArray[Random().nextInt(iconArray.length)];
}
