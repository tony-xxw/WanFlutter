import 'package:wanflutter/entity/articles.dart';
import 'package:wanflutter/net/dio_service.dart';
import 'package:wanflutter/provider/base/view_state_refresh_list_modal.dart';

class ProjectModal extends ViewStateRefreshListModel {

  @override
  Future<List> loadData({int page}) async {
    return await DioService.fetchProject(page);
  }

  @override
  onCompleted(List data) {
    return super.onCompleted(data);
  }
}
