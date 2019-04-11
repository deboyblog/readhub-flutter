import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:readhub/api/nework.dart';
import 'package:readhub/redux/states/main.dart';
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
  @override
  void initState() {
    widget.api.fetchTopics();
    super.initState();
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
        body: Container(
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics (),
              itemCount: vm.topics.length,
              itemBuilder: (context, int index) {
                return TopicItem(topic: vm.topics[index]);
              }),
        ),
      );
    });
  }
}
