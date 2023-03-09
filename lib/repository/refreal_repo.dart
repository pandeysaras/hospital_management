import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class RefralRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> refralAPI(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.refralEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
