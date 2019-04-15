import 'package:dio/dio.dart';
import 'package:readhub/models/news.dart';
import 'package:readhub/models/topic.dart';
import 'package:readhub/models/topicDetail.dart';
import 'package:readhub/redux/actions/news.dart';
import 'package:readhub/redux/actions/tech.dart';
import 'package:readhub/redux/actions/topic.dart';
import 'package:readhub/redux/states/news.dart';
import 'package:readhub/redux/states/tech.dart';
import 'package:readhub/redux/states/topic.dart';
import 'package:readhub/redux/view_models/main.dart';

final baseUrl = 'https://api.readhub.cn';

class Network {
  static Future<void> fetchTopics(
      {int pageSize = 20, bool more = false}) async {
    StoreContainer.global.dispatch(UpdateTopicFetching(fetching: true));
    int lastCursor = -1;
    TopicState topicState = StoreContainer.global.state.topics;
    if (more && topicState.topics.length != 0) {
      lastCursor = topicState.topics[topicState.topics.length - 1].order ?? -1;
    }
    Response data = await Dio().get('$baseUrl/topic',
        queryParameters: {'lastCursor': lastCursor, 'pageSize': pageSize});
    List<Topic> list = lastCursor > 0 ? topicState.topics : [];
    List<dynamic> dataList = data.data['data'];
    list.addAll(dataList.map((data) => Topic.fromJson(data)).toList());
    StoreContainer.global
        .dispatch(UpdateTopicTotal(total: data.data['totalItems']));
    StoreContainer.global.dispatch(UpdateTopics(topics: list));
  }

  static Future<TopicDetail> fetchTopicDetail({String id}) async {
    StoreContainer.global.dispatch(UpdateTopicFetching(fetching: true));
    Response data = await Dio().get('$baseUrl/topic/$id');
    dynamic topicDetail = data.data;
    if (topicDetail['timeline'] == null) {
      topicDetail['timeline'] = {
        'id': null,
        'topics': [],
        'commonEntities': []
      };
    }
    return TopicDetail.fromJson(topicDetail);
  }

  static Future<void> fetchNews({int pageSize = 10, bool more = false}) async {
    StoreContainer.global.dispatch(UpdateNewsFetching(fetching: true));
    NewsState newsState = StoreContainer.global.state.news;
    int lastCursor = more
        ? newsState.news[newsState.news.length - 1].publishDate
            .toUtc()
            .millisecondsSinceEpoch
        : newsState.firstFetchingTimestamp;
    Response data = await Dio().get('$baseUrl/news',
        queryParameters: {'lastCursor': lastCursor, 'pageSize': pageSize});
    List<News> list = more ? newsState.news : [];
    List<dynamic> dataList = data.data['data'];
    list.addAll(dataList.map((data) => News.fromJson(data)).toList());
    StoreContainer.global
        .dispatch(UpdateNewsTotal(total: data.data['totalItems']));
    StoreContainer.global.dispatch(UpdateNews(news: list));
  }

  static Future<void> fetchTech({int pageSize = 10, bool more = false}) async {
    StoreContainer.global.dispatch(UpdateTechFetching(fetching: true));
    TechState techState = StoreContainer.global.state.techNews;
    int lastCursor = more
        ? techState.techNews[techState.techNews.length - 1].publishDate
            .toUtc()
            .millisecondsSinceEpoch
        : techState.firstFetchingTimestamp;
    Response data = await Dio().get('$baseUrl/technews',
        queryParameters: {'lastCursor': lastCursor, 'pageSize': pageSize});
    List<News> list = more ? techState.techNews : [];
    List<dynamic> dataList = data.data['data'];
    list.addAll(dataList.map((data) => News.fromJson(data)).toList());
    StoreContainer.global
        .dispatch(UpdateTechTotal(total: data.data['totalItems']));
    StoreContainer.global.dispatch(UpdateTech(news: list));
  }
}
