import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmovie/app/const/app_color.dart';

import '../const/api_app.dart';
import '../data/model/movie.dart';
import '../routes/app_pages.dart';

class HomeCard extends StatelessWidget {
  final Movie movie;
  const HomeCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(ApiApp.getImage(movie.backdropPath!)))),
      child: MaterialButton(
        onPressed: () {
          Get.toNamed(Routes.DETAIL, arguments: movie);
        },
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColor.baseColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 100,
                    width: 70,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                ApiApp.getImage(movie.posterPath))))),
                Text(
                  movie.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Rating : ",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    Text(
                      movie.voteAverage,
                      style: const TextStyle(color: AppColor.colorOrange, fontSize: 10),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.visibility,
                      color: AppColor.colorGrey,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.popularity.toString(),
                      style: const TextStyle(color: AppColor.colorGrey, fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
