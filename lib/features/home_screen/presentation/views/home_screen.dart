
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/constants/common_lists.dart';
import 'package:news_app/app/routes/app_routes.dart';
import 'package:news_app/app/theme/theme_controller.dart';
import 'package:news_app/app/widgets/common_widgets.dart';
import 'package:news_app/core/common_models/article_model.dart';
import 'package:news_app/core/utils/size_utils.dart';
import 'package:news_app/features/home_screen/presentation/controller/home_screen_controller.dart';
import '../../../../core/text_styles/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.find<HomeScreenController>();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller.onReachedBottom());
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Scaffold(
            body: Stack(
              children: [
                commonLoading(controller.primaryLoading.value),
                Center(
                    child: noDataFoundWidget(
                        visible: !controller.primaryLoading.value &&
                            (controller.topHeadingsList.isEmpty &&
                                controller.popularNews.isEmpty))),
                SingleChildScrollView(
                  controller: controller.controller,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.getTopHeading(
                          category: CommonLists.newsApiCategories[
                              controller.selectedCategory.value]);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My News",
                              style: font20Medium(),
                            ),
                            InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.searchScreen);
                                },
                                child: Icon(
                                  Icons.search,
                                  color: controller.appTheme.textColor(),
                                )),
                          ],
                        ),
                        sizedBoxH(1),
                        IntrinsicHeight(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                                  CommonLists.newsApiCategories.length,
                                  (index) => Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: commonButtonCategory(
                                            isSelected: controller
                                                    .selectedCategory.value ==
                                                index,
                                            onTap: () {
                                              controller.onTapCategories(index);
                                            },
                                            text: CommonLists
                                                .newsApiCategories[index]),
                                      ))),
                        )),
                        if (controller.topHeadingsList.isNotEmpty) ...[
                          sizedBoxH(1.5),
                          TopHeadlinesSection(list: controller.topHeadingsList),
                          sizedBoxH(1.5),
                        ],
                        if (controller.popularNews.isNotEmpty) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular News",
                                style: font18Medium(),
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(Routes.newsListScreen),
                                child: Text(
                                  "View all",
                                  style: font16Medium(
                                      textColor:
                                          controller.appTheme.primaryColor()),
                                ),
                              ),
                            ],
                          ),
                          sizedBoxH(1.7),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.popularNews.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                NewsArticleModel model =
                                    controller.popularNews[index];
                                return articleTile(
                                  fun: () {
                                    pushToArticleScreen(model: model);
                                  },
                                  primaryColor:
                                      controller.appTheme.primaryColor(),
                                  time: controller.getTime(
                                      time: model.publishedAt ??
                                          "${DateTime.now()}"),
                                  model: model,
                                );
                              }),
                        ],
                        Visibility(
                          visible: controller.secondaryLoading.value,
                          child: SizedBox(
                            height: 10.h,
                            child: Center(
                              child: commonLoading(
                                  controller.secondaryLoading.value),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopHeadlinesSection extends StatelessWidget {
  final List<NewsArticleModel> list;
  const TopHeadlinesSection({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Top Headlines",
        style: font18Medium(),
      ),
      sizedBoxH(1.8),
      CarouselSlider.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            InkWell(
          onTap: () {
            pushToArticleScreen(model: list[itemIndex]);
            // Get.toNamed(Routes.articleDetailsScreen,
            //     arguments: list[itemIndex]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            clipBehavior: Clip.hardEdge,
            width: SizeUtils.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: SizeUtils.width,
                  color: Colors.white,
                  child: CachedNetworkImage(
                    // imageBuilder: ()=>,
                    imageUrl: list[itemIndex].urlToImage ?? '',
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(
                      Icons.article,
                      color: ThemeController().getAppTheme().primaryColor(),
                    ),
                  ),
                ),
                Container(
                    height: 300,
                    width: SizeUtils.width,
                    // color: Colors.blueAccent,
                    decoration: BoxDecoration(gradient: commonGradient()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          list[itemIndex].title ?? '',
                          style: font18Medium(textColor: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        // carouselController: cont,
        options: CarouselOptions(
            onPageChanged: (val, _) {},
            viewportFraction: 1,
            padEnds: true,
            pageSnapping: true,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(
              milliseconds: 300,
            )),
      ),
    ]);
  }
}
