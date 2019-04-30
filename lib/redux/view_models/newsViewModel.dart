import 'package:readhub/models/news.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:redux/redux.dart';
import 'package:readhub/redux/states/main.dart';

class NewsViewModel extends ViewModel {
  NewsViewModel(Store<ReduxState> store) : super(store);

  List<News> get news => this.store.state.news.news;

  int get total => this.store.state.news.total;

  bool get fetching => this.store.state.news.fetching;

  int get firstFetchingTimestamp =>
      this.store.state.news.firstFetchingTimestamp;
  bool get isEnd =>
      this.store.state.news.total >= 0 &&
      this.store.state.news.news.length >= this.store.state.news.total;
}
