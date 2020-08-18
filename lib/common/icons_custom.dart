import 'dart:math';

import 'package:flutter/cupertino.dart';

class IconsCustom {
  static const String _family = 'iconfont';

  IconsCustom._();

  static const IconData icon_category = IconData(0xe600, fontFamily: _family);
  static const IconData icon_collection = IconData(0xe601, fontFamily: _family);

  static const iconArray = [
    icon_category,
    icon_collection,
  ];

  IconData get fetchRandomAvatar =>
      iconArray[Random().nextInt(iconArray.length)];
}
