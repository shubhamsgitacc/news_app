import 'package:get/get.dart';
import 'package:news_app/app/widgets/common_widgets.dart';
import 'package:news_app/core/common_models/article_model.dart';
import 'package:news_app/core/network/network_endpoints.dart';
import 'package:news_app/core/network/network_services.dart';
import 'package:news_app/features/home_screen/domain/repository/home_repository.dart';
import '../../../../core/common_models/common_model.dart';
class HomeScreenRepoImpl implements HomeScreenRepository {
  @override
  Future<List<NewsArticleModel>?> getTopHeadings(
      {required Map<String, dynamic> body}) async {
    List<NewsArticleModel> list = [];
    try {
      CommonModel model = await NetworkService()
          .getApiCall(url: NetworkEndpoints.getTopHeadLines, data: body);
      if(model.statusCode==200){
        NewsResponse response = NewsResponse.fromJson(model.data);
        list = response.articles;
      }else{
        Get.closeAllSnackbars();
        Get.showSnackbar(commonSnackBar(title: model.status??'', desc: model.errorMsg??''));

      }
    } catch (e) {
      customLog("error while getting top headings", name: "getTopHeadings");
    }
    return list;
  }
}
