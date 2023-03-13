import 'package:medteam/model/state_data_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class StateListRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<StateDataModel> stateListAPi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.stateListEndPoint);
      return response = StateDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}