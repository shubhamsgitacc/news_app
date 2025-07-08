import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/dashboard/presentation/controller/dashboard_controller.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find<DashboardController>();
    return Obx(
      () => Scaffold(
        body: dashboardController.currentTab,
        bottomNavigationBar: dashboardController.bottomNavBar(),
      )
    );
  }
}
