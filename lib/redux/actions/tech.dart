import 'package:readhub/models/news.dart';
import 'package:readhub/redux/actions/main.dart';

class UpdateTech extends ActionType {
  final List<News> news;
  UpdateTech({this.news}) : super(payload: news);
}
class UpdateTechFetching extends ActionType {
  final bool fetching;
  UpdateTechFetching({this.fetching}) : super(payload: fetching);
}

class UpdateTechTotal extends ActionType {
  final int total;
  UpdateTechTotal({this.total}) : super(payload: total);
}
