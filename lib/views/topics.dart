import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:readhub/api/nework.dart';
import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/states/topic.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:readhub/redux/view_models/topicViewModel.dart';
import 'package:readhub/widgets/topic_item.dart';

class Topics extends StatefulWidget {
  Topics({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    Network.fetchTopics();
    _scrollController.addListener(() {
      TopicState topicState = StoreContainer.global.state.topics;
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          topicState.topics.length <= topicState.total) {
        _loadMore();
      }
    });
    super.initState();
  }

  void _loadMore() {
    Network.fetchTopics(more: true);
  }

  Widget _buildProgressIndicator(bool fetching, bool isEnd) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: (fetching || isEnd) ? 1.0 : 0.0,
          child: !isEnd ? CupertinoActivityIndicator() : Text('没有更多啦～'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return StoreConnector<ReduxState, TopicViewModel>(converter: (store) {
      return TopicViewModel(store);
    }, builder: (context, vm) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '热门话题',
            style: TextStyle(color: Color(0xffffffff)),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Network.fetchTopics(more: false);
            return null;
          },
          child: ListView.builder(
              key: const PageStorageKey('topic_list'),
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: vm.topics.length + 1,
              itemBuilder: (context, int index) {
                if (index == vm.topics.length) {
                  return _buildProgressIndicator(
                      vm.fetching, vm.isEnd);
                }
                return TopicItem(topic: vm.topics[index]);
              }),
        ),
      );
    });
  }
}
