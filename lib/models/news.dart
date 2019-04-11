// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) {
    final jsonData = json.decode(str);
    return News.fromJson(jsonData);
}

String newsToJson(News data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class News {
    String summary;
    int id;
    String title;
    String summaryAuto;
    String url;
    String mobileUrl;
    String siteName;
    String language;
    String authorName;
    String publishDate;

    News({
        this.summary,
        this.id,
        this.title,
        this.summaryAuto,
        this.url,
        this.mobileUrl,
        this.siteName,
        this.language,
        this.authorName,
        this.publishDate,
    });

    factory News.fromJson(Map<String, dynamic> json) => new News(
        summary: json["summary"],
        id: json["id"],
        title: json["title"],
        summaryAuto: json["summaryAuto"],
        url: json["url"],
        mobileUrl: json["mobileUrl"],
        siteName: json["siteName"],
        language: json["language"],
        authorName: json["authorName"],
        publishDate: json["publishDate"],
    );

    Map<String, dynamic> toJson() => {
        "summary": summary,
        "id": id,
        "title": title,
        "summaryAuto": summaryAuto,
        "url": url,
        "mobileUrl": mobileUrl,
        "siteName": siteName,
        "language": language,
        "authorName": authorName,
        "publishDate": publishDate,
    };
}
