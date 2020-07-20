import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:wanflutter/common/common.dart';

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

class TokenInterceptor extends Interceptor {
  Dio _tokenDio = Dio();

  Future<String> getToken() async {
    final Map<String, String> params = <String, String>{};
    params['refresh_token'] = SpUtil.getString(Constant.refreshToken);
    try{
//      _tokenDio.options = Di
    }catch(e){
      LogUtil.e("刷新token失败");
    }
  }
}
