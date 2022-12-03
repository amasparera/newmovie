import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future appSncakbar() {
  return Get.dialog(Dialog(
    child: Container(
      width: Get.width * .7,
      height: Get.width * .8,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Lottie.asset(
              "assets/9293-not-signal-no-internet-access-and-connection-lost-placeholder.json"),
          const Text(
            "No Internet",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  ));
}
