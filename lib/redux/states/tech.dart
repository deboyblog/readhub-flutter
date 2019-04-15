import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class TechState {
  final List<News> techNews;
  final bool fetching;
  final int total;
  final int firstFetchingTimestamp;

  TechState(
      {this.techNews,
      this.fetching = true,
      this.total,
      this.firstFetchingTimestamp});

  TechState copyWith(
      {List<News> techNews,
      bool fetching,
      int total,
      int firstFetchingTimestamp}) {
    return TechState(
      techNews: techNews ?? this.techNews,
      fetching: fetching ?? this.fetching,
      total: total ?? this.total,
      firstFetchingTimestamp:
          firstFetchingTimestamp ?? this.firstFetchingTimestamp,
    );
  }

  TechState.initialState()
      : techNews = [],
        total = -1,
        firstFetchingTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch,
        fetching = true;
}
