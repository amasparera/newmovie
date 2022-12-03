import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newmovie/app/const/app_color.dart';

import '../../../const/api_app.dart';
import '../../../data/model/movie.dart';
import '../../../widget/card_detail.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Movie data = Get.arguments;
    controller.addContext(context, data);
    return Scaffold(
        backgroundColor: AppColor.baseColor,
        body: Stack(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 4),
                width: double.infinity,
                height: Get.height * .65,
                decoration: BoxDecoration(
                    // border: Border.all(width: 1, color: Colors.white),
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image:
                            NetworkImage(ApiApp.getImage(data.posterPath))))),
            DraggableScrollableSheet(
                minChildSize: .35,
                maxChildSize: .85,
                initialChildSize: .35,
                builder: (contex, scroll) => ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        color: AppColor.baseColor,
                        child: Obx(
                          () => controller.loading.value
                              ? Container(
                                  height: 40,
                                  color: AppColor.colorGrey,
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                )
                              : ListView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 8),
                                  controller: scroll,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 30,
                                        height: 4,
                                        decoration: BoxDecoration(
                                            color: AppColor.colorOrange,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 12),
                                      child: Text(
                                        data.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.timelapse_rounded,
                                          color: AppColor.colorGrey,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          "${controller.detail.value.runtime?.toString() ?? 0} minutes",
                                          style: const TextStyle(
                                              color: AppColor.colorGrey),
                                        ),
                                        const SizedBox(width: 18),
                                        const Icon(
                                          Icons.star,
                                          color: AppColor.colorGrey,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          data.voteAverage.toString(),
                                          style: const TextStyle(
                                              color: AppColor.colorGrey),
                                        )
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(
                                        color: AppColor.colorGrey,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Bugget Production ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          NumberFormat.simpleCurrency().format(
                                              controller.detail.value.budget ??
                                                  0),
                                          style: const TextStyle(
                                              color: AppColor.colorGrey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Text(
                                          "Release date ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                        data.releaseDate !=null?  DateFormat("dd MMMM yyy").format(
                                              DateTime.parse(data.releaseDate!)): "------",
                                          style: const TextStyle(
                                              color: AppColor.colorGrey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                        children: List.generate(
                                      controller.detail.value.genre!.length,
                                      (index) => Container(
                                        margin: const EdgeInsets.only(
                                            right: 4, bottom: 4),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: AppColor.colorOrange
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          controller
                                              .detail.value.genre![index].name,
                                          style: const TextStyle(
                                              color: AppColor.colorOrange),
                                        ),
                                      ),
                                    )),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      child: Divider(
                                        color: AppColor.colorGrey,
                                      ),
                                    ),
                                    const Text(
                                      "Synopsis",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Text(
                                          controller.detail.value.overview ??
                                              "",
                                          style: const TextStyle(
                                              color: AppColor.colorGrey)),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Recomended',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          'More...',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      height: 108,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.recomended.length,
                                          itemBuilder: (contex, index) =>
                                              CardDetail(
                                                  movie: controller
                                                      .recomended[index])),
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Popular',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          'More...',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      height: 108,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.populer.length,
                                          itemBuilder: (contex, index) =>
                                              CardDetail(
                                                  movie: controller
                                                      .populer[index])),
                                    ),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                        )))),
          ],
        ));
  }
}
