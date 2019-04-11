import 'package:flutter/material.dart';
import 'package:readhub/models/topic.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  TopicItem({this.topic});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              topic.title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                topic.createdAt,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          // Text(
          //   topic.summary,
          //   style: TextStyle(
          //     fontSize: 11.0,
          //   ),
          // )
        ],
      ),
    ));
  }
}
