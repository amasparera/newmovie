import 'package:get/get.dart';
import 'package:newmovie/app/domain/implementasi/movie_impl.dart';

class HomeController extends GetxController {
  final MovieImplament movieImplament;
  HomeController(this.movieImplament);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => movieImplament.getNow();
}
