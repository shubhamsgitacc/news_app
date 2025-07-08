import 'package:news_app/core/common_models/article_model.dart';

abstract class HomeScreenRepository{
 Future<List<NewsArticleModel>?> getTopHeadings({required Map<String,dynamic> body});
}