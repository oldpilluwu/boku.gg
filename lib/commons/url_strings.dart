class URLStrings {
  static String hostWebsite = 'https://gogoanime-api-project.herokuapp.com';
  static String getPopularUrl = hostWebsite + '/popular';
  static String getRecentUrl = hostWebsite + '/recent';
  static String getAnimeDetailsUrl = hostWebsite + '/anime';

  static String getPopularUrlFromPage(int page) {
    return getPopularUrl + '/$page';
  }

  static String getRecentUrlFromPage(int page) {
    return getRecentUrl + '/$page';
  }

  static String getAnimeEpisodeUrl(String id, int episode) {
    return getAnimeDetailsUrl + '/$id/$episode';
  }

  static String getSearchUrl(String searchText, int page) {
    String parsedSearchUrl = searchText.replaceAll(" ", "%20");
    return hostWebsite + '/?search=$parsedSearchUrl&page=$page';
  }

  static String getGenreUrl(String genre) {
    return hostWebsite + '/genre/$genre';
  }
}
