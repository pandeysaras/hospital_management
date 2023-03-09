import 'package:medteam/model/speciality_data_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../model/subspeciality_data_model.dart';
import '../resources/app_url.dart';

class SpecAndSubSpecDataRepo {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<SpecialityDataModel> specialityDataApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.specialityIdEndPoint}37");
      return response = SpecialityDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<SubSpecialityDataModel> subSpecialityDataApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${AppUrl.subSpecialityIdEndPoint}23");
      return response = SubSpecialityDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}