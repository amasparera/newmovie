import 'package:newmovie/app/data/model_respon/respone_movie_detail.dart';

import '../../data/model_respon/respone_movie.dart';

abstract class MovieRepository{
  Future<ResponseMovie> getNow();
  Future<ResponseMovie> getPopular();
  Future<ResponseMovie> getRecomend(String movieId);
  Future<ResponseMovieDetail> getDetail(String movieId);
  Future<ResponseMovie> search(String text);
}