import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class HearRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> hearAboutUsEndPoint() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.getHearAboutUs);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postHearAboutUSEndpoint(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.postHearaboutus, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
