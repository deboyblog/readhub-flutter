import 'package:flutter/foundation.dart';
import 'package:readhub/models/topic.dart';

@immutable
class TopicState {
  final List<Topic> topics;
  final bool fetching;

  TopicState({this.topics, this.fetching = true});

  TopicState copyWith({List<Topic> topics, bool fetching}) {
    return TopicState(
        topics: topics ?? this.topics,
        fetching: fetching ?? this.fetching);
  }

  TopicState.initialState()
      : topics = [],
        fetching = true;
}
