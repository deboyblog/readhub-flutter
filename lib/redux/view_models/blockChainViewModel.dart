import 'package:readhub/models/news.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:redux/redux.dart';
import 'package:readhub/redux/states/main.dart';

class BlockChainViewModel extends ViewModel {
  BlockChainViewModel(Store<ReduxState> store) : super(store);

  List<News> get news => this.store.state.blockChainNews.blockChainNews;

  int get total => this.store.state.blockChainNews.total;

  bool get fetching => this.store.state.blockChainNews.fetching;

  int get firstFetchingTimestamp => this.store.state.blockChainNews.firstFetchingTimestamp;
}
