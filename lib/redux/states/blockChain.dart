import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class BlockChainState {
  final List<News> blockChainNews;
  final bool fetching;
  final int total;
  final int firstFetchingTimestamp;

  BlockChainState(
      {this.blockChainNews,
      this.fetching = true,
      this.total,
      this.firstFetchingTimestamp});

  BlockChainState copyWith(
      {List<News> blockChainNews,
      bool fetching,
      int total,
      int firstFetchingTimestamp}) {
    return BlockChainState(
      blockChainNews: blockChainNews ?? this.blockChainNews,
      fetching: fetching ?? this.fetching,
      total: total ?? this.total,
      firstFetchingTimestamp:
          firstFetchingTimestamp ?? this.firstFetchingTimestamp,
    );
  }

  BlockChainState.initialState()
      : blockChainNews = [],
        total = -1,
        firstFetchingTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch,
        fetching = true;
}
