// To parse this JSON data, do
//
//     final topic = topicFromJson(jsonString);

import 'dart:convert';

Topic topicFromJson(String str) {
    final jsonData = json.decode(str);
    return Topic.fromJson(jsonData);
}

String topicToJson(Topic data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Topic {
    String id;
    List<NewsArray> newsArray;
    String createdAt;
    List<dynamic> eventData;
    String publishDate;
    String summary;
    String title;
    String updatedAt;
    String timeline;
    int order;
    bool hasInstantView;
    Extra extra;

    Topic({
        this.id,
        this.newsArray,
        this.createdAt,
        this.eventData,
        this.publishDate,
        this.summary,
        this.title,
        this.updatedAt,
        this.timeline,
        this.order,
        this.hasInstantView,
        this.extra,
    });

    factory Topic.fromJson(Map<String, dynamic> json) => new Topic(
        id: json["id"],
        newsArray: new List<NewsArray>.from(json["newsArray"].map((x) => NewsArray.fromJson(x))),
        createdAt: json["createdAt"],
        eventData: new List<dynamic>.from(json["eventData"].map((x) => x)),
        publishDate: json["publishDate"],
        summary: json["summary"],
        title: json["title"],
        updatedAt: json["updatedAt"],
        timeline: json["timeline"],
        order: json["order"],
        hasInstantView: json["hasInstantView"],
        extra: Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "newsArray": new List<dynamic>.from(newsArray.map((x) => x.toJson())),
        "createdAt": createdAt,
        "eventData": new List<dynamic>.from(eventData.map((x) => x)),
        "publishDate": publishDate,
        "summary": summary,
        "title": title,
        "updatedAt": updatedAt,
        "timeline": timeline,
        "order": order,
        "hasInstantView": hasInstantView,
        "extra": extra.toJson(),
    };
}

class Extra {
    bool instantView;

    Extra({
        this.instantView,
    });

    factory Extra.fromJson(Map<String, dynamic> json) => new Extra(
        instantView: json["instantView"],
    );

    Map<String, dynamic> toJson() => {
        "instantView": instantView,
    };
}

class NewsArray {
    int id;
    String url;
    String title;
    String siteName;
    String mobileUrl;
    String autherName;
    int duplicateId;
    String publishDate;
    String language;
    int statementType;

    NewsArray({
        this.id,
        this.url,
        this.title,
        this.siteName,
        this.mobileUrl,
        this.autherName,
        this.duplicateId,
        this.publishDate,
        this.language,
        this.statementType,
    });

    factory NewsArray.fromJson(Map<String, dynamic> json) => new NewsArray(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        siteName: json["siteName"],
        mobileUrl: json["mobileUrl"],
        autherName: json["autherName"],
        duplicateId: json["duplicateId"],
        publishDate: json["publishDate"],
        language: json["language"],
        statementType: json["statementType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
        "siteName": siteName,
        "mobileUrl": mobileUrl,
        "autherName": autherName,
        "duplicateId": duplicateId,
        "publishDate": publishDate,
        "language": language,
        "statementType": statementType,
    };
}
