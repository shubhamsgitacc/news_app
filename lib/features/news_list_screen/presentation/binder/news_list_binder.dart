import 'package:get/get.dart';
import 'package:news_app/features/news_list_screen/presentation/controller/news_list_controller.dart';

class NewsListScreenBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsListController());
  }
}
