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
    DateTime createdAt;
    List<EventDatum> eventData;
    DateTime publishDate;
    String summary;
    String title;
    DateTime updatedAt;
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
        createdAt: DateTime.parse(json["createdAt"]),
        eventData: new List<EventDatum>.from(json["eventData"].map((x) => EventDatum.fromJson(x))),
        publishDate: DateTime.parse(json["publishDate"]),
        summary: json["summary"],
        title: json["title"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        timeline: json["timeline"],
        order: json["order"],
        hasInstantView: json["hasInstantView"],
        extra: Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "newsArray": new List<dynamic>.from(newsArray.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "eventData": new List<dynamic>.from(eventData.map((x) => x.toJson())),
        "publishDate": publishDate.toIso8601String(),
        "summary": summary,
        "title": title,
        "updatedAt": updatedAt.toIso8601String(),
        "timeline": timeline,
        "order": order,
        "hasInstantView": hasInstantView,
        "extra": extra.toJson(),
    };
}

class EventDatum {
    int id;
    String topicId;
    int eventType;
    String entityId;
    String entityType;
    String entityName;
    int state;
    DateTime createdAt;
    DateTime updatedAt;

    EventDatum({
        this.id,
        this.topicId,
        this.eventType,
        this.entityId,
        this.entityType,
        this.entityName,
        this.state,
        this.createdAt,
        this.updatedAt,
    });

    factory EventDatum.fromJson(Map<String, dynamic> json) => new EventDatum(
        id: json["id"],
        topicId: json["topicId"],
        eventType: json["eventType"],
        entityId: json["entityId"],
        entityType: json["entityType"],
        entityName: json["entityName"],
        state: json["state"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "topicId": topicId,
        "eventType": eventType,
        "entityId": entityId,
        "entityType": entityType,
        "entityName": entityName,
        "state": state,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
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
    DateTime publishDate;
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
        publishDate: DateTime.parse(json["publishDate"]),
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
        "publishDate": publishDate.toIso8601String(),
        "language": language,
        "statementType": statementType,
    };
}
