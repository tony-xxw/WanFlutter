import 'package:dio/dio.dart';

String _baseUrl = "https://www.wanandroid.com/";
int _connectTimeout = 15000;
int _receiveTimeout = 15000;
int _sendTimeout = 10000;

class DioUtils {
  /*
  懒汉式
  static final DioUtils _singleton = DioUtils._();

  static DioUtils get instance => DioUtils();

  factory DioUtils() => _singleton;

  DioUtils._() {
    BaseOptions _options = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout);

    _dio = Dio(_options);
  }
*/
  //饿汉式
  factory DioUtils() => _getInstance();

  static DioUtils get instance => _getInstance();
  static DioUtils _instance;

  DioUtils._internal() {
    BaseOptions _options = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout);

    _dio = Dio(_options);
  }

  static DioUtils _getInstance() {
    if (_instance == null) {
      _instance = DioUtils._internal();
    }
    return _instance;
  }

  static Dio _dio;

  Dio get dio => _dio;
}
