import 'package:redux/redux.dart';
import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/states/topic.dart';
import 'package:readhub/redux/states/news.dart';
import 'package:readhub/redux/states/tech.dart';
import 'package:readhub/redux/states/blockChain.dart';
import 'package:readhub/redux/states/job.dart';
import 'package:readhub/redux/reducers/main.dart';

abstract class ViewModel {
  final Store<ReduxState> store;
  ViewModel(this.store);
}

class StoreContainer {
  static final Store<ReduxState> global = reduxStore();
}

Store reduxStore() => Store<ReduxState>(reduxReducer,
    initialState: ReduxState(
      topics: TopicState.initialState(),
      news: NewsState.initialState(),
      techNews: TechState.initialState(),
      blockChainNews: BlockChainState.initialState(),
      jobs: JobState.initialState(),
    ));