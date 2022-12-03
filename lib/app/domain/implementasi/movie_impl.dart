import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:newmovie/app/const/api_app.dart';
import 'package:newmovie/app/data/model_respon/respone_movie.dart';
import 'package:newmovie/app/data/model_respon/respone_movie_detail.dart';
import 'package:newmovie/app/domain/repository/movie_repository.dart';

class MovieImplament implements MovieRepository {
  final Client client;

  MovieImplament(this.client);
  @override
  Future<ResponseMovie> getNow() async {
    Uri api = Uri.parse(ApiApp.getNow);

    final respone = await client.get(api);
    final json = jsonDecode(respone.body);
    log(json.toString());

    if (respone.statusCode == 200) {
      return ResponseMovie.fromJson(json);
    } else {
      return ResponseMovie(
          statusCode: respone.statusCode, message: json["status_message"]);
    }
  }

  @override
  Future<ResponseMovieDetail> getDetail(String movieId) async{
    Uri api = Uri.parse(ApiApp.getDetail(movieId));

    final respone = await client.get(api);
    final json = jsonDecode(respone.body);

    log(json.toString());

    if (respone.statusCode == 200) {
      return ResponseMovieDetail.fromJson(json);
    } else {
      return ResponseMovieDetail(
          statusCode: respone.statusCode, message: json["status_message"]);
    }
  }

  @override
  Future<ResponseMovie> getPopular() async {
    Uri api = Uri.parse(ApiApp.getPopular);

    final respone = await client.get(api);
    final json = jsonDecode(respone.body);
    log(json.toString());

    if (respone.statusCode == 200) {
      return ResponseMovie.fromJson(json);
    } else {
      return ResponseMovie(
          statusCode: respone.statusCode, message: json["status_message"]);
    }
  }

  @override
  Future<ResponseMovie> getRecomend(String movieId) async {
    Uri api = Uri.parse(ApiApp.getRecomend(movieId));

    final respone = await client.get(api);
    final json = jsonDecode(respone.body);
    
    log(json.toString());

    if (respone.statusCode == 200) {
      return ResponseMovie.fromJson(json);
    } else {
      return ResponseMovie(
          statusCode: respone.statusCode, message: json["status_message"]);
    }
  }
  
  @override
  Future<ResponseMovie> search(String text)async{
   Uri api = Uri.parse(ApiApp.search(text));

    final respone = await client.get(api);
    final json = jsonDecode(respone.body);
    
    log(json.toString());

    if (respone.statusCode == 200) {
      return ResponseMovie.fromJson(json);
    } else {
      return ResponseMovie(
          statusCode: respone.statusCode, message: json["status_message"]);
    }
  }
}
