import 'package:get/get.dart';
import 'package:news_app/features/search_screen/presentation/controller/search_screen_controller.dart';

class SearchScreenBinder extends Bindings {
    @override
    void dependencies() {
      Get.put(SearchScreenController());
    }
  }
