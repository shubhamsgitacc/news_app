import 'package:news_app/features/home_screen/domain/repository/home_repository.dart';

import '../../../../core/common_models/article_model.dart';

class HomeScreenUseCases {
  final HomeScreenRepository mapRepository;
  HomeScreenUseCases(this.mapRepository);
  Future<List<NewsArticleModel>?> getTopHeadings(
      {required Map<String, dynamic> body}) async {
    return mapRepository.getTopHeadings(body: body);
  }
}
