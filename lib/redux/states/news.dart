import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class NewsState {
  final List<News> news;
  final bool isLoading;

  NewsState({this.news, this.isLoading = true});

  NewsState copyWith({List<News> news, bool isLoading}) {
    return NewsState(
        news: news ?? this.news,
        isLoading: isLoading ?? this.isLoading);
  }

  NewsState.initialState()
      : news = [],
        isLoading = true;
}
