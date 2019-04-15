import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/reducers/topic.dart' as topics;
import 'package:readhub/redux/reducers/news.dart' as news;
import 'package:readhub/redux/reducers/tech.dart' as tech;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
      topics: topics.reducer(state.topics, action),
      news: news.reducer(state.news, action),
      techNews: tech.reducer(state.techNews, action),
    );
