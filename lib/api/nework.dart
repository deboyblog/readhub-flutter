import 'package:dio/dio.dart';
import 'package:readhub/models/topic.dart';
import 'package:readhub/redux/actions/topic.dart';
import 'package:readhub/redux/states/topic.dart';
import 'package:readhub/redux/view_models/main.dart';

class Network {
  final String baseUrl;
  Network({String baseUrl})
      : this.baseUrl = baseUrl ?? 'https://api.readhub.cn/';

  Future<void> fetchTopics({int pageSize = 20, bool more = false}) async {
    StoreContainer.global.dispatch(UpdateTopicFetching(fetching: true));
    int lastCursor = -1;
    TopicState topicState = StoreContainer.global.state.topics;
    if (more && topicState.topics.length != 0) {
      lastCursor = topicState.topics[topicState.topics.length - 1].order ?? -1;
    }
    Response data = await Dio().get('${baseUrl}topic',
        queryParameters: {'lastCursor': lastCursor, 'pageSize': pageSize});
    List<Topic> list = lastCursor > 0 ? topicState.topics : [];
    List<dynamic> dataList = data.data['data'];
    list.addAll(dataList.map((data) => Topic.fromJson(data)).toList());
    StoreContainer.global.dispatch(UpdateTopics(payload: list));
  }
}
