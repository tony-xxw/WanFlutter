import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:sprintf/sprintf.dart';
import 'package:wanflutter/common/common.dart';

import 'error_handle.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    final String accessToken = SpUtil.getString(Constant.accessToken);
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options);
  }
}

class LoggingInterceptor extends Interceptor {
  DateTime _startTime;
  DateTime _endTime;

  @override
  Future onRequest(RequestOptions options) {
    _startTime = DateTime.now();
    print('----------Start----------');
    if (options.queryParameters.isEmpty) {
      print('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      print('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    print('RequestMethod: ' + options.method);
    print('RequestHeaders:' + options.headers.toString());
    print('RequestContentType: ${options.contentType}');
    print('RequestData: ${options.data.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    _endTime = DateTime.now();
    int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      print('ResponseCode: ${response.statusCode}');
    } else {
      print('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    print(response.data.toString());
    print('----------End: $duration 毫秒----------');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print('----------Error-----------');
    return super.onError(err);
  }
}

class AdapterInterceptor extends Interceptor {
  static const String _kMsg = 'msg';
  static const String _kSlash = '\'';
  static const String _kMessage = 'message';

  static const String _kDefaultText = '\"无返回信息\"';
  static const String _kNotFound = '未找到查询信息';

  static const String _kFailureFormat = '{\"code\":%d,\"message\":\"%s\"}';
  static const String _kSuccessFormat =
      '{\"code\":0,\"data\":%s,\"message\":\"\"}';

  @override
  Future onResponse(Response response) {
    Response r = adapterData(response);
    return super.onResponse(r);
  }

  @override
  Future onError(DioError err) {
    if (err.response != null) {
      adapterData(err.response);
    }
    return super.onError(err);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data?.toString() ?? '';

    /// 成功时，直接格式化返回
    if (response.statusCode == ExceptionHandle.success ||
        response.statusCode == ExceptionHandle.success_not_content) {
      if (content.isEmpty) {
        content = _kDefaultText;
      }
      result = sprintf(_kSuccessFormat, [content]);
      response.statusCode = ExceptionHandle.success;
    } else {
      if (response.statusCode == ExceptionHandle.not_found) {
        /// 错误数据格式化后，按照成功数据返回
        result = sprintf(_kFailureFormat, [response.statusCode, _kNotFound]);
        response.statusCode = ExceptionHandle.success;
      } else {
        if (content.isEmpty) {
          // 一般为网络断开等异常
          result = content;
        } else {
          String msg;
          try {
            content = content.replaceAll("\\", '');
            if (_kSlash == content.substring(0, 1)) {
              content = content.substring(1, content.length - 1);
            }
            Map<String, dynamic> map = jsonDecode(content);
            if (map.containsKey(_kMessage)) {
              msg = map[_kMessage];
            } else if (map.containsKey(_kMsg)) {
              msg = map[_kMsg];
            } else {
              msg = '未知异常';
            }
            result = sprintf(_kFailureFormat, [response.statusCode, msg]);
            // 401 token失效时，单独处理，其他一律为成功
            if (response.statusCode == ExceptionHandle.unauthorized) {
              response.statusCode = ExceptionHandle.unauthorized;
            } else {
              response.statusCode = ExceptionHandle.success;
            }
          } catch (e) {
            print('异常信息：$e');
            // 解析异常直接按照返回原数据处理（一般为返回500,503 HTML页面代码）
            result = sprintf(_kFailureFormat,
                [response.statusCode, '服务器异常(${response.statusCode})']);
          }
        }
      }
    }
    response.data = result;
    return response;
  }
}
