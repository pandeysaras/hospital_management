import 'package:medteam/model/industry_data_model.dart';
import 'package:medteam/model/speciality_data_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../model/subspeciality_data_model.dart';
import '../resources/app_url.dart';

class IndustryDataRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<IndustryDataModel> industryDataApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.industryDataEndPoint);
      return response = IndustryDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



}