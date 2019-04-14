import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readhub/api/nework.dart';
import 'package:readhub/common/utils.dart';
import 'package:readhub/models/topicDetail.dart';
import 'package:readhub/widgets/topic_detail_timeline.dart';
import 'package:readhub/widgets/topic_item_header.dart';
import 'package:readhub/widgets/topic_item_news_item.dart';
import 'package:readhub/widgets/topic_item_summary.dart';

class TopicDetailView extends StatefulWidget {
  final String id;
  TopicDetailView({Key key, this.id}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _TopicDetailViewState createState() => _TopicDetailViewState();
}

class _TopicDetailViewState extends State<TopicDetailView> {
  TopicDetail topicDetail;
  bool fetching;
  @override
  void initState() {
    setState(() {
      fetching = true;
    });
    Network.fetchTopicDetail(id: widget.id).then((TopicDetail td) {
      setState(() {
        fetching = false;
        topicDetail = td;
      });
    });
    super.initState();
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: 1.0,
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  Widget _buildTopicDetail() {
    EdgeInsets commonPadding = EdgeInsets.fromLTRB(8, 0, 8, 0);
    Widget header = Padding(
      padding: commonPadding,
      child: TopicItemHeader(
        title: topicDetail.title,
        createdAt: topicDetail.createdAt,
      ),
    );
    Widget summary = TopicItemSummary(summary: topicDetail.summary, color: Color.fromRGBO(87, 87, 87, 1),);
    List<NewsShort> newsList = Utils.mergeDuplicateNews(topicDetail.newsArray);
    List<Widget> newsWidgetList = [];
    newsList.forEach((newsItem) {
      newsWidgetList.add(TopicItemNewsItem(newsShort: newsItem));
    });
    List<Widget> timelineWidgetList = [];
    if (topicDetail.timeline.topics is List<TopicSimple>) {
      timelineWidgetList
          .addAll(topicDetail.timeline.topics.map((TopicSimple topic) {
        return TopicDetailTimeline(
          topicSimple: topic,
        );
      }));
    }
    List<Widget> wList = [
      header,
      summary,
      SizedBox(
        height: 30,
      ),
      Column(children: newsWidgetList),
      SizedBox(
        height: 20,
      )
    ];
    if (timelineWidgetList.length > 0) {
      wList.add(
        Container(
          color: Color.fromRGBO(245, 245, 245, 1),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Text(
            '相关事件',
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, .9)),
          ),
        ),
      );
      wList.add(Column(
        children: timelineWidgetList,
      ));
    }
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: wList,
      ),
    )));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '话题详情',
            style: TextStyle(color: Color(0xffffffff)),
          ),
        ),
        body: fetching ? _buildProgressIndicator() : _buildTopicDetail());
  }
}
