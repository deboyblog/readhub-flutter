import 'package:readhub/models/news.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:redux/redux.dart';
import 'package:readhub/redux/states/main.dart';

class TechViewModel extends ViewModel {
  TechViewModel(Store<ReduxState> store) : super(store);

  List<News> get news => this.store.state.techNews.techNews;

  int get total => this.store.state.techNews.total;

  bool get fetching => this.store.state.techNews.fetching;

  int get firstFetchingTimestamp =>
      this.store.state.techNews.firstFetchingTimestamp;

  bool get isEnd =>
      this.store.state.techNews.total >= 0 &&
      this.store.state.techNews.techNews.length >=
          this.store.state.techNews.total;
}
