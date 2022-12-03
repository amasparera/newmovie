import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newmovie/app/routes/app_pages.dart';

import '../const/api_app.dart';
import '../const/app_color.dart';
import '../data/model/movie.dart';

class CardSearch extends StatelessWidget {
  final Movie movie;
  const CardSearch({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 80,
                  child: Image.network(ApiApp.getImage(movie.posterPath))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "Rating :  ",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            movie.voteAverage,
                            style: const TextStyle(
                                color: AppColor.colorOrange, fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            "Release :  ",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                          movie.releaseDate !=null ?  DateFormat("dd MMMM yyy")
                                .format(DateTime.parse(movie.releaseDate!)):"----",
                            style: const TextStyle(
                                color: AppColor.colorOrange, fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            "View :  ",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.popularity.toString(),
                            style: const TextStyle(
                                color: AppColor.colorGrey, fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed(Routes.DETAIL, arguments: movie);
            },
            padding: EdgeInsets.zero,
            child: Container(),
          )
        ],
      ),
    );
  }
}
