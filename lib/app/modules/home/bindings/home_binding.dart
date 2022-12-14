import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () =>
          HomeController(MovieImplament(Client()), InternetConnectionChecker()),
    );
  }
}
