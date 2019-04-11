import 'package:flutter/foundation.dart';
import 'package:readhub/models/topic.dart';

@immutable
class TopicState {
  final List<Topic> topics;
  final bool isLoading;

  TopicState({this.topics, this.isLoading = true});

  TopicState copyWith({List<Topic> topics, bool isLoading}) {
    return TopicState(
        topics: topics ?? this.topics,
        isLoading: isLoading ?? this.isLoading);
  }

  TopicState.initialState()
      : topics = [],
        isLoading = true;
}
