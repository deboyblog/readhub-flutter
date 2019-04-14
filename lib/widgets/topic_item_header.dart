import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TopicItemHeader extends StatelessWidget {
  final String title;
  final DateTime createdAt;
  String timeagoLabel;
  TopicItemHeader({Key key, this.title, this.createdAt}) {
    timeago.setLocaleMessages('zh_CN', timeago.ZhCnMessages());
    timeagoLabel = timeago.format(createdAt.toLocal(), locale: 'zh_CN');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18.0, letterSpacing: .2, height: 1.2),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              timeagoLabel,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[400],
              ),
            ),
          ),
        )
      ],
    );
  }
}
