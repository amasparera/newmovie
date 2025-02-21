import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newmovie/app/data/model/movie.dart';
import 'package:newmovie/app/data/model/movie_detail.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';


class DetailController extends GetxController {
  final MovieImplament movieImplament;
  DetailController(this.movieImplament);

  var detail = MovieDetail().obs;
  Movie? data;


  var loading = true.obs;
  bool loadingRecomanded = true;
  bool loadingPopular = true;
  BuildContext? context;

  List<Movie> populer = [];
  List<Movie> recomended = [];

  void addContext(BuildContext value, Movie movie) {
    context = value;
 
      getDetail(movie.id);
      getPopular();
      getRecomanded();
 
  }

  void getDetail(int id) async {
    final respone = await movieImplament.getDetail(id.toString());
    if (respone.statusCode == 200) {
      loading.value = false;
      detail.value = respone.movieDetail!;
      update();
    } else {
      loading.value = false;
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error ${respone.statusCode}',
          message: respone.message!,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      ));
      update();
    }
  }

  void getPopular() async {
    final respone = await movieImplament.getPopular();
    if (respone.statusCode == 200) {
      loadingPopular = false;
      populer = respone.listMovie!;
      update();
    } else {
      loadingPopular = false;

      update();
    }
  }

  void getRecomanded() async {
    final respone = await movieImplament.getRecomend("300");
    if (respone.statusCode == 200) {
      loadingRecomanded = false;
      recomended = respone.listMovie!;
      update();
    } else {
      loadingRecomanded = false;

      update();
    }
  }

  @override
  void onInit() { 
    super.onInit();
  }
}
