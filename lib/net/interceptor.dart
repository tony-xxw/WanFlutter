import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
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
    LogUtil.v('----------Start----------');
    if (options.queryParameters.isEmpty) {
      LogUtil.v('RequestUrl: ' + options.baseUrl + options.path);
    } else {
      LogUtil.v('RequestUrl: ' +
          options.baseUrl +
          options.path +
          '?' +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    LogUtil.v('RequestMethod: ' + options.method);
    LogUtil.v('RequestHeaders:' + options.headers.toString());
    LogUtil.v('RequestContentType: ${options.contentType}');
    LogUtil.v('RequestData: ${options.data.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    _endTime = DateTime.now();
    int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      LogUtil.v('ResponseCode: ${response.statusCode}');
    } else {
      LogUtil.v('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    LogUtil.v(response.data.toString());
    LogUtil.v('----------End: $duration 毫秒----------');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    LogUtil.v('----------Error-----------');
    return super.onError(err);
  }
}


