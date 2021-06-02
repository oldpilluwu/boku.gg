// To parse this JSON data, do
//
//     final anime = animeFromJson(jsonString);

import 'dart:convert';

Anime animeFromJson(String str) => Anime.fromJson(json.decode(str));

String animeToJson(Anime data) => json.encode(data.toJson());

class Anime {
  Anime({
    required this.id,
    required this.title,
    required this.image,
    required this.type,
    required this.summary,
    required this.released,
    required this.genres,
    required this.status,
    required this.totalEpisodes,
    required this.otherNames,
  });

  String id;
  String title;
  String image;
  String type;
  String summary;
  int released;
  List<String> genres;
  String status;
  int totalEpisodes;
  List<String> otherNames;

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        type: json["type"],
        summary: json["summary"],
        released: json["released"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"],
        totalEpisodes: json["totalEpisodes"],
        otherNames: List<String>.from(json["otherNames"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "type": type,
        "summary": summary,
        "released": released,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "totalEpisodes": totalEpisodes,
        "otherNames": List<dynamic>.from(otherNames.map((x) => x)),
      };
}
