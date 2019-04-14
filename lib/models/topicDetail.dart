// To parse this JSON data, do
//
//     final topicDetail = topicDetailFromJson(jsonString);

import 'dart:convert';

TopicDetail topicDetailFromJson(String str) {
    final jsonData = json.decode(str);
    return TopicDetail.fromJson(jsonData);
}

String topicDetailToJson(TopicDetail data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class TopicDetail {
    String id;
    List<EntityTopic> entityTopics;
    List<NewsArray> newsArray;
    DateTime createdAt;
    List<dynamic> entityEventTopics;
    DateTime publishDate;
    String summary;
    String title;
    DateTime updatedAt;
    Timeline timeline;
    int order;
    bool hasInstantView;

    TopicDetail({
        this.id,
        this.entityTopics,
        this.newsArray,
        this.createdAt,
        this.entityEventTopics,
        this.publishDate,
        this.summary,
        this.title,
        this.updatedAt,
        this.timeline,
        this.order,
        this.hasInstantView,
    });

    factory TopicDetail.fromJson(Map<String, dynamic> json) => new TopicDetail(
        id: json["id"],
        entityTopics: new List<EntityTopic>.from(json["entityTopics"].map((x) => EntityTopic.fromJson(x))),
        newsArray: new List<NewsArray>.from(json["newsArray"].map((x) => NewsArray.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        entityEventTopics: new List<dynamic>.from(json["entityEventTopics"].map((x) => x)),
        publishDate: DateTime.parse(json["publishDate"]),
        summary: json["summary"],
        title: json["title"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        timeline: Timeline.fromJson(json["timeline"]),
        order: json["order"],
        hasInstantView: json["hasInstantView"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entityTopics": new List<dynamic>.from(entityTopics.map((x) => x.toJson())),
        "newsArray": new List<dynamic>.from(newsArray.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "entityEventTopics": new List<dynamic>.from(entityEventTopics.map((x) => x)),
        "publishDate": publishDate.toIso8601String(),
        "summary": summary,
        "title": title,
        "updatedAt": updatedAt.toIso8601String(),
        "timeline": timeline.toJson(),
        "order": order,
        "hasInstantView": hasInstantView,
    };
}

class EntityTopic {
    double weight;
    String nerName;
    String entityId;
    String entityName;
    String entityType;
    String entityUniqueId;
    dynamic finance;

    EntityTopic({
        this.weight,
        this.nerName,
        this.entityId,
        this.entityName,
        this.entityType,
        this.entityUniqueId,
        this.finance,
    });

    factory EntityTopic.fromJson(Map<String, dynamic> json) => new EntityTopic(
        weight: json["weight"].toDouble(),
        nerName: json["nerName"],
        entityId: json["entityId"],
        entityName: json["entityName"],
        entityType: json["entityType"],
        entityUniqueId: json["entityUniqueId"],
        finance: json["finance"],
    );

    Map<String, dynamic> toJson() => {
        "weight": weight,
        "nerName": nerName,
        "entityId": entityId,
        "entityName": entityName,
        "entityType": entityType,
        "entityUniqueId": entityUniqueId,
        "finance": finance,
    };
}

class NewsArray {
    String id;
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

class Timeline {
    List<TopicSimple> topics;
    List<dynamic> commonEntities;
    String id;

    Timeline({
        this.topics,
        this.commonEntities,
        this.id,
    });

    factory Timeline.fromJson(Map<String, dynamic> json) => new Timeline(
        topics: new List<TopicSimple>.from(json["topics"].map((x) => TopicSimple.fromJson(x))),
        commonEntities: new List<dynamic>.from(json["commonEntities"].map((x) => x)),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "topics": new List<dynamic>.from(topics.map((x) => x.toJson())),
        "commonEntities": new List<dynamic>.from(commonEntities.map((x) => x)),
        "id": id,
    };
}

class TopicSimple {
    String id;
    String title;
    DateTime createdAt;

    TopicSimple({
        this.id,
        this.title,
        this.createdAt,
    });

    factory TopicSimple.fromJson(Map<String, dynamic> json) => new TopicSimple(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
    };
}
