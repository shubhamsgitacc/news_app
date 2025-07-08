import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:news_app/app/widgets/common_widgets.dart';
import 'package:news_app/core/common_models/article_model.dart';
import 'package:news_app/core/text_styles/text_style.dart';
import 'package:news_app/core/utils/app_theme_util.dart';
import 'package:news_app/core/utils/size_utils.dart';
import 'package:news_app/features/article_detail_screen/presentation/controller/article_details_controlller.dart';

class ArticleDetailScreen extends StatelessWidget {

  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ArticleDetailsController controller = Get.find<ArticleDetailsController>();
    NewsArticleModel model = Get.arguments;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        bottomSheet: DraggableScrollableSheet(
          maxChildSize: .8,
          initialChildSize: .6-(SizeUtils.mediaQueryData.padding.top / SizeUtils.height),
          minChildSize:.6-(SizeUtils.mediaQueryData.padding.top / SizeUtils.height),
          snap: true,
          expand: false,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
                color: AppThemeUtil.appTheme.backgroundColor(),
                borderRadius: BorderRadius.vertical(top: Radius.circular(13))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 5,width: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(13,),color: controller.themeController.isDarkTheme.value?Colors.white:Colors.black),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomScrollView(
                        shrinkWrap: true,
                        controller: scrollController,
                        slivers: [
                          SliverList.list(children: [
                            Text(model.description??'',style: font20Medium(),),
                            Html(data: controller.parseContent(model.content)),

                            // Text(model.content??'',style: font20Medium(),),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      width: double.infinity,
                      // imageBuilder: ()=>,
                      imageUrl:
                       model.urlToImage??'',  fit: BoxFit.fill,
                      errorWidget: (context, url, error) => Icon(
                        Icons.article,
                        color: AppThemeUtil.primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: commonGradient()
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(model.title??'',maxLines: 3,style: font20Medium(textColor: Colors.white),),
                        sizedBoxH(2)
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                                color: Colors.white.withAlpha(40)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 20,
                                weight: .4,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            controller.bookMarkArticle();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                                color: Colors.white.withAlpha(40)),
                            child: Icon(
                             controller.isBookMarked.value? Icons.bookmark: Icons.bookmark_border_rounded,
                              color: AppThemeUtil.primaryColor,
                              size: 20,
                              weight: .4,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
