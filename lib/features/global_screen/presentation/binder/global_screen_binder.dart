import 'package:get/get.dart';

class GlobalScreenBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(GlobalScreenBinder());
  }
}