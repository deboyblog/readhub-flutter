// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

Job jobFromJson(String str) {
    final jsonData = json.decode(str);
    return Job.fromJson(jsonData);
}

String jobToJson(Job data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Job {
    int id;
    String uuid;
    String jobTitle;
    int jobCount;
    int companyCount;
    int salaryLower;
    int salaryUpper;
    int experienceLower;
    int experienceUpper;
    Cities cities;
    Map<String, int> sources;
    List<JobsArray> jobsArray;
    String publishDate;
    String createdAt;

    Job({
        this.id,
        this.uuid,
        this.jobTitle,
        this.jobCount,
        this.companyCount,
        this.salaryLower,
        this.salaryUpper,
        this.experienceLower,
        this.experienceUpper,
        this.cities,
        this.sources,
        this.jobsArray,
        this.publishDate,
        this.createdAt,
    });

    factory Job.fromJson(Map<String, dynamic> json) => new Job(
        id: json["id"],
        uuid: json["uuid"],
        jobTitle: json["jobTitle"],
        jobCount: json["jobCount"],
        companyCount: json["companyCount"],
        salaryLower: json["salaryLower"],
        salaryUpper: json["salaryUpper"],
        experienceLower: json["experienceLower"],
        experienceUpper: json["experienceUpper"],
        cities: Cities.fromJson(json["cities"]),
        sources: new Map.from(json["sources"]).map((k, v) => new MapEntry<String, int>(k, v)),
        jobsArray: new List<JobsArray>.from(json["jobsArray"].map((x) => JobsArray.fromJson(x))),
        publishDate: json["publishDate"],
        createdAt: json["createdAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "jobTitle": jobTitle,
        "jobCount": jobCount,
        "companyCount": companyCount,
        "salaryLower": salaryLower,
        "salaryUpper": salaryUpper,
        "experienceLower": experienceLower,
        "experienceUpper": experienceUpper,
        "cities": cities.toJson(),
        "sources": new Map.from(sources).map((k, v) => new MapEntry<String, dynamic>(k, v)),
        "jobsArray": new List<dynamic>.from(jobsArray.map((x) => x.toJson())),
        "publishDate": publishDate,
        "createdAt": createdAt,
    };
}

class Cities {
    int purple;
    int empty;
    int cities;

    Cities({
        this.purple,
        this.empty,
        this.cities,
    });

    factory Cities.fromJson(Map<String, dynamic> json) => new Cities(
        purple: json["西安"],
        empty: json["南京"],
        cities: json["德州"],
    );

    Map<String, dynamic> toJson() => {
        "西安": purple,
        "南京": empty,
        "德州": cities,
    };
}

class JobsArray {
    int id;
    String url;
    String city;
    String title;
    String company;
    bool sponsor;
    String siteName;
    int salaryLower;
    int salaryUpper;
    int experienceLower;
    int experienceUpper;

    JobsArray({
        this.id,
        this.url,
        this.city,
        this.title,
        this.company,
        this.sponsor,
        this.siteName,
        this.salaryLower,
        this.salaryUpper,
        this.experienceLower,
        this.experienceUpper,
    });

    factory JobsArray.fromJson(Map<String, dynamic> json) => new JobsArray(
        id: json["id"],
        url: json["url"],
        city: json["city"],
        title: json["title"],
        company: json["company"],
        sponsor: json["sponsor"],
        siteName: json["siteName"],
        salaryLower: json["salaryLower"],
        salaryUpper: json["salaryUpper"],
        experienceLower: json["experienceLower"],
        experienceUpper: json["experienceUpper"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "city": city,
        "title": title,
        "company": company,
        "sponsor": sponsor,
        "siteName": siteName,
        "salaryLower": salaryLower,
        "salaryUpper": salaryUpper,
        "experienceLower": experienceLower,
        "experienceUpper": experienceUpper,
    };
}
