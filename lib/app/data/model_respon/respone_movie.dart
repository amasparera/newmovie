import '../model/movie.dart';

class ResponseMovie {
  final String? message;
  final int statusCode;
  final List<Movie>? listMovie;

  ResponseMovie({this.message, required this.statusCode, this.listMovie});

  factory ResponseMovie.fromJson(Map<String, dynamic> map) {
    return ResponseMovie(
        statusCode: 200,
        listMovie: (map["results"] as List<dynamic>)
            .map((e) => Movie.fromJson(e))
            .toList());
  }
}
