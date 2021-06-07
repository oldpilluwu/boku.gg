import 'package:boku_gg/commons/url_strings.dart';
import 'package:boku_gg/models/anime_model.dart';
import 'package:boku_gg/models/anime_type.dart';
import 'package:boku_gg/models/episode_model.dart';
import 'package:boku_gg/services/api/api_service.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  static AnimeController instance = Get.find();
  var isLoading = true.obs;
  var episodeLoading = true.obs;
  // var popularAnimeDisplayList = <AnimeDisplay>[].obs;
  // var recentAnimeDisplayList = <AnimeDisplay>[].obs;

  // int popularPage = 1;
  // int recentPage = 1;

  // ScrollController popularScrollController = ScrollController();
  // ScrollController recentScrollController = ScrollController();

  var popularAnime = AnimeType(URLStrings.getPopularUrl).obs;
  var recentAnime = AnimeType(URLStrings.getRecentUrl).obs;

  Rx<Anime>? activeAnime;

  var activeEpisode;
  RxList<Episode>? episodeQuality;

  @override
  void onInit() {
    fetchAnimeDisplayList(popularAnime);
    fetchAnimeDisplayList(recentAnime);

    super.onInit();

    popularAnime.value.scrollController!.addListener(() {
      if (popularAnime.value.scrollController!.position.pixels ==
          popularAnime.value.scrollController!.position.maxScrollExtent) {
        print('Scrolling');
        fetchAnimeDisplayList(popularAnime);
      }
    });
    recentAnime.value.scrollController!.addListener(() {
      if (recentAnime.value.scrollController!.position.pixels ==
          recentAnime.value.scrollController!.position.maxScrollExtent) {
        fetchAnimeDisplayList(recentAnime);
      }
    });
  }

  void fetchAnimeDisplayList(Rx<AnimeType> type) async {
    try {
      isLoading(true);
      var animeList =
          await ApiService.fetchAnimeDisplay(type.value.url, type.value.page);
      if (animeList != null) {
        type.value.animeDisplayList.addAll(animeList);
        type.refresh();
        //print(popularAnime.map((e) => print(e)));
        type.value.page++;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchSingleAnimeDetails(String id) async {
    try {
      isLoading(true);
      Anime? responseAnime =
          await ApiService.fetchSingleAnime(URLStrings.getAnimeDetailsUrl, id);
      if (responseAnime != null) {
        //  print(responseAnime.title);
        activeAnime = responseAnime.obs;
        activeAnime!.refresh();
        //print(popularAnime.map((e) => print(e)));
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchAnimeEpisode(String id, int episode) async {
    try {
      episodeLoading(true);
      var responseEpisode = await ApiService.fetchEpisode(id, episode);
      if (responseEpisode != null) {
        episodeQuality = responseEpisode.obs;
        episodeQuality!.refresh();
        activeEpisode = episode;
        //print(popularAnime.map((e) => print(e)));
      }
    } finally {
      episodeLoading(false);
    }
  }

  // @override
  // void onInit() {
  //   fetchPopularAnimeList();
  //   fetchRecentAnimeList();
  //   super.onInit();
  //   popularScrollController.addListener(() {
  //     if (popularScrollController.position.pixels ==
  //         popularScrollController.position.maxScrollExtent) {
  //       fetchPopularAnimeList();
  //     }
  //   });
  //   recentScrollController.addListener(() {
  //     if (recentScrollController.position.pixels ==
  //         recentScrollController.position.maxScrollExtent) {
  //       fetchRecentAnimeList();
  //     }
  //   });
  // }

  // void fetchPopularAnimeList() async {
  //   try {
  //     isLoading(true);
  //     var popularAnime = await ApiService.fetchPopularAnimeDisplay(popularPage);
  //     if (popularAnime != null) {
  //       popularAnimeDisplayList.addAll(popularAnime);
  //       //print(popularAnime.toString());
  //       popularPage++;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // void fetchRecentAnimeList() async {
  //   try {
  //     isLoading(true);
  //     var recentAnime = await ApiService.fetchRecentAnimeDisplay(recentPage);
  //     if (recentAnime != null) {
  //       recentAnimeDisplayList.addAll(recentAnime);
  //       recentPage++;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onClose() {
    popularAnime.value.scrollController!.dispose();
    recentAnime.value.scrollController!.dispose();
    super.onClose();
  }
}
