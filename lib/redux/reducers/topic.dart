import 'package:readhub/redux/actions/main.dart';
import 'package:readhub/redux/actions/topic.dart';
import 'package:readhub/redux/states/topic.dart';

TopicState reducer(TopicState state, ActionType action) {
  if (action is UpdateTopics) {
    return state.copyWith(topics: action.payload, isLoading: false);
  }
  return state;
}
