import 'package:newmovie/app/data/model/movie_detail.dart';

class ResponseMovieDetail {
  final String? message;
  final int statusCode;
  final MovieDetail? movieDetail;

  ResponseMovieDetail(
      {this.message, required this.statusCode, this.movieDetail});

  factory ResponseMovieDetail.fromJson(Map<String, dynamic> map) {
    return ResponseMovieDetail(
      statusCode: 200,
      movieDetail: MovieDetail.fromJson(map),
    );
  }
}
