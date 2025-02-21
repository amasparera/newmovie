import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newmovie/app/const/app_color.dart';

import '../../../widget/card_home.dart';
import '../../../widget/header_home.dart';
import '../../../widget/search_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.addContext(context);
    return Scaffold(
      backgroundColor: AppColor.baseColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const HeaderAndNotifikasi(),
            const Hero(tag: 'search', child: SearchAndButton()),
            const SizedBox(
              height: 18,
            ),
            GetBuilder<HomeController>(builder: (context) {
              return controller.loading
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                        children: List.generate(
                            3,
                            (index) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        height: 180,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color:
                                              AppColor.colorGrey.withOpacity(.15),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8)),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColor.colorGrey
                                                  .withOpacity(.15),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8)),
                                        Container(
                                            height: 20,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColor.colorGrey
                                                  .withOpacity(.15),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8)),
                                      ],
                                    ),
                                  ],
                                )),
                      ),
                  )
                  : Column(
                      children: List.generate(
                          controller.data.length,
                          (index) => HomeCard(
                                movie: controller.data[index],
                              )),
                    );
            })
          ],
        ),
      ),
    );
  }
}
