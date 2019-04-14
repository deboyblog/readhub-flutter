import 'package:readhub/models/news.dart';
import 'package:readhub/redux/actions/main.dart';

class UpdateNews extends ActionType {
  final List<News> news;
  UpdateNews({this.news}) : super(payload: news);
}
class UpdateNewsFetching extends ActionType {
  final bool fetching;
  UpdateNewsFetching({this.fetching}) : super(payload: fetching);
}

class UpdateNewsTotal extends ActionType {
  final int total;
  UpdateNewsTotal({this.total}) : super(payload: total);
}
