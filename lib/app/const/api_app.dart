class ApiApp {
  static const String apiKey = "fbb9572d11b5458ac98f02b84f2bafc4";
  static const String baseurl = "https://api.themoviedb.org/3";

  static const String getNow = "$baseurl/movie/now_playing?api_key=$apiKey";
  static const String getPopular = "$baseurl/movie/popular?api_key=$apiKey";
  static String getRecomend(String movieId) =>
      "$baseurl/movie/$movieId/recommendations?api_key=$apiKey";
  static String getDetail(String movieId) =>
      "$baseurl/movie/$movieId?api_key=$apiKey";
  static String getImage(String imageId) =>
      "https://image.tmdb.org/t/p/w500/$imageId";
  static String search(String text) =>
      "$baseurl/search/movie?query=$text&api_key=$apiKey";
}
