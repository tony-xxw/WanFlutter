import 'package:dio/dio.dart';

String _baseUrl = "https://www.wanandroid.com/";
int _connectTimeout = 15000;
int _receiveTimeout = 15000;
int _sendTimeout = 10000;
List<Interceptor> _interceptors = [];

setInitDio({
  int connectTimeout,
  int receiveTimeout,
  int sendTimeout,
  String baseUrl,
  List<Interceptor> interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

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

    /// 添加拦截器
    _interceptors.forEach((interceptor) {
      _dio.interceptors.add(interceptor);
    });
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
