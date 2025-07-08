import 'package:flutter/material.dart';
import 'package:news_app/features/news_list_screen/presentation/controller/news_list_controller.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsListController controller = NewsListController();
    return Scaffold();
  }
}
