import 'package:wanflutter/entity/articles.dart';
import 'package:wanflutter/entity/banner.dart';
import 'package:wanflutter/net/net_service.dart';

class DioService {
  // 最新波尔克
  static Future fetchArticles(int page, {int cid}) async {
    await Future.delayed(Duration(seconds: 1)); //增加动效
    var response = await service.get('article/list/$page/json',
        queryParameters: (cid != null ? {'cid': cid} : null));
    return response.data['datas']
        .map<Article>((item) => Article.fromJson(item))
        .toList();
  }

  //顶置文章
  static Future fetchTopArticles() async {
    var response = await service.get("article/top/json");
    return response.data
        .map<Article>((item) => Article.fromJson(item))
        .toList();
  }

  //获取轮播图
  static Future fetchBanners() async {
    var response = await service.get("banner/json");
    return response.data.map<Banner>((item) => Banner.fromJson(item)).toList();
  }
}
