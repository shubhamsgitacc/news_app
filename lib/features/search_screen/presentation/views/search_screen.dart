import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/widgets/common_widgets.dart';
import 'package:news_app/core/text_styles/text_style.dart';
import 'package:news_app/features/search_screen/presentation/controller/search_screen_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenController controller = Get.find<SearchScreenController>();
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              commonLoading(controller.primaryLoading.value),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black),
                          color: getInvertColor()),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: getInvertTextColor(),
                          ),
                          sizedBoxW(.3),
                          Expanded(
                            child: TextFormField(
                              controller: controller.searchController,
                              onChanged: (v) {
                                controller.timer?.cancel();
                                controller.timer = Timer.periodic(
                                    const Duration(
                                      milliseconds: 600,
                                    ), (v) {
                                  print('stopped');
                                });
                                controller.timer?.cancel();
                                // debouncing(
                                //         fun: () {
                                //           print('stopped');
                                //         },
                                //         timer: controller.timer)
                                //     .call();
                              },
                              style:
                                  font16Medium(textColor: getInvertTextColor()),
                              // controller: c,
                              decoration: InputDecoration(
                                  hintStyle: font14Medium(
                                      textColor: getInvertTextColor()),
                                  hintText: "Search Articles",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 1),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxH(1),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Function() debouncing({required Function() fun, Timer? timer}) {
  return () {
    timer?.cancel();
    // if (timer?.isActive ?? false) timer?.cancel();
    timer = Timer(const Duration(milliseconds: 400), () {
      print('object');
    });

    // timer.whenComplete(() {
    //   print('objectsd');
    // });

    // timer.cancel();
  };
}

TextFormField formField = TextFormField(
  onChanged: (v) {},
);
