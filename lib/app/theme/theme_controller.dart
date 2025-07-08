import 'package:get/get.dart';
import 'package:news_app/app/theme/app_theme.dart';
import 'package:news_app/app/theme/dark_theme.dart';
import 'package:news_app/app/theme/light_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;
  AppTheme getAppTheme() => isDarkTheme.value ? DarkTheme() : LightTheme();
  AppTheme switchTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    return getAppTheme();
  }
}
