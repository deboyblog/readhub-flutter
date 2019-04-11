import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class TechState {
  final List<News> techNews;
  final bool isLoading;

  TechState({this.techNews, this.isLoading = true});

  TechState copyWith({List<News> news, bool isLoading}) {
    return TechState(
        techNews: techNews ?? this.techNews,
        isLoading: isLoading ?? this.isLoading);
  }

  TechState.initialState()
      : techNews = [],
        isLoading = true;
}
