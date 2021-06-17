// To parse this JSON data, do
//
//     final animeDisplay = animeDisplayFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<AnimeDisplay> animeDisplayFromJson(String str) => List<AnimeDisplay>.from(
    json.decode(str).map((x) => AnimeDisplay.fromJson(x)));

String animeDisplayToJson(List<AnimeDisplay> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeDisplay {
  AnimeDisplay({
    required this.id,
    required this.title,
    required this.image,
  });

  String id;
  String title;
  String image;

  factory AnimeDisplay.fromJson(Map<String, dynamic> json) => AnimeDisplay(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  factory AnimeDisplay.fromDocumentSnapshot(DocumentSnapshot doc) =>
      AnimeDisplay(
        id: doc.id,
        title: doc['title'],
        image: doc["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
