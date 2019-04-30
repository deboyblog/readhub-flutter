import 'package:readhub/models/topic.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:redux/redux.dart';
import 'package:readhub/redux/states/main.dart';

class TopicViewModel extends ViewModel {
  TopicViewModel(Store<ReduxState> store) : super(store);

  List<Topic> get topics => this.store.state.topics.topics;

  int get total => this.store.state.topics.total;

  bool get fetching => this.store.state.topics.fetching;

  bool get isEnd =>
      this.store.state.topics.total >= 0 && this.store.state.topics.topics.length >= this.store.state.topics.total;
}
