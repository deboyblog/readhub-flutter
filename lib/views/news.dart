import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:readhub/api/nework.dart';
import 'package:readhub/redux/states/main.dart';
import 'package:readhub/redux/states/news.dart';
import 'package:readhub/redux/view_models/main.dart';
import 'package:readhub/redux/view_models/newsViewModel.dart';
import 'package:readhub/widgets/news_item.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    Network.fetchNews();
    _scrollController.addListener(() {
      NewsState newsState = StoreContainer.global.state.news;
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          newsState.news.length <= newsState.total) {
        _loadMore();
      }
    });
    super.initState();
  }

  void _loadMore() {
    Network.fetchNews(more: true);
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
    return StoreConnector<ReduxState, NewsViewModel>(converter: (store) {
      return NewsViewModel(store);
    }, builder: (context, vm) {
      print({'length': vm.news.length, 'total': vm.total});
      return Scaffold(
        appBar: AppBar(
          title: Text(
            '热门话题',
            style: TextStyle(color: Color(0xffffffff)),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Network.fetchNews(more: false);
            return null;
          },
          child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: vm.news.length + 1,
              itemBuilder: (context, int index) {
                if (index == vm.news.length) {
                  return _buildProgressIndicator(
                      vm.fetching, vm.news.length >= vm.total);
                }
                return NewsItem(news: vm.news[index]);
              }),
        ),
      );
    });
  }
}
