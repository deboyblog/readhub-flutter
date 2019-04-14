import 'package:flutter/material.dart';

class TopicItemSummary extends StatelessWidget {
  final String summary;
  final Color color;
  TopicItemSummary({Key key, this.summary, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 0, left: 8, right: 8),
      alignment: Alignment.bottomLeft,
      child: Text(
        summary,
        style: TextStyle(
            color: color,
            fontSize: 16.0,
            letterSpacing: .35,
            height: 1.2),
      ),
    );
  }
}
