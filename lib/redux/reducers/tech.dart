import 'package:readhub/redux/actions/main.dart';
import 'package:readhub/redux/actions/tech.dart';
import 'package:readhub/redux/states/tech.dart';

TechState reducer(TechState state, ActionType action) {
  if (action is UpdateTech) {
    return state.copyWith(techNews: action.payload, fetching: false);
  }
  if (action is UpdateTechFetching) {
    return state.copyWith(fetching: action.fetching);
  }
  if (action is UpdateTechTotal) {
    return state.copyWith(total: action.total);
  }
  return state;
}
