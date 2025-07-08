import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/theme/theme_controller.dart';

class ArticleDetailsController extends GetxController{
  RxBool isBookMarked = false.obs;
  ThemeController themeController = Get.find<ThemeController>();
  bookMarkArticle(){
    isBookMarked.value  =!isBookMarked.value;
  }
  String parseContent(String? content) {
    if (content == null) return '';
    return content.split(' [+').first.trim();
  }
}