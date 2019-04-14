import 'package:flutter/material.dart';
import 'package:readhub/common/utils.dart';
import 'package:readhub/models/topic.dart';
import 'package:readhub/views/topic_detail.dart';
import 'package:readhub/widgets/topic_item_header.dart';
import 'package:readhub/widgets/topic_item_news_item.dart';
import 'package:readhub/widgets/topic_item_summary.dart';

class TopicItem extends StatefulWidget {
  final Topic topic;
  TopicItem({Key key, this.topic}) : super(key: key);
  @override
  _TopicItemState createState() => _TopicItemState();
}

class _TopicItemState extends State<TopicItem> {
  bool _showDetail;

  @override
  void initState() {
    this._showDetail = false;
    super.initState();
  }

  void _onToggle() {
    setState(() {
      _showDetail = !_showDetail;
    });
  }

  Widget _buildDetailView() {
    List<Widget> detailView = [
      TopicItemSummary(summary: widget.topic.summary, color: Color.fromRGBO(155, 155, 155, 1),),
    ];
    // 合并重复的新闻
    List<NewsShort> news = Utils.mergeDuplicateNews(widget.topic.newsArray);
    news.forEach((NewsShort newsItem) {
      detailView.add(TopicItemNewsItem(newsShort: newsItem,));
    });
    detailView.add(InkWell(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopicDetailView(id: widget.topic.id)),
          ),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: .5, color: Color.fromRGBO(153, 153, 153, 1)),
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '查看话题',
                  style: TextStyle(
                    color: Color.fromRGBO(127, 127, 127, 1),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(127, 127, 127, 1),
                  size: 14,
                )
              ])),
    ));
    return Column(
      children: detailView,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      InkWell(
          onTap: _onToggle,
          child: Padding(
              padding: EdgeInsets.all(8),
              child: TopicItemHeader(
                title: widget.topic.title,
                createdAt: widget.topic.createdAt,
              )))
    ];
    if (_showDetail) {
      widgets.add(_buildDetailView());
    }
    return Card(
        borderOnForeground: false,
        elevation: _showDetail ? 5 : 1,
        child: Column(children: widgets));
  }
}
