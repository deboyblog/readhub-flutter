import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class BlockChainState {
  final List<News> blockChainNews;
  final bool fetching;

  BlockChainState({this.blockChainNews, this.fetching = true});

  BlockChainState copyWith({List<News> news, bool fetching}) {
    return BlockChainState(
        blockChainNews: blockChainNews ?? this.blockChainNews,
        fetching: fetching ?? this.fetching);
  }

  BlockChainState.initialState()
      : blockChainNews = [],
        fetching = true;
}
