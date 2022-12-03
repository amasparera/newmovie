import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmovie/app/const/api_app.dart';
import 'package:newmovie/app/const/app_color.dart';

import '../data/model/movie.dart';
import '../routes/app_pages.dart';

class CardDetail extends StatelessWidget {
  final Movie movie;
  const CardDetail({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      height: 100,
      width: 70,
      decoration: BoxDecoration(
          color: AppColor.colorGrey,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(ApiApp.getImage(movie.posterPath)))),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          print(movie.id);
          Get.toNamed(Routes.DETAIL,
              arguments: movie, preventDuplicates: false);
          // print("tab");
        },
        child: Container(),
      ),
    );
  }
}
