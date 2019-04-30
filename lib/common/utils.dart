import 'package:readhub/widgets/topic_item_news_item.dart';

class Utils {
  static String readTimestamp(int timestamp) {
    String temp = "";
    if (timestamp == null || timestamp == 0) {
      return temp;
    }
    try {
      int now = (new DateTime.now().millisecondsSinceEpoch ~/ 1000);
      int diff = now - timestamp;
      int months = (diff ~/ (60 * 60 * 24 * 30));
      int days = (diff ~/ (60 * 60 * 24));
      int hours = ((diff - days * (60 * 60 * 24)) ~/ (60 * 60));
      int minutes = ((diff - days * (60 * 60 * 24) - hours * (60 * 60)) ~/ 60);
      if (months > 0) {
        temp = months.toString() + "月前";
      } else if (days > 0) {
        temp = days.toString() + "天前";
      } else if (hours > 0) {
        temp = hours.toString() + "小时前";
      } else {
        temp = minutes.toString() + "分钟前";
      }
    } catch (e) {
      e.toString();
    }
    return temp;
  }

  static List<NewsShort> mergeDuplicateNews(List<dynamic> newsList) {
    List<NewsShort> news = [];
    newsList.forEach((newsItem) {
      List<NewsShort> tmp = news.length == 0
          ? []
          : news.where((item) {
              return item.duplicateId == newsItem.duplicateId;
            }).toList();
      if (tmp.isEmpty) {
        news.add(new NewsShort(
            title: newsItem.title,
            mobileUrl: newsItem.mobileUrl,
            siteName: newsItem.siteName,
            duplicateId: newsItem.duplicateId));
      } else {
        tmp[0].siteName = tmp[0].siteName + '/' + newsItem.siteName;
      }
    });
    return news;
  }
}
