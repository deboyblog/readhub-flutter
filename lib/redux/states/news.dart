import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class NewsState {
  final List<News> news;
  final bool fetching;
  final int total;
  final int firstFetchingTimestamp;

  NewsState({this.news, this.fetching = true, this.total, this.firstFetchingTimestamp});

  NewsState copyWith({List<News> news, bool fetching, int total, int firstFetchingTimestamp}) {
    return NewsState(
        news: news ?? this.news,
        fetching: fetching ?? this.fetching,
        total: total ?? this.total,
        firstFetchingTimestamp: firstFetchingTimestamp ?? this.firstFetchingTimestamp
        );
  }

  NewsState.initialState()
      : news = [],
        total = 0,
        fetching = true,
        firstFetchingTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch
        ;
}
