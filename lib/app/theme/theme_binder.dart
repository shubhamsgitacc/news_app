import 'package:get/get.dart';
import 'package:news_app/app/theme/theme_controller.dart';

class ThemeBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
