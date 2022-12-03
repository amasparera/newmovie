import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmovie/app/const/app_color.dart';

class SearchAndButton extends StatelessWidget {
  final bool ishome;
  const SearchAndButton({
    Key? key,
    this.ishome = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: (ishome == true) ? 18 : 0, right: 18),
      child: SizedBox(
        height: Get.width * .12,
        child: GestureDetector(
          onTap: () {
            (ishome == true) ? Get.toNamed('search') : null;
          },
          child: TextField(
            autofocus: (ishome == true) ? false : true,
            enabled: (ishome == true) ? false : true,
            decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                prefixIcon:  const Icon(
                  Icons.search_rounded,
                  color:AppColor. baseColor,
                ),
                fillColor: const Color(0xffFEF6ED),
                hintText: 'Search Movies',
                hintStyle: TextStyle(
                    color:AppColor. baseColor.withOpacity(.4), fontSize: 12)),
          ),
        ),
      ),
    );
  }
}