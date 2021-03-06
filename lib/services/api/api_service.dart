import 'package:boku_gg/commons/url_strings.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:boku_gg/models/anime_model.dart';
import 'package:boku_gg/models/episode_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<AnimeDisplay>?> fetchAnimeDisplay(
      String? url, int? page) async {
    var response = await client.get(Uri.parse(url! + '/$page'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeDisplayFromJson(jsonString);
    }
  }

  static Future<Anime?> fetchSingleAnime(String? url, String? id) async {
    var response = await client.get(Uri.parse(url! + '/$id'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeFromJson(jsonString);
    }
  }

  static Future<List<Episode>?> fetchEpisode(String id, int episode) async {
    var response =
        await client.get(Uri.parse(URLStrings.getAnimeEpisodeUrl(id, episode)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return episodeFromJson(jsonString);
    }
  }

  static Future<List<AnimeDisplay>?> fetchSearchAnimeDisplay(
      String searchText, int page) async {
    var response =
        await client.get(Uri.parse(URLStrings.getSearchUrl(searchText, page)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeDisplayFromJson(jsonString);
    }
  }

  static Future<List<AnimeDisplay>?> fetchGenreAnimeDisplay(
      String genre) async {
    var response = await client.get(Uri.parse(URLStrings.getGenreUrl(genre)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeDisplayFromJson(jsonString);
    }
  }
}
