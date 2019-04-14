import 'package:flutter/material.dart';
import 'package:readhub/models/topicDetail.dart';
import 'package:readhub/views/topic_detail.dart';

class TopicDetailTimeline extends StatelessWidget {
  final TopicSimple topicSimple;
  TopicDetailTimeline({Key key, this.topicSimple}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String timeLabel =
        '${topicSimple.createdAt.month}月${topicSimple.createdAt.day}日';
    return InkWell(
      child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
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
                      '$timeLabel',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, .5),
                          fontSize: 14,
                          height: 1),
                    ),
                    Text(
                      topicSimple.title,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, .9),
                          fontSize: 16,
                          height: 1.1),
                    ),
                  ],
                ),
              )
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TopicDetailView(id: topicSimple.id)),
        );
      },
    );
  }
}
