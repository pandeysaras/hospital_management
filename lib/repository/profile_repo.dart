import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> uploadProfilePic(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.uploadProfile, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
