import 'dart:math';

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}

class ImageUtils {
  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    print('path+$name.${format.value}');
    return 'assets/images/$name.${format.value}';
  }
}
