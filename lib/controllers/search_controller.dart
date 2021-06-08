import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/services/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController instance = Get.find();
  var isLoading = true.obs;

  var searchAnimeList = <AnimeDisplay>[].obs;
  var genreAnimeList = <AnimeDisplay>[].obs;
  String? activeText;
  var searchText;
  int page = 1;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)
        fetchSearchDisplayList(activeText!);
      print('seatching');
    });
    super.onInit();
  }

  void fetchSearchDisplayList(String searchText) async {
    if (searchText != activeText) {
      page = 1;
      searchAnimeList.clear();
      activeText = searchText;
    }
    try {
      isLoading(true);
      var animeList =
          await ApiService.fetchSearchAnimeDisplay(searchText, page);
      if (animeList != null && animeList.isNotEmpty) {
        searchAnimeList.addAll(animeList);
        //print(popularAnime.map((e) => print(e)));
        page++;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchGenreDisplayList(String genre) async {
    try {
      isLoading(true);
      genreAnimeList.clear();
      var animeList = await ApiService.fetchGenreAnimeDisplay(genre);
      if (animeList != null) {
        genreAnimeList.addAll(animeList);
      }
    } finally {
      isLoading(false);
    }
  }
}
