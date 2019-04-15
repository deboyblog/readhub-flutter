import 'package:readhub/models/news.dart';
import 'package:readhub/redux/actions/main.dart';

class UpdateBlockChain extends ActionType {
  final List<News> blockChainNews;
  UpdateBlockChain({this.blockChainNews}) : super(payload: blockChainNews);
}
class UpdateBlockChainFetching extends ActionType {
  final bool fetching;
  UpdateBlockChainFetching({this.fetching}) : super(payload: fetching);
}

class UpdateBlockChainTotal extends ActionType {
  final int total;
  UpdateBlockChainTotal({this.total}) : super(payload: total);
}
