import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/theme/app_theme.dart';
import 'package:news_app/app/theme/theme_controller.dart';
import 'package:news_app/app/widgets/common_widgets.dart';
import 'package:news_app/core/common_models/article_model.dart';
import 'package:news_app/core/network/api_data_methods.dart';
import 'package:news_app/core/utils/size_utils.dart';
import 'package:news_app/features/home_screen/domain/usecases/home_screen_usecases.dart';
import '../../../../app/constants/common_lists.dart';
import 'package:intl/intl.dart';

class HomeScreenController extends GetxController {
  HomeScreenUseCases homeScreenUseCases;
  HomeScreenController(this.homeScreenUseCases);
  RxBool primaryLoading = false.obs;
  RxBool secondaryLoading = false.obs;
  RxInt currentPage = 1.obs;
  @override
  onInit() {
    super.onInit();
    getTopHeading(
        category: CommonLists.newsApiCategories[selectedCategory.value]);
    popularNews = [];
    topHeadingsList = [];
  }

  AppTheme appTheme = ThemeController().getAppTheme();
  ScrollController controller = ScrollController();
  String getTime({required String time}) {
    String tm = '';
    DateFormat timeFormat = DateFormat('dd MMM yy, h:mm a');
    try {
      DateTime utcTime = DateTime.parse(time);
      DateTime localTime = utcTime.toLocal();
      tm = timeFormat.format(localTime);
    } catch (e) {
      customLog('Error while parsing time $e');
      DateTime now = DateTime.now();
      tm = timeFormat.format(now);
    }
    return tm;
  }

  onReachedBottom() {
    controller.addListener(() {
      if (controller.position.pixels >=
          (controller.position.maxScrollExtent - SizeUtils.hp(30))) {
        if (!secondaryLoading.value) {
          secondaryLoading.value = true;
          currentPage.value += 1;
          getPopularNews(
              category: CommonLists.newsApiCategories[selectedCategory.value]);
        }
      }
    });
  }

  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  RxInt selectedCategory = 0.obs;
  onTapCategories(int val) {
    selectedCategory.value = val;
    getTopHeading(
        category: CommonLists.newsApiCategories[selectedCategory.value]);
    popularNews = [];
    topHeadingsList = [];
  }

  ///get top headings
  List<NewsArticleModel> topHeadingsList = [];
  List<NewsArticleModel> popularNews = [];

  getTopHeading({required String category}) async {
    primaryLoading.value = true;
    try {
      List<NewsArticleModel> topHeadingsList =
          await homeScreenUseCases.getTopHeadings(
                  body: ApiDataMethods.getTopHeadings(
                      page: 1, category: category)) ??
              <NewsArticleModel>[];
      if (topHeadingsList.length <= 10) {
        this.topHeadingsList = topHeadingsList;
      } else {
        for (int i = 0; i < topHeadingsList.length; i++) {
          if (i <= 10) {
            this.topHeadingsList.add(topHeadingsList[i]);
          } else {
            popularNews.add(topHeadingsList[i]);
          }
        }
      }
      print(topHeadingsList.length);
    } catch (e) {
      customLog("Error while getting data $e", name: "getTopHeading");
    }
    primaryLoading.value = false;
  }

  getPopularNews({required String category}) async {
    try {
      List<NewsArticleModel> topHeadingsList =
          await homeScreenUseCases.getTopHeadings(
                  body: ApiDataMethods.getTopHeadings(
                      page: currentPage.value, category: category)) ??
              <NewsArticleModel>[];
      if (topHeadingsList.isEmpty && currentPage.value > 1) {
        currentPage.value -= 1;
      }
      popularNews += [...topHeadingsList];
    } catch (e) {
      customLog("Error while getting data $e", name: "getTopHeading");
    }

    secondaryLoading.value = false;
  }
}
