import 'package:dio/dio.dart';

class DioUtils {
  static final DioUtils _singleton = DioUtils._();

  factory DioUtils() => _singleton;

  DioUtils._() {
    BaseOptions _options = BaseOptions();
  }
}
