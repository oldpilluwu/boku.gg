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
}
