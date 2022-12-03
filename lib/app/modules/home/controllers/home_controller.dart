import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newmovie/app/const/snackbar.dart';
import 'package:newmovie/app/data/model/movie.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';

class HomeController extends GetxController {
  final InternetConnectionChecker internetConnectionChecker;
  final MovieImplament movieImplament;
  HomeController(this.movieImplament, this.internetConnectionChecker);

  bool connected = true;
  bool loading = true;
  List<Movie> data = [];
  BuildContext? context;

  void addContext(BuildContext value) => context = value;

  void getNow() async {
    final respone = await movieImplament.getNow();
    if (respone.statusCode == 200) {
      data = respone.listMovie!;
      loading = false;
      getAll();
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

  void getAll(){
    if(connected){
      getNow();
    }else{
      appSncakbar();
    }
  }

  @override
  void onInit() {
    loading = true;
    
    internetConnectionChecker.onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          connected = true;
          if (kDebugMode) {
            print('Data connection is available.');
          }

          break;
        case InternetConnectionStatus.disconnected:
          connected = false;

          break;
      }
    });
    super.onInit();
  }
}
