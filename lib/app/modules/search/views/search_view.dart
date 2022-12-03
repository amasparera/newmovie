import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newmovie/app/const/app_color.dart';

import '../../../widget/card_search.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.baseColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: TextField(
              onSubmitted: (value) => controller.search(value),
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: AppColor.baseColor,
                  ),
                  fillColor: const Color(0xffFEF6ED),
                  hintText: 'Search Movies',
                  hintStyle: TextStyle(
                      color: AppColor.baseColor.withOpacity(.4), fontSize: 12)),
            ),
          ),
          Expanded(child: GetBuilder<SearchController>(builder: (context) {
            return controller.loading
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    itemCount: 4,
                    itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.colorGrey.withOpacity(.15),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8)),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          AppColor.colorGrey.withOpacity(.15),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8)),
                                Container(
                                    height: 20,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          AppColor.colorGrey.withOpacity(.15),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8)),
                              ],
                            ),
                          ],
                        ))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) =>
                        CardSearch(movie: controller.data[index]),
                  );
          }))
        ],
      )),
    );
  }
}
