import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> bankDetails(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.bankdetailEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> listOflicenseAPI() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.licenseListEndPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> listStateAPI() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.stateListEndPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
