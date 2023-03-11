import 'package:medteam/Screen/UploadLicense.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class UploadRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> uploadResume(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.uploadResumeEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //
  Future<dynamic> uploadLicense(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.uploadLicence, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
