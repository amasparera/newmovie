import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmovie/app/data/model/movie.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';

class HomeController extends GetxController {
  final MovieImplament movieImplament;
  HomeController(this.movieImplament);

  bool loading = true;
  List<Movie> data = [];
  BuildContext? context;

  void addContext(BuildContext value) => context = value;

  void getNow() async {
    final respone = await movieImplament.getNow();
    if (respone.statusCode == 200) {
      data = respone.listMovie!;
      loading = false;
      update();
    } else {
      loading = false;
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


  @override
  void onInit() { 
    getNow();
    super.onInit();
  }
}
