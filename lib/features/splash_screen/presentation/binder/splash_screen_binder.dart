import 'package:get/get.dart';
import 'package:news_app/features/splash_screen/presentation/controller/splash_screen_controller.dart';

class SplashScreenBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }

}