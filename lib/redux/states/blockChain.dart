import 'package:flutter/foundation.dart';
import 'package:readhub/models/news.dart';

@immutable
class BlockChainState {
  final List<News> blockChainNews;
  final bool isLoading;

  BlockChainState({this.blockChainNews, this.isLoading = true});

  BlockChainState copyWith({List<News> news, bool isLoading}) {
    return BlockChainState(
        blockChainNews: blockChainNews ?? this.blockChainNews,
        isLoading: isLoading ?? this.isLoading);
  }

  BlockChainState.initialState()
      : blockChainNews = [],
        isLoading = true;
}
