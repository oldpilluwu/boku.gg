import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/services/api_service.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  static AnimeController instance = Get.find();
  var isLoading = true.obs;
  var popularAnimeDisplayList = <AnimeDisplay>[].obs;
  var recentAnimeDisplayList = <AnimeDisplay>[].obs;

  int popularPage = 1;
  int recentPage = 1;

  @override
  void onInit() {
    fetchPopularAnimeList();
    fetchRecentAnimeList();
    super.onInit();
  }

  void fetchPopularAnimeList() async {
    try {
      isLoading(true);
      var popularAnime = await ApiService.fetchPopularAnimeDisplay(popularPage);
      if (popularAnime != null) {
        popularAnimeDisplayList.addAll(popularAnime);
        print(popularAnime.toString());
        popularPage++;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchRecentAnimeList() async {
    try {
      isLoading(true);
      var recentAnime = await ApiService.fetchRecentAnimeDisplay(recentPage);
      if (recentAnime != null) {
        recentAnimeDisplayList.addAll(recentAnime);
        recentPage++;
      }
    } finally {
      isLoading(false);
    }
  }
}