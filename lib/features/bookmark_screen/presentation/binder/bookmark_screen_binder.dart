import 'package:get/get.dart';

import '../controller/bookmark_controller.dart';

class BookMarkScreenBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(BookmarkScreenController());
  }
}