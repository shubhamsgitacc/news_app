import 'package:get/get.dart';
import 'package:news_app/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:news_app/features/home_screen/data/repository/home_repo_impl.dart';
import 'package:news_app/features/home_screen/domain/repository/home_repository.dart';
import 'package:news_app/features/home_screen/domain/usecases/home_screen_usecases.dart';
import 'package:news_app/features/home_screen/presentation/controller/home_screen_controller.dart';


class DashBoardScreenBinder extends Bindings {
  @override
  void dependencies() {

    Get.put(DashboardController());
    ///home binders
    Get.lazyPut<HomeScreenRepository>(()=>HomeScreenRepoImpl());
    Get.lazyPut<HomeScreenUseCases>(()=>HomeScreenUseCases(Get.find<HomeScreenRepository>()));
    Get.put(HomeScreenController(Get.find<HomeScreenUseCases>()));

  }
}
