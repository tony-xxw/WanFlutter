import 'package:wanflutter/entity/blogs.dart';
import 'package:wanflutter/net/net_service.dart';

class NetMangerService {
  // 文章
  static Future fetchArticles(int pageNum, {int cid}) async {
    await Future.delayed(Duration(seconds: 1)); //增加动效
    var response = await service.get('article/list/$pageNum/json',
        queryParameters: (cid != null ? {'cid': cid} : null));
    return response.data['datas']
        .map<Blogs>((item) => Blogs.fromJson(item))
        .toList();
  }
}
