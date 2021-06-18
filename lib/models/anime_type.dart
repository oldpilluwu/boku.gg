import 'package:boku_gg/models/anime_display_model.dart';
import 'package:flutter/material.dart';

class AnimeType {
  var animeDisplayList;
  var page;
  ScrollController scrollController = ScrollController();
  String? url;

  AnimeType(String _url) {
    animeDisplayList = <AnimeDisplay>[];
    page = 1;
    url = _url;
  }
}
