import 'package:flutter/foundation.dart';
import 'package:readhub/models/topic.dart';

@immutable
class TopicState {
  final List<Topic> topics;
  final bool fetching;
  final int total;

  TopicState({this.topics, this.total = 0, this.fetching = true});

  TopicState copyWith({List<Topic> topics, int total, bool fetching}) {
    return TopicState(
        topics: topics ?? this.topics,total: total ?? this.total, fetching: fetching ?? this.fetching);
  }

  TopicState.initialState()
      : topics = [],
        total = 0,
        fetching = true;
}
