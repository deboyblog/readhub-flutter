import 'package:flutter/material.dart';
import 'package:readhub/models/topic.dart';
import 'package:timeago/timeago.dart' as timeago;

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
    Widget newsRow(NewsArray newsItem) {
      return ListTile(
        title: Text(
          newsItem.title,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        subtitle: Text('${newsItem.siteName}'),
        onTap: () {
          print(newsItem);
          Navigator.pushNamed(context, 'webview',
              arguments: {'url': newsItem.mobileUrl, 'title': newsItem.title});
        },
        contentPadding: EdgeInsets.all(0),
      );
    }

    List<Widget> detailView = [
      Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            widget.topic.summary,
            style: TextStyle(
                color: Color.fromRGBO(155, 155, 155, 1),
                fontSize: 16.0,
                letterSpacing: .35,
                height: 1.2),
          ),
        ),
      )
    ];
    widget.topic.newsArray.forEach((NewsArray newsItem) {
      detailView.add(newsRow(newsItem));
    });
    return Column(
      children: detailView,
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeAgo = DateTime.parse(widget.topic.createdAt);
    timeago.setLocaleMessages('zh_CN', timeago.ZhCnMessages());
    List<Widget> widgets = [
      InkWell(
        onTap: _onToggle,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            widget.topic.title,
            style: TextStyle(fontSize: 18.0, letterSpacing: .2, height: 1.2),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            timeago.format(timeAgo, locale: 'zh_CN'),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[400],
            ),
          ),
        ),
      )
    ];
    if (_showDetail) {
      widgets.add(_buildDetailView());
    }
    return Card(
        borderOnForeground: false,
        elevation: _showDetail ? 5 : 1,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(children: widgets),
        ));
  }
}
