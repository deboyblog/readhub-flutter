import 'package:flutter/material.dart';
import 'package:readhub/models/news.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatefulWidget {
  final News news;
  NewsItem({Key key, this.news}) : super(key: key);
  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    News news = widget.news;
    timeago.setLocaleMessages('zh_CN', timeago.ZhCnMessages());
    String timeagoLabel =
        timeago.format(news.publishDate.toLocal(), locale: 'zh_CN');
    String bottomLabel =
        '${news.siteName} / ${news.authorName}    $timeagoLabel';
    List<Widget> widgets = [
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'webview',
                arguments: {'url': news.mobileUrl, 'title': news.title});
          },
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    news.title,
                    style: TextStyle(
                        fontSize: 18.0, letterSpacing: .2, height: 1.2),
                  ),
                  SizedBox(
                    height: news.summary != null ? 8 : 0,
                  ),
                  Text(
                    news.summary,
                     overflow: TextOverflow.ellipsis,
                     maxLines: 3,
                    style: TextStyle(
                        fontSize: 16,
                        
                        color: Color.fromRGBO(115, 115, 115, 1),
                        height: 1.1),
                  ),
                  SizedBox(
                    height: news.summary != null ? 5 : 0,
                  ),
                  Text(bottomLabel,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[400],
                      )),
                ],
              )))
    ];
    return Card(borderOnForeground: false, child: Column(children: widgets));
  }
}
