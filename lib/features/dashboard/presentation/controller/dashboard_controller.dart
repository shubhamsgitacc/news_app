import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:news_app/app/constants/image_assets.dart';
import 'package:news_app/features/bookmark_screen/presentation/views/bookmark_screen.dart';
import 'package:news_app/features/global_screen/presentation/views/global_screen.dart';
import 'package:news_app/features/home_screen/presentation/views/home_screen.dart';
import 'package:news_app/features/setting_screen/presentation/views/setting_screen.dart';

import '../../../../app/theme/app_theme.dart';
import '../../../../app/theme/theme_controller.dart';
import '../../../../core/utils/size_utils.dart';

class DashboardController extends GetxController {
  ThemeController themeController = Get.find<ThemeController>();
  RxInt currentPage = 0.obs;
  switchTab(int val) {
    currentPage.value = val;
  }

  Widget get currentTab => dashboardScreen[currentPage.value];
  List<Widget> dashboardScreen = [
    HomeScreen(),
    GlobalScreen(),
    BookmarkScreen(),
    SettingScreen()
  ];
  List<String> dashboardIcons =[
    ImageAssets.homeScreenIcon,
    ImageAssets.globalIcon,
    ImageAssets.bookmarkIcon,
    ImageAssets.settingIcon,

  ];
  Widget bottomNavBar() {
    AppTheme appTheme = themeController.getAppTheme();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(color: appTheme.backgroundColor(), boxShadow: [
        BoxShadow(
            color: appTheme.secondaryColor(), offset: Offset(0, -0.1), blurRadius: 2)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          dashboardScreen.length,
          (ind) => InkWell(
            onTap: () {
              switchTab(ind);
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: SizeUtils.mediaQueryData.padding.bottom,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     color: currentPage.value != ind
              //         ? Colors.transparent
              //         : appTheme.secondaryColor()),
              child: SvgPicture.asset(dashboardIcons[ind],
                  width: 20,
                  colorFilter: ColorFilter.mode(
                      currentPage.value != ind
                          ? appTheme.secondaryColor()
                          : appTheme.primaryColor(),
                      BlendMode.srcIn)),
            ),
          ),
        ),
      ),
    );
  }
}
