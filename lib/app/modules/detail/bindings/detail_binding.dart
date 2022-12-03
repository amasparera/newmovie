import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailController>(
      DetailController(MovieImplament(Client()),InternetConnectionChecker()),permanent: true
    );
  }
}
