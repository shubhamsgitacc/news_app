import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:news_app/features//bookmark_screen/presentation/views/bookmark_screen.dart';
import 'package:news_app/features//dashboard/presentation/binder/dasboard_binder.dart';
import 'package:news_app/features/article_detail_screen/presentation/binder/article_details_binder.dart';
import 'package:news_app/features/article_detail_screen/presentation/views/article_detail_screen.dart';
import 'package:news_app/features/dashboard/presentation/views/dashboard_screen.dart';
import 'package:news_app/features/global_screen/presentation/binder/global_screen_binder.dart';
import 'package:news_app/features/global_screen/presentation/views/global_screen.dart';
import 'package:news_app/features/home_screen/presentation/binder/home_screen_binder.dart';
import 'package:news_app/features/home_screen/presentation/views/home_screen.dart';
import 'package:news_app/features/news_list_screen/presentation/binder/news_list_binder.dart';
import 'package:news_app/features/news_list_screen/presentation/views/news_list_screen.dart';
import 'package:news_app/features/search_screen/presentation/binder/news_list_binder.dart';
import 'package:news_app/features/search_screen/presentation/views/search_screen.dart';
import 'package:news_app/features/setting_screen/presentation/binder/setting_screen_binder.dart';
import 'package:news_app/features/setting_screen/presentation/views/setting_screen.dart';
import 'package:news_app/features/splash_screen/presentation/binder/splash_screen_binder.dart';

import '../../features/splash_screen/presentation/views/splash_screen.dart';

class AppRoutes {
  static final AppRoutes appRoutes = AppRoutes._init();
  AppRoutes._init();
  static final List<GetPage> appScreens = <GetPage>[
    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashBoardScreenBinder(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinder(),
    ),
    GetPage(
        name: Routes.globalScreen,
        page: () => GlobalScreen(),
        binding: GlobalScreenBinder()),
    GetPage(
      name: Routes.bookmarkScreen,
      page: () => BookmarkScreen(),
    ),
    GetPage(
        name: Routes.settingScreen,
        page: () => SettingScreen(),
        binding: SettingScreenBinder()),
    GetPage(
        name: Routes.splashScreen,
        page: () => SplashScreen(),
        binding: SplashScreenBinder()),
    GetPage(
        name: Routes.newsListScreen,
        page: () => NewsListScreen(),
        binding: NewsListScreenBinder()),
    GetPage(
        name: Routes.searchScreen,
        page: () => SearchScreen(),
        binding: SearchScreenBinder()),
    GetPage(
        name: Routes.articleDetailsScreen,
        page: () => ArticleDetailScreen(),
        binding: ArticleDetailsScreenBinder()),
  ];
}

class Routes {
  static final String dashboardScreen = '/dashboardScreen';
  static final String homeScreen = '/homeScreen';
  static final String settingScreen = '/settingScreen';
  static final String splashScreen = '/splashScreen';
  static final String bookmarkScreen = '/bookmarkScreen';
  static final String globalScreen = '/globalScreen';
  static final String newsListScreen = '/newsListScreen';
  static final String searchScreen = '/searchScreen';
  static final String articleDetailsScreen = '/articleDetailsScreen';

}
