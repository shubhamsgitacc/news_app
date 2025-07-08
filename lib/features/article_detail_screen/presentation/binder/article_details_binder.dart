import 'package:get/get.dart';
import 'package:news_app/features/article_detail_screen/presentation/controller/article_details_controlller.dart';

class ArticleDetailsScreenBinder extends Bindings{
  @override
  void dependencies() {
  Get.put(ArticleDetailsController());
  }

}