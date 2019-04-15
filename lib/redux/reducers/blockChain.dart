import 'package:readhub/redux/actions/blockChain.dart';
import 'package:readhub/redux/actions/main.dart';
import 'package:readhub/redux/states/blockChain.dart';

BlockChainState reducer(BlockChainState state, ActionType action) {
  if (action is UpdateBlockChain) {
    return state.copyWith(blockChainNews: action.payload, fetching: false);
  }
  if (action is UpdateBlockChainFetching) {
    return state.copyWith(fetching: action.fetching);
  }
  if (action is UpdateBlockChainTotal) {
    return state.copyWith(total: action.total);
  }
  return state;
}
