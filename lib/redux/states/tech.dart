import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class TechState {
  final List<News> techNews;
  final bool fetching;

  TechState({this.techNews, this.fetching = true});

  TechState copyWith({List<News> news, bool fetching}) {
    return TechState(
        techNews: techNews ?? this.techNews,
        fetching: fetching ?? this.fetching);
  }

  TechState.initialState()
      : techNews = [],
        fetching = true;
}
