import 'package:dio/dio.dart';
import 'package:readhub/models/topic.dart';
import 'package:readhub/redux/actions/topic.dart';
import 'package:readhub/redux/view_models/main.dart';

class Network {
  final String baseUrl;
  Network({String baseUrl})
      : this.baseUrl = baseUrl ?? 'https://api.readhub.cn/';

  void fetchTopics({int lastCursor, int pageSize = 20}) async {
    print('${baseUrl}topic');
    Response data = await Dio().get('${baseUrl}topic', queryParameters: {
      'lastCursor': (lastCursor != null && lastCursor > 0) ? lastCursor : '',
      'pageSize': pageSize
    });
    List<dynamic> dataList = data.data['data'];
    List<Topic> list = dataList.map((data) => Topic.fromJson(data)).toList();
    StoreContainer.global.dispatch(UpdateTopics(payload: list));
  }
}
