import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/routes/app_routes.dart';

class SplashScreenController extends GetxController {

  @override
  onInit(){
    moveToNavigation();
    super.onInit();
  }
  moveToNavigation() async {
    Future.delayed(const Duration(milliseconds: 400),
        () => Get.offAllNamed(Routes.dashboardScreen));
  }
}
