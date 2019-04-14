import 'package:readhub/models/topic.dart';
import 'package:readhub/redux/actions/main.dart';

class UpdateTopics extends ActionType {
  final List<Topic> topics;
  UpdateTopics({this.topics}) : super(payload: topics);
}
class UpdateTopicFetching extends ActionType {
  final bool fetching;
  UpdateTopicFetching({this.fetching}) : super(payload: fetching);
}

class UpdateTopicTotal extends ActionType {
  final int total;
  UpdateTopicTotal({this.total}) : super(payload: total);
}
