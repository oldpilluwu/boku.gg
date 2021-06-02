import 'package:boku_gg/commons/url_strings.dart';
import 'package:boku_gg/models/anime_display_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<AnimeDisplay>?> fetchPopularAnimeDisplay(int page) async {
    var response =
        await client.get(Uri.parse(URLStrings.getPopularUrlFromPage(page)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeDisplayFromJson(jsonString);
    }
  }

  static Future<List<AnimeDisplay>?> fetchRecentAnimeDisplay(int page) async {
    var response =
        await client.get(Uri.parse(URLStrings.getRecentUrlFromPage(page)));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeDisplayFromJson(jsonString);
    }
  }

  static Future<List<AnimeDisplay>?> fetchAnimeDisplay(
      String? url, int? page) async {
    var response = await client.get(Uri.parse(url! + '/$page'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return animeDisplayFromJson(jsonString);
    }
  }
}
