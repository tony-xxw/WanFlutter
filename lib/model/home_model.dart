import 'package:wanflutter/entity/articles.dart';
import 'package:wanflutter/entity/banner.dart';
import 'package:wanflutter/net/dio_service.dart';
import 'package:wanflutter/provider/view_state_refresh_list_modal.dart';

class HomeModel extends ViewStateRefreshListModel {
  List<Banner> _banner;
  List<Article> _topArticle;

  List<Banner> get banners => _banner;

  List<Article> get articles => _topArticle;

  @override
  Future<List> loadData({int page}) async {
    List<Future> futures = [];
    if (page == ViewStateRefreshListModel.pageNumFirst) {
      futures.add(DioService.fetchBanners());
      futures.add(DioService.fetchTopArticles());
    }
    futures.add(DioService.fetchArticles(page));
    var response = await Future.wait(futures);
    if (page == ViewStateRefreshListModel.pageNumFirst) {
      _banner = response[0];
      _topArticle = response[1];
      return response[2];
    } else {
      return response[0];
    }
  }

  @override
  onCompleted(List data) {
    return super.onCompleted(data);
  }
}
