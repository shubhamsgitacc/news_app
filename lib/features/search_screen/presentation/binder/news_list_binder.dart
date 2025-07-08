import 'package:get/get.dart';
import 'package:news_app/features/dashboard/presentation/controller/dashboard_controller.dart';

class SearchScreenBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchScreenBinder());
  }
}
