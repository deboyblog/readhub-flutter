import 'package:readhub/redux/actions/main.dart';
import 'package:readhub/redux/actions/news.dart';
import 'package:readhub/redux/states/news.dart';

NewsState reducer(NewsState state, ActionType action) {
  if (action is UpdateNews) {
    return state.copyWith(news: action.payload, fetching: false);
  }
  if (action is UpdateNewsFetching) {
    return state.copyWith(fetching: action.fetching);
  }
  if (action is UpdateNewsTotal) {
    return state.copyWith(total: action.total);
  }
  return state;
}
