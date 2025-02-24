import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../const/snackbar.dart';
import '../../../data/model/movie.dart';
import '../../../domain/implementasi/movie_impl.dart';

class XSearchController extends GetxController {
  final MovieImplament movieImplament;
  final count = 0.obs;

  XSearchController( this.movieImplament);

  bool connected = true;
  bool loading = true;
  List<Movie> data = [];

  void search(String text) async {
    loading = true;
    update();
    if (connected) {
      final respone = await movieImplament.search(text != "" ? text : "marvel");
      if (respone.statusCode == 200) {
        data = respone.listMovie!;
        loading = false;
        update();
      } else {
        loading = false;
        update();
      }
    } else {
      appSncakbar();
    }
  }

  @override
  void onInit() {
   
    super.onInit();
  }
}
