import 'package:dio/dio.dart';
import '../../app/widgets/common_widgets.dart';
import '../common_models/common_model.dart';
import 'network_endpoints.dart';

class NetworkService {
  static final NetworkService networkService = NetworkService._init();
  late Dio dio;
  NetworkService._init()
      : dio = Dio(BaseOptions(baseUrl: NetworkEndpoints.baseurl));
  factory NetworkService() => networkService;
  Future<CommonModel> getApiCall(
      {required String url, required Map<String, dynamic> data}) async {
    CommonModel model;
    customLog('this is url ${NetworkEndpoints.baseurl}$url', name: "Url");
    try {
      data['apiKey'] = NetworkEndpoints.apiKey;
      customLog("this is data ${data.toString()}");
      Response response = await dio.get(url, queryParameters: data);
      customLog(' ${response.data}', name: "Url");
      model = CommonModel(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      customLog("${e.response?.data['status']}");
      customLog("${e.response?.data['code']}");

      customLog('This is dioException $e', name: "getApiCall");
      model = CommonModel(
          status: e.response?.data['status'],
          statusCode: int.tryParse(e.response?.data['code']) ?? 400,
          errorMsg: e.response?.data['message'] ??
              NetworkEndpoints.commonApiErrorMessage,
          data: null);
    } catch (e) {
      customLog('This is dioException $e', name: "getApiCall");
      model = CommonModel(
          statusCode: 400,
          errorMsg: NetworkEndpoints.commonApiErrorMessage,
          data: null);
    }
    return model;
  }
}
