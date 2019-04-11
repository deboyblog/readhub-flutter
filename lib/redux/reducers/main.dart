import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/reducers/topic.dart' as topics;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
    topics: topics.reducer(state.topics, action),
  );
