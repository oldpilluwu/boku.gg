import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/services/api/api_service.dart';
import 'package:flutter/material.dart';

class AnimeType {
  var animeDisplayList;
  var page;
  ScrollController? scrollController;
  String? url;

  AnimeType(String _url) {
    animeDisplayList = <AnimeDisplay>[];
    page = 1;
    scrollController = ScrollController();
    url = _url;
  }
}
