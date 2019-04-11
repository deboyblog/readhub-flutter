import 'package:readhub/models/topic.dart';
import 'package:readhub/redux/actions/main.dart';

class UpdateTopics extends ActionType {
  final List<Topic> payload;
  UpdateTopics({this.payload}) : super(payload: payload);
}
class UpdateTopicFetching extends ActionType {
  final bool fetching;
  UpdateTopicFetching({this.fetching}) : super(payload: fetching);
}
