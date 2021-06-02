// To parse this JSON data, do
//
//     final episode = episodeFromJson(jsonString);

import 'dart:convert';

List<Episode> episodeFromJson(String str) =>
    List<Episode>.from(json.decode(str).map((x) => Episode.fromJson(x)));

String episodeToJson(List<Episode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Episode {
  Episode({
    required this.link,
    required this.quality,
  });

  String link;
  String quality;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        link: json["link"],
        quality: json["quality"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "quality": quality,
      };
}
