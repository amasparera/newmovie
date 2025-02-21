import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newmovie/app/const/app_color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(
          primaryColor: AppColor.baseColor,
          appBarTheme: const AppBarTheme(backgroundColor: AppColor.baseColor)),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
