import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:readhub/api/nework.dart';
import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:readhub/redux/view_models/topicViewModel.dart';
import 'package:readhub/widgets/topic_item.dart';

class Topics extends StatefulWidget {
  final Network api;
  Topics({Key key, this.api}) : super(key: key);

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
    widget.api.fetchTopics();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
    super.initState();
  }

  void _loadMore() {
    widget.api.fetchTopics(more: true);
  }

  Widget _buildProgressIndicator(bool fetching) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: fetching ? 1.0 : 0.0,
          child: CupertinoActivityIndicator(),
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
      print(vm);
      return Scaffold(
        appBar: AppBar(
          title: Text('热门话题'),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            await widget.api.fetchTopics(more: true);
            return null;
          },
          child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: vm.topics.length + 1,
              itemBuilder: (context, int index) {
                if (index == vm.topics.length) {
                  return _buildProgressIndicator(vm.fetching);
                }
                return TopicItem(topic: vm.topics[index]);
              }),
        ),
      );
    });
  }
}
