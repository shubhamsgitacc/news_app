import 'package:get/get.dart';
import 'package:news_app/features/home_screen/data/repository/home_repo_impl.dart';
import 'package:news_app/features/home_screen/domain/repository/home_repository.dart';
import 'package:news_app/features/home_screen/domain/usecases/home_screen_usecases.dart';
import 'package:news_app/features/home_screen/presentation/controller/home_screen_controller.dart';

class HomeScreenBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenRepository>(()=>HomeScreenRepoImpl());
    Get.lazyPut<HomeScreenUseCases>(()=>HomeScreenUseCases(Get.find<HomeScreenRepository>()));
    Get.put(HomeScreenController(Get.find<HomeScreenUseCases>()));
  }
}
