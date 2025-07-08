import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/routes/app_routes.dart';
import 'package:news_app/app/theme/theme_controller.dart';
import 'package:news_app/core/utils/size_utils.dart';
import 'package:news_app/features/dashboard/presentation/views/dashboard_screen.dart';
import 'package:news_app/features/splash_screen/presentation/binder/splash_screen_binder.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();
    SizeUtils.initFun(context);
    return Obx(
      () => GetMaterialApp(
        initialBinding: SplashScreenBinder(),
        initialRoute: Routes.splashScreen,
        getPages: AppRoutes.appScreens,
        theme: themeController.getAppTheme().theme(),
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  themeController.switchTheme();
                },
                child: Text('data')),
            MyWidgets()
          ],
        ),
      ),
    );
  }
}

class MyWidgets extends StatefulWidget {
  const MyWidgets({super.key});

  @override
  State<MyWidgets> createState() => _MyWidgetsState();
}

class _MyWidgetsState extends State<MyWidgets> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('data'),
    );
  }
}
