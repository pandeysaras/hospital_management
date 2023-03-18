import 'package:medteam/model/logged_in_user_credential_docurment_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class CompleteProfileRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> completeProfile1Api(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.completeProfileInfo1EndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> completeProfile2Api(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.completeProfileInfo2EndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> completeProfile3Api(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.completeProfileInfo3EndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoggedInUserCredentialDocumentModel> loginUserCredDocApi() async {
    print("hey repo there");
    try {
      print("hey 2 there");
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.loggedInUserCredentialDocumentEndPoint);
      print("hey 3 there");
      return response = LoggedInUserCredentialDocumentModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}