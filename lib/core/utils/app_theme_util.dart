import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/app/theme/app_theme.dart';
import 'package:news_app/app/theme/theme_binder.dart';
import 'package:news_app/app/theme/theme_controller.dart';

class AppThemeUtil {
  static final AppThemeUtil appThemeUtil = AppThemeUtil._init();
  factory AppThemeUtil()=>appThemeUtil;
  AppThemeUtil._init();
  static ThemeController controller = Get.find<ThemeController>();
  static AppTheme get appTheme => controller.getAppTheme();
  static Color get primaryColor => appTheme.primaryColor();
}
