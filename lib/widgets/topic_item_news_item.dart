import 'package:flutter/material.dart';

class NewsShort {
  String title;
  String siteName;
  String mobileUrl;
  int duplicateId;
  NewsShort({this.title, this.siteName, this.mobileUrl, this.duplicateId});
}

class TopicItemNewsItem extends StatelessWidget {
  final NewsShort newsShort;
  TopicItemNewsItem({Key key, this.newsShort}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 8, 0),
                child: Icon(
                  Icons.album,
                  size: 5,
                  color: Color.fromRGBO(0, 0, 0, .4),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      newsShort.title,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, .9),
                          fontSize: 16,
                          height: 1.1),
                    ),
                    Text(
                      newsShort.siteName,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, .5),
                          fontSize: 14,
                          height: 1),
                    ),
                  ],
                ),
              )
            ],
          )),
      onTap: () {
        Navigator.pushNamed(context, 'webview',
            arguments: {'url': newsShort.mobileUrl, 'title': newsShort.title});
      },
    );
    // ListTile(
    //   title: Text(
    //     newsShort.title,
    //     overflow: TextOverflow.ellipsis,
    //     softWrap: false,
    //   ),
    //   subtitle: Text('${newsShort.siteName}'),
    //   onTap: () {
    //     Navigator.pushNamed(context, 'webview',
    //         arguments: {'url': newsShort.mobileUrl, 'title': newsShort.title});
    //   },
    //   contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
    // );
  }
}
