import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:newmovie/app/data/model/movie.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController( MovieImplament(Client())),tag: (Get.arguments as Movie).id.toString());
  }
}
