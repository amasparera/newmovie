import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../domain/implementasi/movie_impl.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(
        InternetConnectionChecker(),
        MovieImplament(Client()),
      ),
    );
  }
}
